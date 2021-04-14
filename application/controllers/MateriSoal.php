<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class MateriSoal extends Render_Controller {

	public function index($id = null, $page = 0)
	{

		$arr_rand = [
			0 => [
				'type' => 'desc',
				'field' => 'a.id',
			],
			1 => [
				'type' => 'desc',
				'field' => 'a.keterangan',
			],
			2 => [
				'type' => 'desc',
				'field' => 'a.jawaban',
			],
			3 => [
				'type' => 'desc',
				'field' => 'a.tanggal',
			],
			4 => [
				'type' => 'asc',
				'field' => 'a.id',
			],
			5 => [
				'type' => 'asc',
				'field' => 'a.keterangan',
			],
			6 => [
				'type' => 'asc',
				'field' => 'a.jawaban',
			],
			7 => [
				'type' => 'asc',
				'field' => 'a.tanggal',
			],

		]; 

		$random = $this->session->userdata('random'); 
		if($random == null)
		{
			$this->session->set_userdata([
				'random' => $arr_rand[rand(0, 7)]
			]);
		}
		
		$id_beneran = $id;
		$this->create_jawaban($id);

		// Page Settings
		$this->title 					= 'Soal Materi';
		$this->content 					= 'materi-soal';
		$this->navigation 				= ['Mata Pelajaran'];
		$this->plugins 					= ['datatables'];

		// Breadcrumb setting
		$this->breadcrumb_1 			= 'Dashboard';
		$this->breadcrumb_1_url 		= base_url() . 'dashboard';
		$this->breadcrumb_2 			= 'Materi';
		$this->breadcrumb_2_url 		= base_url() . 'materi';
		$this->breadcrumb_3 			= 'Soal';
		$this->breadcrumb_3_url 		= '#';
		$this->data['id'] = $id;
		$this->data['page'] = $page;

		$id = $this->db->get_where('jadwal', ['id' => $id])->row_array();
		$id = $id['id_soal'];

		// Send data to view
		$this->data['records'] 			= $this->db->select('a.*')
		->join('soal b', 'b.id = a.id_soal')
		->join('mata_pelajaran c', 'c.id = b.id_mata_pelajaran')
		->where('a.id_soal', $id)
		->order_by($this->session->userdata('random')['field'], $this->session->userdata('random')['type'])
		->get('soal_detail a', 1, $page)
		->result_array();

		$this->data['pilihan'] 			= function($where) {
			return $this->db->get_where('soal_detail_pilihan_ganda', $where)->result_array();
		};

		$this->data['pagination'] 		= $this->paging->create_links([
			'base_url' => 'materiSoal/index/' . $id_beneran . '/',
			'total_rows' => $this->db->get_where('soal_detail', ['id_soal' => $id])->num_rows(),
			'per_page' => 1,
			'uri_segment' => 5,
		]);


		$this->render();	
	}

	public function saveAnswer()
	{
		$session_answer = $this->session->userdata('answer');

		$id = $this->input->post('id');
		$answer = $this->input->post('answer');

		if($session_answer == null)
		{
			$sess = [ $id => $answer ];

			$this->session->set_userdata(['answer' => $sess]);
		}
		else
		{
			$sess = isset($this->session->userdata('answer')[$id]);

			if($sess)
			{
				$sess_GGWP = $this->session->userdata('answer');
				$sess_GGWP[$id] = $answer;

				$this->session->set_userdata(['answer' => $sess_GGWP]);
			}
			else
			{
				$sess_GGWP = $this->session->userdata('answer');
				$sess_GGWP[$id] = $answer;

				$this->session->set_userdata(['answer' => $sess_GGWP]);
			}
		}

		echo json_encode(1);
	}

	public function create_jawaban($id)
	{
		$exe = $this->db->get_where('jawaban', ['id_jadwal' => $id, 'id_siswa' => $this->session->userdata('data')['id']]);

		if($exe->num_rows() == 0)
		{
			$data['id_jadwal'] = $id;
			$data['id_siswa'] = $this->session->userdata('data')['id'];
			$data['mulai'] = date("Y-m-d H:i:s");
			$data['status'] = 1;

			$exe = $this->db->insert('jawaban', $data);

			$exe = $this->db->get_where('jadwal', ['id' => $id])->row_array();
			$exe = $this->db->get_where('soal', ['id' => $exe['id_soal']])->row_array();

			$exe_u = $this->db->where('id', $exe['id']);
			$exe_u = $this->db->update('soal', [
				'jumlah' => $exe['jumlah'] + 1,
			]);
		}
		else
		{
			$exe = $exe->row_array()['status'];
			
			if($exe == 0)
			{
				echo "<script>alert('Anda sudah mengikuti test ini')</script>";
				redirect('materi', 'refresh');
			}	
		}
	}

	public function saveJawaban($id)
	{
		$session_answer = $this->session->userdata('answer');

		if($session_answer == null)
		{
			echo "<script>window.location = '".$_SERVER['HTTP_REFERER'] . "'</script>";
		}
		else
		{
			$exe = $this->db->get_where('jawaban', ['id_jadwal' => $id, 'id_siswa' => $this->session->userdata('data')['id'], 'status' => 1])->row_array();

			$mulai = new DateTime($exe['mulai']);
			$selesai = new DateTime(date("Y-m-d H:i:s"));
			$lama = $selesai->diff($mulai);

			$data['selesai'] = date("Y-m-d H:i:s");
			$data['lama_pengerjaan'] = $lama->h . ' Jam ' . $lama->i . ' Menit ' . $lama->s . ' Detik ';
			$data['status'] = 0;

			$exe2 = $this->db->where('id', $exe['id']);
			$exe2 = $this->db->update('jawaban', $data);
			foreach($session_answer as $key => $val)
			{
				$data2['id_jawaban'] = $exe['id'];
				$data2['id_soal_detail'] = $key;
				$data2['jawaban_pilihan_ganda'] = $val;
				$data2['status'] = 1;

				$this->db->insert('jawaban_detail', $data2);
			}
		}

		$this->session->unset_userdata('answer');

		redirect('materi','refresh');
	}

	function __construct()
	{
		parent::__construct();
		$this->default_template = 'templates/dashboard';
		$this->load->library('plugin');
		$this->load->library('paging');
		$this->load->helper('url');

		// Cek session
		$this->sesion->cek_session();
	}

}

/* End of file MateriSoal.php */
/* Location: ./application/controllers/MateriSoal.php */