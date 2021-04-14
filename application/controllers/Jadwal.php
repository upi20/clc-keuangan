<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Jadwal extends Render_Controller {

	
	public function index()
	{
		// Page Settings
		$this->title 					= 'Jadwal';
		$this->content 					= 'jadwal';
		$this->navigation 				= ['Jadwal'];
		$this->plugins 					= ['datatables'];

		// Breadcrumb setting
		$this->breadcrumb_1 			= 'Dashboard';
		$this->breadcrumb_1_url 		= base_url() . 'dashboard';
		$this->breadcrumb_2 			= 'Jadwal';
		$this->breadcrumb_2_url 		= '#';

		$this->data['mapel'] 			= $this->db->get('mata_pelajaran')->result_array();
		$this->data['kota'] 			= $this->db->get('kota_kab')->result_array();

		// Send data to view
		$this->render();
	}


	// Ajax Data
	public function ajax_data()
	{
		$status 	= $this->input->post('status');
		$start 	= $this->input->post('start');
		$draw 	= $this->input->post('draw');
		$length = $this->input->post('length');
		$cari 	= $this->input->post('search');
		if(isset($cari['value'])){
			$_cari = $cari['value'];
		}else{
			$_cari = null;
		}
		$data 	= $this->jadwal->getAllData($length, $start, $_cari, $status)->result_array();
		$count 	= $this->jadwal->getAllData(null,null, $_cari, $status)->num_rows();
		
		array($cari);

		echo json_encode(array('recordsTotal'=>$count, 'recordsFiltered'=> $count, 'draw'=>$draw, 'search'=> $_cari, 'data'=>$data));
	}


	// Soal
	public function getSoalData()
	{
		$id 							= $this->input->post('id');

		$exe 							= $this->jadwal->getSoalData($id);

		$this->output_json($exe);
	}


	// Get data detail
	public function getDataDetail()
	{
		$id 							= $this->input->post('id');

		$exe 							= $this->jadwal->getDataDetail($id);

		$this->output_json($exe);
	}


	// Insert data
	public function insert()
	{
		$soal 							= $this->input->post('soal');
		$kota 							= $this->input->post('kota');
		$mode_jadwal 					= $this->input->post('mode_jadwal');
		$mode_timer 					= $this->input->post('mode_timer');
		$waktu_mulai 					= $this->input->post('waktu_mulai');
		$waktu_selesai 					= $this->input->post('waktu_selesai');
		$status 						= $this->input->post('status');

		$exe 							= $this->jadwal->insert($soal, $kota, $mode_jadwal, $mode_timer, $waktu_mulai, $waktu_selesai, $status);
		$this->output_json(1);
	}


	// Update data
	public function update()
	{
		$id 							= $this->input->post('id');
		$jenis_kota 					= $this->input->post('jenis_kota');
		$id_mata_pelajaran 				= $this->input->post('id_mata_pelajaran');
		$model 							= $this->input->post('model');
		$status 						= $this->input->post('status');

		$exe 							= $this->jadwal->update($id, $jenis_kota, $id_mata_pelajaran, $model, $status);

		$this->output_json(1);
	}


	// Delete data
	public function delete()
	{
		$id 							= $this->input->post('id');

		$exe 							= $this->jadwal->delete($id);

		$this->output_json(1);
	}
	

	function __construct()
	{
		parent::__construct();
		$this->load->model('jadwalModel', 'jadwal');
		$this->default_template = 'templates/dashboard';
		$this->load->library('plugin');
		$this->load->helper('url');

		// Cek session
		$this->sesion->cek_session();
	}

}

/* End of file Jadwal.php */
/* Location: ./application/controllers/Jadwal.php */