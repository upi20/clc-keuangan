<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Materi extends Render_Controller {


	public function index()
	{
		// Page Settings
		$this->title 					= 'Materi';
		$this->content 					= 'materi';
		$this->navigation 				= ['Materi'];
		$this->plugins 					= ['datatables'];

		// Breadcrumb setting
		$this->breadcrumb_1 			= 'Dashboard';
		$this->breadcrumb_1_url 		= base_url() . 'dashboard';
		$this->breadcrumb_2 			= 'Materi';
		$this->breadcrumb_2_url 		= '#';

		// Send data to view
		$this->data['jadwal'] 			= $this->db->select('a.*, b.token, c.nama as mapel, d.nama as kota')
		->from('jadwal a')
		->join('soal b', 'b.id = a.id_soal')
		->join('mata_pelajaran c', 'c.id = b.id_mata_pelajaran')
		->join('kota_kab d', 'd.id = a.kota_kab')
		->where('a.status', 1)
		->get()->result_array();

		$this->render();
	}

	function __construct()
	{
		parent::__construct();
		// $this->load->model('kotaModel', 'kota');
		$this->default_template = 'templates/dashboard';
		$this->load->library('plugin');
		$this->load->helper('url');

		// Cek session
		$this->sesion->cek_session();
	}

}

/* End of file Materi.php */
/* Location: ./application/controllers/Materi.php */