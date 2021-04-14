<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class DetailSoal extends Render_Controller {

	public function index($id = null)
	{
		// Page Settings
		$this->title 					= 'Soal';
		$this->content 					= 'detail-soal';
		$this->navigation 				= ['Soal'];
		$this->plugins 					= ['datatables'];

		// Breadcrumb setting
		$this->breadcrumb_1 			= 'Dashboard';
		$this->breadcrumb_1_url 		= base_url() . 'dashboard';
		$this->breadcrumb_2 			= 'Soal';
		$this->breadcrumb_2_url 		= base_url() . 'soal';
		$this->breadcrumb_3 			= 'Detail';
		$this->breadcrumb_3_url 		= '#';

		$this->data['soal'] 			= $this->soal->getSoalData($id);
		$this->data['id'] 				= $id;

		// Send data to view
		$this->render();
	}


	// Ajax Data
	public function ajax_data($id = null)
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
		$data 	= $this->soal->getAllData($length, $start, $_cari, $status, $id)->result_array();
		$count 	= $this->soal->getAllData(null,null, $_cari, $status, $id)->num_rows();
		
		array($cari);

		echo json_encode(array('recordsTotal'=>$count, 'recordsFiltered'=> $count, 'draw'=>$draw, 'search'=> $_cari, 'data'=>$data));
	}


	// Get data detail
	public function getDataDetail()
	{
		$id 							= $this->input->post('id');

		$exe 							= $this->soal->getDataDetail($id);

		$this->output_json(
			[
				'id' 					=> $exe['id'],
				'kategori' 				=> $exe['kategori'],
				'jawaban' 				=> $exe['jawaban'],
				'keterangan' 			=> $exe['keterangan'],
				'status' 				=> $exe['status'],
			]
		);
	}


	// Insert data
	public function insert()
	{
		$file 							= null;
		$image 							= null;

		if(isset($_FILES['file']))
		{
			$file 						= $this->gambar->upload([
				'file' => 'file',
				'path' => 'audio',
			]);
		}

		if(isset($_FILES['gambar']))
		{
			$image 						= $this->gambar->upload([
				'file' => 'gambar',
				'path' => 'gambar',
			]);
		}

		$id_soal 						= $this->input->post('id_soal');
		$kategori 						= $this->input->post('kategori');
		$jawaban 						= $this->input->post('jawaban');
		$keterangan 					= $this->input->post('keterangan');
		$status 						= 1;

		$exe 							= $this->soal->insert($id_soal, $kategori, $jawaban, $keterangan, $file, $image, $status);
		$this->output_json([]);
	}


	// Update data
	public function update()
	{
		$id 							= $this->input->post('id');
		$file 							= null;
		$image 							= null;

		if(isset($_FILES['file']))
		{
			$file 						= $this->gambar->upload([
				'file' => 'file',
				'path' => 'audio',
			]);
		}

		if(isset($_FILES['gambar']))
		{
			$image 						= $this->gambar->upload([
				'file' => 'gambar',
				'path' => 'gambar',
			]);
		}

		$id_soal 						= $this->input->post('id_soal');
		$kategori 						= $this->input->post('kategori');
		$jawaban 						= $this->input->post('jawaban');
		$keterangan 					= $this->input->post('keterangan');
		$status 						= 1;

		$exe 							= $this->soal->update($id, $id_soal, $kategori, $jawaban, $keterangan, $file, $image, $status);

		$this->output_json([]);
	}


	// Delete data
	public function delete()
	{
		$id 							= $this->input->post('id');

		$exe 							= $this->soal->delete($id);

		$this->output_json(
			[
				'id' 			=> $id
			]
		);
	}

	// Cek jawaban
	public function cekSoal()
	{
		$id = $this->input->post('id');

		echo json_encode($this->db->get_where('soal_detail_pilihan_ganda', ['id_soal_detail' => $id])->result_array());
	}

	// Add Jawaban
	public function addSoal()
	{
		$id_detail = $this->input->post('id_detail');
		$model = $this->input->post('model');
		$type = $this->input->post('type');
		
		$arr = array(
			0 => ['kode' => 'a', 'keterangan' => $this->input->post('a'), 'id' => $this->input->post('id_a')],
			1 => ['kode' => 'b', 'keterangan' => $this->input->post('b'), 'id' => $this->input->post('id_b')],
			2 => ['kode' => 'c', 'keterangan' => $this->input->post('c'), 'id' => $this->input->post('id_c')],
			3 => ['kode' => 'd', 'keterangan' => $this->input->post('d'), 'id' => $this->input->post('id_d')],
			4 => ['kode' => 'e', 'keterangan' => $this->input->post('e'), 'id' => $this->input->post('id_e')],
		);

		$max_for = ($model == 'Pilihan Ganda') ? 5 : 2;
		for($i = 0;$i < $max_for;$i++)
		{
			$data['id_soal_detail'] = $id_detail;
			$data['kode'] = $arr[$i]['kode'];
			$data['keterangan'] = $arr[$i]['keterangan'];
			$data['status'] = 1;

			if($type == 'create')
			{
				$this->db->insert('soal_detail_pilihan_ganda', $data);
			}
			else
			{
				if($arr[$i]['id'] == null)
				{
					$this->db->insert('soal_detail_pilihan_ganda', $data);
				}
				
				$this->db->where('id', $arr[$i]['id']);
				$this->db->update('soal_detail_pilihan_ganda', $data);
			}
		}

		echo json_encode('ggwp'); 
	}
	

	function __construct()
	{
		parent::__construct();
		$this->load->model('detailSoalModel', 'soal');
		$this->default_template = 'templates/dashboard';
		$this->load->library('plugin');
		$this->load->library('gambar');
		$this->load->helper('url');

		// Cek session
		$this->sesion->cek_session();
	}
}

/* End of file DetailSoal.php */
/* Location: ./application/controllers/DetailSoal.php */