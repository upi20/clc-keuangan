<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class AktifitasModel extends Render_Model {

	
	public function getAllData($show=null, $start=null, $cari=null){
		$exe 	 = $this->db->select(' a.*, b.kode as pengkodean ')
							->from(' aktifitas a ')
							->join(' aktifitas b ', ' b.id = a.id_pengkodeans ', ' left ')
							->get();

		return $exe;
	}


	public function getDataDetail($id)
	{
		$exe 						= $this->db->get_where('aktifitas', ['id' => $id]);

		return $exe->row_array();
	}

	public function insert($id_pengkodeans, $kode, $uraian, $status)
	{
		$data['id_pengkodeans'] 	= $id_pengkodeans;
		$data['kode'] 				= $kode;
		$data['uraian'] 			= $uraian;
		$data['status'] 			= $status;

		$exe 						= $this->db->insert('aktifitas', $data);
		$exe 						= $this->db->insert_id();

		return $exe;
	}


	public function update($id, $id_pengkodeans, $kode, $uraian, $status)
	{
		$data['id_pengkodeans'] 	= $id_pengkodeans;
		$data['kode'] 				= $kode;
		$data['uraian'] 			= $uraian;
		$data['status'] 			= $status;

		$exe 						= $this->db->where('id', $id);
		$exe 						= $this->db->update('aktifitas', $data);

		return $exe;
	}


	public function delete($id)
	{
		$exe 						= $this->db->where('id', $id);
		$exe 						= $this->db->delete('aktifitas');

		return $exe;
	}


}

/* End of file LevelModel.php */
/* Location: ./application/models/pengaturan/LevelModel.php */