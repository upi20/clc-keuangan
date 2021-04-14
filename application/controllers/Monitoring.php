<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Monitoring extends Render_Controller
{


	public function index()
	{
		// Page Settings
		$this->title 					= 'Monitoring';
		$this->content 					= 'monitoring';
		$this->navigation 				= ['Monitoring'];
		$this->plugins 					= ['datatables'];

		// Breadcrumb setting
		$this->breadcrumb_1 			= 'Dashboard';
		$this->breadcrumb_1_url 		= base_url() . 'dashboard';
		$this->breadcrumb_2 			= 'Monitoring';
		$this->breadcrumb_2_url 		= '#';

		$this->data['record'] 			= $this->monitoring->getAllData();
		$this->data['soal'] 			= $exe 						= $this->db->select('*,a.id as id')
		->from('soal a')
		->join('mata_pelajaran b','b.id = a.id_mata_pelajaran')
		->get()
		->result_array();
		
		$this->data['jawaban_detail']  	= function($id)
		{
			return $this->db->select('jawaban_pilihan_ganda')->get_where('jawaban_detail', ['id_jawaban' => $id]);
		};
		$this->data['record_where'] 	= function($where)
		{
			return $this->monitoring->getAllData($where);
		};

		// Send data to view
		$this->render();
	}
	

	function __construct()
	{
		parent::__construct();
		$this->load->model('monitoringModel', 'monitoring');
		$this->default_template = 'templates/dashboard';
		$this->load->library('plugin');
		$this->load->helper('url');

		// Cek session
		$this->sesion->cek_session();
	}
}

/* End of file Data.php */
/* Location: ./application/controllers/monitoring.php */