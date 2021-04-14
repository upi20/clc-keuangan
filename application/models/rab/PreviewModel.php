<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class PreviewModel extends Render_Model {

	
	public function getAllData($show=null, $start=null, $cari=null){
		$exe 				 = $this->db->select_sum('a.total_harga_ringgit')->select('b.kode as npsn, b.nama as nama_cabang, a.status as status')
									->from(' rabs a')
									->join(' cabangs b', ' a.id_cabang = b.id ', ' left ')
									->join(' aktifitas c', ' a.id_aktifitas = c.id ', ' left ')
									->group_by('b.kode')
									->get();

		return $exe;
	}

	public function getAllDataDetail($show=null, $start=null, $cari=null, $npsn=null){
		$exe 				 = $this->db->select(' * , b.kode as npsn, b.nama as nama_cabang, a.nama as nama_aktifitas, a.status as statuss, a.kode as kodes')
									->from(' rabs a')
									->join(' cabangs b', ' a.id_cabang = b.id ', ' left ')
									->join(' aktifitas c', ' a.id_aktifitas = c.id ', ' left ')
									->where(' b.kode ', $npsn)
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
}	

/* End of file LevelModel.php */
/* Location: ./application/models/rab/PreviewModel.php */