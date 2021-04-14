<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Realisasi extends Render_Controller
{


	public function index()
	{
		// Page Settings
		$this->title 				= 'Realisasi';
		$get_cabang 			= $this->db->get_where('cabangs', ['user_id' => $this->session->userdata('data')['id']])->row_array();
		$id_cabang 				= $get_cabang['id'];
		$npsn 					= $get_cabang['kode'];
		$cabang 				= $get_cabang['nama'];

		$get_status				= $this->db->get_where('rabs', ['id_cabang' => $id_cabang])->row_array();
		$this->data['status']	= $get_status['status'];
		$this->data['npsn']  	= $npsn;
		$this->data['cabang']  	= str_replace('%20', ' ', $cabang);
		$this->data['total']	= $this->realisasi->getTotalHarga($npsn);
		$this->content 			= 'realisasi';
		$this->navigation 			= ['Realisasi'];
		$this->plugins 				= ['datatables'];

		// Breadcrumb setting
		$this->breadcrumb_1 		= 'Dashboard';
		$this->breadcrumb_1_url 	= base_url() . 'dashboard';
		$this->breadcrumb_2 		= 'Realisasi';
		$this->breadcrumb_2_url 	= '#';

		// Send data to view
		$this->render();
	}

	// Ajax Data
	public function ajax_data()
	{
		$npsn 	= $this->input->post('npsn');
		$start 	= $this->input->post('start');
		$draw 	= $this->input->post('draw');
		$length = $this->input->post('length');
		$cari 	= $this->input->post('search');
		if(isset($cari['value'])){
			$_cari = $cari['value'];
		}else{
			$_cari = null;
		}
		$data 	= $this->realisasi->getAllDataDetail($length, $start, $_cari, $npsn)->result_array();
		$count 	= $this->realisasi->getAllDataDetail(null,null, $_cari, $npsn)->num_rows();
		
		array($cari);

		echo json_encode(array('recordsTotal'=>$count, 'recordsFiltered'=> $count, 'draw'=>$draw, 'search'=> $_cari, 'data'=>$data));
	}

	public function insert() {

		// Input values
		$id 			= $this->input->post('id');
		$id_cabang 		= $this->input->post('id_cabang');
		$nama 			= $this->input->post('nama');
		$keterangan 	= $this->input->post('keterangan');
		$harga_rupiah 	= $this->input->post('harga_rupiah');
		$harga_ringgit 	= $this->input->post('harga_ringgit');
		$tanggal 		= $this->input->post('tanggal');

		// Check values
		if(empty($nama)) $this->output_json(['message' => 'Nama tidak boleh kosong']);

		$r = $this->realisasi->insert($id, $id_cabang, $nama, $keterangan, $harga_ringgit, $harga_rupiah, $tanggal);

		if($r !== FALSE) {
			$cek = $this->db->join('rabs b', 'b.id = a.id_rab')->get_where('realisasis a',['a.id' => $r['id']])->row_array();
			$ringgit_awal = $cek['total_harga_ringgit'];
			$ringgit_belanja = $cek['harga_ringgit'];
			$rupiah_belanja = $cek['harga_rupiah'];
			// if($harga_ringgit <= $ringgit_awal){
			
			$get_saldo = $this->db->get_where('saldos', ['id_cabang' => $id_cabang])->row_array();
			$data['total_ringgit'] = $get_saldo['total_ringgit']-$harga_ringgit;
			$data['total_rupiah'] = $get_saldo['total_rupiah']-$harga_rupiah;
			$this->db->where('id_cabang', $id_cabang);
			$this->db->update('saldos', $data);

			// }
			$this->output_json(
				[
					'id' => $r['id'],
				]
			);
		}
	}

	function getDetailRab(){
		$id = $this->input->post('id');
		$get = $this->db->select('a.*,b.kode as npsn, a.nama as nama_aktifitas')->join('cabangs b' ,'b.id = a.id_cabang')->get_where('rabs a',['a.id' => $id])->row_array();
		$this->output_json($get);
	}

	function getDetailRealisasi(){
		$id = $this->input->post('id');
		$get = $this->db->select('a.*, b.kode, b.nama as nama_aktifitas, b.total_harga_ringgit, b.total_harga_rupiah, c.kode as npsn, b.kode as kode')->join('rabs b', 'b.id = a.id_rab')->join('cabangs c', 'b.id_cabang = c.id')->get_where('realisasis a',['a.id' => $id])->row_array();
		$this->output_json($get);
	}
	

	public function danaSisa()
	{
		// Page Settings
		$this->title 				= 'Realisasi';
		$get_cabang 			= $this->db->get_where('cabangs', ['user_id' => $this->session->userdata('data')['id']])->row_array();
		$id_cabang 				= $get_cabang['id'];
		$npsn 					= $get_cabang['kode'];
		$cabang 				= $get_cabang['nama'];

		$get_status				= $this->db->get_where('rabs', ['id_cabang' => $id_cabang])->row_array();
		$this->data['status']	= $get_status['status'];
		$this->data['npsn']  	= $npsn;
		$this->data['cabang']  	= str_replace('%20', ' ', $cabang);
		$this->data['total']	= $this->realisasi->getTotalHarga($npsn);
		$this->content 			= 'realisasi-dana-sisa';
		$this->navigation 		= ['Realisasi'];
		$this->plugins 			= ['datatables'];

		// Breadcrumb setting
		$this->breadcrumb_1 		= 'Dashboard';
		$this->breadcrumb_1_url 	= base_url() . 'dashboard';
		$this->breadcrumb_2 		= 'Realisasi';
		$this->breadcrumb_2_url 	= base_url() . 'realisasi';
		$this->breadcrumb_3 		= 'Dana Sisa';
		$this->breadcrumb_3_url 	= '#';

		// Send data to view
		$this->render();
	}

	// Ajax Data
	public function ajax_data_dana_sisa()
	{
		$npsn 	= $this->input->post('npsn');
		$start 	= $this->input->post('start');
		$draw 	= $this->input->post('draw');
		$length = $this->input->post('length');
		$cari 	= $this->input->post('search');
		if(isset($cari['value'])){
			$_cari = $cari['value'];
		}else{
			$_cari = null;
		}
		$data 	= $this->realisasi->getAllDataDanaSisa($length, $start, $_cari, $npsn)->result_array();
		$count 	= $this->realisasi->getAllDataDanaSisa(null,null, $_cari, $npsn)->num_rows();
		
		array($cari);

		echo json_encode(array('recordsTotal'=>$count, 'recordsFiltered'=> $count, 'draw'=>$draw, 'search'=> $_cari, 'data'=>$data));
	}

	function __construct()
	{
		parent::__construct();
		$this->load->model('realisasiModel', 'realisasi');
		$this->default_template = 'templates/dashboard';
		$this->load->library('plugin');
		$this->load->helper('url');

		// Cek session
		$this->sesion->cek_session();
	}
}

/* End of file Data.php */
/* Location: ./application/controllers/kota.php */