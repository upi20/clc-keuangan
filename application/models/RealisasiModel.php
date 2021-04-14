<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class RealisasiModel extends Render_Model {

	
	public function getAllDataDetail($show=null, $start=null, $cari=null, $npsn=null){
		$exe 				 = $this->db->select(' * , b.kode as npsn, b.nama as nama_cabang, a.nama as nama_aktifitas, a.status as statuss, a.kode as kodes,z.id as id_realisasi, a.id')
									->from(' rabs  a')
									->join(' realisasis z ', ' a.id = z.id_rab ', ' left ')
									->join(' cabangs b', ' a.id_cabang = b.id ', ' left ')
									->join(' aktifitas c', ' a.id_aktifitas = c.id ', ' left ')
									// ->where(' b.kode ', $npsn)
									->where(' b.id_cabang ', 1)
									->get();

		return $exe;
	}

	public function getTotalHarga($npsn){
		$exe 				 = $this->db->select_sum('total_harga_ringgit')
									->from(' rabs a')
									->join(' cabangs b', ' a.id_cabang = b.id ', ' left ')
									->join(' aktifitas c', ' a.id_aktifitas = c.id ', ' left ')
									->where(' b.kode ', $npsn)
									->get()
									->row_array();
		return $exe;
	}

	public function getTotalHargaRupiah($npsn){
		$exe 				 = $this->db->select_sum('total_harga_rupiah')
									->from(' rabs a')
									->join(' cabangs b', ' a.id_cabang = b.id ', ' left ')
									->join(' aktifitas c', ' a.id_aktifitas = c.id ', ' left ')
									->where(' b.kode ', $npsn)
									->get()
									->row_array();
		return $exe;
	}

	public function insert($id, $id_cabang, $nama, $keterangan, $harga_ringgit, $harga_rupiah, $tanggal) {
		$upload = $_FILES["file"]["name"];
		if($upload == null){
			$sql = "INSERT INTO realisasis (id_rab, id_cabang, nama, keterangan, harga_ringgit, harga_rupiah, tanggal) VALUES (?, ?, ?, ?, ?, ?, ?);";
			$stok_selisih = 0;
			$q = $this->db->query($sql, [$id, $id_cabang, $nama, $keterangan, $harga_ringgit, $harga_rupiah, $tanggal]);
		}else{
			$gambar = $this->_uploadImage();
			$sql = "INSERT INTO realisasis (id_rab, id_cabang, nama, keterangan, harga_ringgit, harga_rupiah, tanggal, gambar) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
			$q = $this->db->query($sql, [$id, $id_cabang, $nama, $keterangan, $harga_ringgit, $harga_rupiah, $tanggal, $gambar]);
		}
		
		$return['id'] = $this->db->insert_id();
		return $return;
	}

	public function _uploadImage($file=null)
    {
        $config['upload_path']          = './gambar/';
        $config['allowed_types']        = 'gif|jpg|png|jpeg';
        $config['file_name']            = $file;
        $config['overwrite']            = true;
        $config['max_size']             = 8024;
        $this->load->library('upload', $config);
        $this->upload->initialize($config);
        if ($this->upload->do_upload('file')) {
            return $this->upload->data("file_name");
        }
    }
}	

/* End of file LevelModel.php */
/* Location: ./application/models/rab/PreviewModel.php */