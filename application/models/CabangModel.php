<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class CabangModel extends Render_Model {

	
	public function getAllData($show=null, $start=null, $cari=null){
		$this->db->select(" a.id, a.kode, a.nama, b.user_email, a.no_telpon, a.alamat, a.status, a.user_id, a.jumlah_kelas_7, a.jumlah_kelas_8, a.jumlah_kelas_9, a.total_jumlah_siswa, a.jumlah_guru_bina, a.jumlah_guru_pamong, a.total_jumlah_guru ");
		$this->db->from(" cabangs a ");
		$this->db->join(" users b ", "a.user_id = b.user_id", 'left');
		// $this->db->join(" tutor c ", "c.tutor_id = a.bimbin_tutor_id", 'left');
		if ($show == null && $start == null){
			$return = $this->db->get();
		}else{
			$this->db->limit($show, $start);   
			$return = $this->db->get();
		}
		return $return;
	}


	public function getDataDetail($id)
	{
		$exe 						= $this->db->join('users b','b.user_id = a.user_id')->get_where('cabangs a', ['a.id' => $id]);
		return $exe->row_array();
	}

	public function insert($kode, $nama, $no_telpon, $alamat, $status, $email, $jumlah_kelas_7, $jumlah_kelas_8, $jumlah_kelas_9, $jumlah_guru_bina, $jumlah_guru_pamong)
	{
		$password = $this->b_password->bcrypt_hash(123456);
		$user['user_nama'] 			= $nama;
		$user['user_email'] 		= $email;
		$user['user_password'] 		= $password;
		$exe_user 					= $this->db->insert('users', $user);
		$id_user 					= $this->db->insert_id();

		$role_user['role_user_id'] 	= $id_user;
		$role_user['role_lev_id'] 	= 4;
		$exe_role_user 				= $this->db->insert('role_users', $role_user);

		$data['kode'] 				= $kode;
		$data['nama'] 				= $nama;
		$data['no_telpon'] 			= $no_telpon;
		$data['alamat'] 			= $alamat;
		$data['status'] 			= $status;
		$data['user_id'] 			= $id_user;
		$data['jumlah_kelas_7']		= $jumlah_kelas_7;
		$data['jumlah_kelas_8']		= $jumlah_kelas_8;
		$data['jumlah_kelas_9']		= $jumlah_kelas_9;
		$total_jumlah_siswa = $jumlah_kelas_7 + $jumlah_kelas_8 + $jumlah_kelas_9;
		$data['total_jumlah_siswa']	= $total_jumlah_siswa;
		$data['jumlah_guru_bina']	= $jumlah_guru_bina;
		$data['jumlah_guru_pamong']	= $jumlah_guru_pamong;
		$total_jumlah_guru = $jumlah_guru_bina + $jumlah_guru_pamong;
		$data['total_jumlah_guru']	= $total_jumlah_guru;

		$exe 						= $this->db->insert('cabangs', $data);
		$exe2['id'] 				= $this->db->insert_id();
		return $exe;

		// $exe 						= $this->db->insert('cabangs', $data);
		// $exe 						= $this->db->insert_id();

	}


	public function update($id, $id_user, $kode, $nama, $no_telpon, $alamat, $status, $email, $jumlah_kelas_7, $jumlah_kelas_8, $jumlah_kelas_9, $jumlah_guru_bina, $jumlah_guru_pamong)
	{
		$user['user_nama'] 			= $nama;
		$user['user_email'] 		= $email;
		$exe_user 					= $this->db->where('user_id', $id_user);
		$exe_user 					= $this->db->update('users', $user);

		$data['kode'] 				= $kode;
		$data['nama']			 	= $nama;
		$data['no_telpon']		 	= $no_telpon;
		$data['alamat']			 	= $alamat;
		$data['status']		 		= $status;
		$data['jumlah_kelas_7']		= $jumlah_kelas_7;
		$data['jumlah_kelas_8']		= $jumlah_kelas_8;
		$data['jumlah_kelas_9']		= $jumlah_kelas_9;
		$total_jumlah_siswa = $jumlah_kelas_7 + $jumlah_kelas_8 + $jumlah_kelas_9;
		$data['total_jumlah_siswa']	= $total_jumlah_siswa;
		$data['jumlah_guru_bina']	= $jumlah_guru_bina;
		$data['jumlah_guru_pamong']	= $jumlah_guru_pamong;
		$total_jumlah_guru = $jumlah_guru_bina + $jumlah_guru_pamong;
		$data['total_jumlah_guru']	= $total_jumlah_guru;

		$exe 						= $this->db->where('id', $id);
		$exe 						= $this->db->update('cabangs', $data);

		return $exe;
	}


	public function delete($id)
	{
		$exe 						= $this->db->where('id', $id);
		$exe 						= $this->db->delete('cabangs');

		return $exe;
	}


}

/* End of file LevelModel.php */
/* Location: ./application/models/pengaturan/LevelModel.php */