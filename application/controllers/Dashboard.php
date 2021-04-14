<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Dashboard extends Render_Controller
{


	public function index()
	{
		// Page Settings
		$this->title 					= 'Dashboard';
		if ($this->session->userdata('data')['level'] == 'Super Admin') {
			$this->content 					= 'dashboard';
		} elseif ($this->session->userdata('data')['level'] == 'Admin Sekolah') {
			$get_cabang = $this->db->get_where('cabangs', ['user_id' => $this->session->userdata('data')['id']])->row_array();
			$this->data['profil'] = $get_cabang;
			$this->content 					= 'dashboard-sekolah';
		} else {
			$this->content 					= 'halaman-kosong';
		}
		$this->navigation 				= ['Dashboard'];
		$this->plugins 					= ['datatables'];

		// Breadcrumb setting
		$this->breadcrumb_1 			= 'Dashboard';
		$this->breadcrumb_1_url 		= '#';

		// Send data to view
		$this->render();
	}


	function __construct()
	{
		parent::__construct();
		// $this->load->model('master/chemicalModel', 'chemical');
		$this->default_template = 'templates/dashboard';
		$this->load->library('plugin');
		$this->load->helper('url');

		// Cek session
		$this->sesion->cek_session();
	}
}

/* End of file Dashboard.php */
/* Location: ./application/controllers/Dashboard.php */