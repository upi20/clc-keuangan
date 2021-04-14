<?php
defined('BASEPATH') or exit('No direct script access allowed');

class CabangModel extends Render_Model
{


	public function getAllData($show = null, $start = null, $cari = null)
	{

		if ($this->session->userdata('data')['level'] == 'Super Admin') {
			$where = array();
		} elseif ($this->session->userdata('data')['level'] == 'Admin Sekolah') {
			$where = array(
				'b.user_id' => $this->session->userdata('data')['id']
			);
		}

		$exe 				 = $this->db->select(' * ,b.nama as nama_cabang, a.nama as nama_aktifitas, a.status as statuss, a.kode as kodes')
			->from(' rabs a')
			->join(' cabangs b', ' a.id_cabang = b.id ', ' left ')
			->join(' aktifitas c', ' a.id_aktifitas = c.id ', ' left ')
			->where($where)
			->get();

		return $exe;
	}


	public function getDataDetail($id)
	{
		$exe 						= $this->db->get_where('rabs', ['id' => $id]);

		return $exe->row_array();
	}

	public function getDataAktifitas($id)
	{
		$exe 						= $this->db->get_where('rabs', ['id_aktifitas' => $id]);

		return $exe->result_array();
	}

	public function insert($id_cabang, $id_aktifitas, $id_aktifitas_sub, $id_aktifitas_cabang, $kode_isi_1 = 0, $kode_isi_2 = 0, $kode_isi_3 = 0, $kode, $nama, $jumlah_1, $satuan_1, $jumlah_2, $satuan_2, $jumlah_3, $satuan_3, $jumlah_4, $satuan_4, $harga_ringgit, $harga_rupiah, $total_harga_ringgit, $total_harga_rupiah, $prioritas, $status)
	{

		$data['id_cabang']			= $id_cabang;
		$data['id_aktifitas']		= $id_aktifitas_sub;
		$data['kode_isi_1']			= $id_aktifitas_cabang;
		$data['kode_isi_2'] 		= $kode_isi_1;
		$data['kode_isi_3'] 		= $kode_isi_2;
		$data['kode'] 				= $kode;
		$data['nama'] 				= $nama;
		$data['jumlah_1'] 			= $jumlah_1;
		$data['satuan_1'] 			= $satuan_1;
		$data['jumlah_2'] 			= $jumlah_2;
		$data['satuan_2'] 			= $satuan_2;
		$data['jumlah_3'] 			= $jumlah_3;
		$data['satuan_3'] 			= $satuan_3;
		$data['jumlah_4'] 			= $jumlah_4;
		$data['satuan_4'] 			= $satuan_4;
		$data['harga_ringgit'] 		= $harga_ringgit;
		$data['harga_rupiah']		= $harga_rupiah;
		$data['total_harga_ringgit'] = $total_harga_ringgit;
		$data['total_harga_rupiah']	= $total_harga_rupiah;
		$data['prioritas']			= $prioritas;
		$data['status']				= $status;

		$exe 						= $this->db->insert('rabs', $data);
		$exe 						= $this->db->insert_id();

		return $exe;
	}


	public function update($id, $id_cabang, $id_aktifitas, $kode_isi_1, $kode_isi_2, $kode_isi_3, $kode, $nama, $satuan, $harga_ringgit, $harga_rupiah, $jumlah, $total_harga_ringgit, $total_harga_rupiah, $prioritas, $status)
	{
		$data['id_cabang']			= $id_cabang;
		$data['id_aktifitas']		= $id_aktifitas_sub;
		$data['kode_isi_1']			= $id_aktifitas_cabang;
		$data['kode_isi_2'] 		= $kode_isi_1;
		$data['kode_isi_3'] 		= $kode_isi_2;
		$data['kode'] 				= $kode;
		$data['nama'] 				= $nama;
		$data['satuan'] 			= $satuan;
		$data['harga_ringgit'] 		= $harga_ringgit;
		$data['harga_rupiah']		= $harga_rupiah;
		$data['jumlah'] 			= $jumlah;
		$data['total_harga_ringgit'] = $total_harga_ringgit;
		$data['total_harga_rupiah']	= $total_harga_rupiah;
		$data['prioritas']			= $prioritas;
		$data['status']				= $status;

		$exe 						= $this->db->where('id', $id);
		$exe 						= $this->db->update('rabs', $data);

		return $exe;
	}


