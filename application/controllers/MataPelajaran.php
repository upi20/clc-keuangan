<?php
defined('BASEPATH') or exit('No direct script access allowed');

class MataPelajaran extends Render_Controller
{


	public function index()
	{
		// Page Settings
		$this->title 					= 'Mata Pelajaran';
		$this->content 					= 'mata-pelajaran';
		$this->navigation 				= ['Mata Pelajaran'];
		$this->plugins 					= ['datatables'];

		// Breadcrumb setting
		$this->breadcrumb_1 			= 'Dashboard';
		$this->breadcrumb_1_url 		= base_url() . 'dashboard';
		$this->breadcrumb_2 			= 'Mata Pelajaran';
		$this->breadcrumb_2_url 		= '#';

		// Send data to view
		$this->data['records'] 			= $this->mataPelajaran->getAllData();
		$this->render();
	}


	// Get data detail
	public function getDataDetail()
	{
		$id 							= $this->input->post('id');

		$exe 							= $this->mataPelajaran->getDataDetail($id);

		$this->output_json(
			[
				'id' 			=> $exe['id'],
				'nama' 			=> $exe['nama'],
				'keterangan' 	=> $exe['keterangan'],
				'status' 		=> $exe['status'],
			]
		);
	}


	// Insert data
	public function insert()
	{
		$nama 							= $this->input->post('nama');
		$keterangan 					= $this->input->post('keterangan');
		$status 						= $this->input->post('status');
		
		$cekNama 						= $this->cek($nama);

		if($cekNama->num_rows() > 0)
		{
			$this->output_json(['codeStatus' => 1]);
		}
		else
		{
			$exe 							= $this->mataPelajaran->insert($nama, $keterangan, $status);

			$this->output_json(
				[
					'codeStatus' 	=> 0,
					'id' 			=> $exe['id'],
					// 'code' 			=> $exe['code'],
					'nama' 			=> $nama,
					'keterangan' 	=> $keterangan,
					'status' 		=> $status,
				]
			);
		}

	}


	// Update data
	public function update()
	{
		$id 							= $this->input->post('id');
		$nama 							= $this->input->post('nama');
		$keterangan 					= $this->input->post('keterangan');
		$status 						= $this->input->post('status');


		$cekNama 						= $this->cek($nama);

		if($cekNama->num_rows() > 0)
		{
			$this->output_json(['codeStatus' => 1]);
		}
		else
		{
			$exe 							= $this->mataPelajaran->update($id, $nama, $keterangan, $status);
			$this->output_json(
				[
					'codeStatus' 	=> 0,
					'id' 			=> $id,
					// 'code' 			=> $exe['code'],
					'nama' 			=> $nama,
					'keterangan' 	=> $keterangan,
					'status' 		=> $status,
				]
			);
		}
	}


	// Delete data
	public function delete()
	{
		$id 							= $this->input->post('id');

		$exe 							= $this->mataPelajaran->delete($id);

		$this->output_json(
			[
				'id' 			=> $id
			]
		);
	}

	private function cek($nama){
		$cekNama = $this->db->get_where('mata_pelajaran', ['nama' => $nama]);
		return $cekNama;
	}


	function __construct()
	{
		parent::__construct();
		$this->load->model('mataPelajaranModel', 'mataPelajaran');
		$this->default_template = 'templates/dashboard';
		$this->load->library('plugin');
		$this->load->helper('url');

		// Cek session
		$this->sesion->cek_session();
	}
}

/* End of file Data.php */
/* Location: ./application/controllers/mataPelajaran.php */