	public function delete($id)
	{
		$exe 						= $this->db->where('id', $id);
		$exe 						= $this->db->delete('rabs');

		return $exe;
	}

	public function getCabang()
	{
		if ($this->session->userdata('data')['level'] == 'Super Admin') {
			$where = array();
		} elseif ($this->session->userdata('data')['level'] == 'Admin Sekolah') {
			$where = array(
				'user_id' => $this->session->userdata('data')['id']
			);
		}
		$exe 						= $this->db->get_where('cabangs', $where);
		return $exe->result_array();
	}

	public function getAktifitas()
	{
		$exe 						= $this->db->get_where('aktifitas', ['id_pengkodeans' => 0]);
		return $exe->result_array();
	}

	public function getAktifitasSub($id_aktifitas)
	{
		$exe 						= $this->db->get_where('aktifitas', ['id_pengkodeans' => $id_aktifitas]);
		return $exe->result_array();
	}

	public function getAktifitasCabang($id_aktifitas_sub)
	{
		if ($this->session->userdata('data')['level'] == 'Super Admin') {
			$where = array(
				'a.id_aktifitas' 	=> $id_aktifitas_sub,
				'a.kode_isi_1'		=> 0
			);
		} elseif ($this->session->userdata('data')['level'] == 'Admin Sekolah') {
			$where = array(
				'a.id_aktifitas' 	=> $id_aktifitas_sub,
				'a.kode_isi_1'		=> 0,
				'b.user_id' => $this->session->userdata('data')['id']
			);
		}
		$exe 						= $this->db->select('a.*')->join('cabangs b', 'b.id = a.id_cabang')->get_where('rabs a', $where);
		return $exe->result_array();
	}

	public function getAktifitasCabangKodeIsi1($id_aktifitas_cabang)
	{
		if ($this->session->userdata('data')['level'] == 'Super Admin') {
			$where = array(
				'a.kode_isi_1' 		=> $id_aktifitas_cabang,
				'a.kode_isi_2'		=> 0
			);
		} elseif ($this->session->userdata('data')['level'] == 'Admin Sekolah') {
			$where = array(
				'a.kode_isi_1' 		=> $id_aktifitas_cabang,
				'a.kode_isi_2'		=> 0,
				'b.user_id' => $this->session->userdata('data')['id']
			);
		}
		$exe 						= $this->db->select('a.*')->join('cabangs b', 'b.id = a.id_cabang')->get_where('rabs a', $where);
		return $exe->result_array();
	}

	public function getAktifitasCabangKodeIsi2($kode_isi_1)
	{
		if ($this->session->userdata('data')['level'] == 'Super Admin') {
			$where = array(
				'a.kode_isi_2' 		=> $kode_isi_1,
				'a.kode_isi_3'		=> 0
			);
		} elseif ($this->session->userdata('data')['level'] == 'Admin Sekolah') {
			$where = array(
				'a.kode_isi_2' 		=> $kode_isi_1,
				'a.kode_isi_3'		=> 0,
				'b.user_id' => $this->session->userdata('data')['id']
			);
		}
		$exe 						= $this->db->select('a.*')->join('cabangs b', 'b.id = a.id_cabang')->get_where('rabs a', $where);
		return $exe->result_array();
	}

	public function getAktifitasCabangKodeIsi3($kode_isi_2)
	{
		$exe 						= $this->db->get_where('rabs', ['kode_isi_3' => $kode_isi_2]);
		return $exe->result_array();
	}
}

/* End of file LevelModel.php */
/* Location: ./application/models/rab/CabangModel.php */