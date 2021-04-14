<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Preview extends Render_Controller
{


	public function index()
	{
		// Page Settings
		$this->title 				= 'RAB Preview';
		if($this->session->userdata('data')['level'] == 'Super Admin'){
			$this->content 			= 'rab-preview';
		}elseif($this->session->userdata('data')['level'] == 'Admin Sekolah'){
			$get_cabang 			= $this->db->get_where('cabangs', ['user_id' => $this->session->userdata('data')['id']])->row_array();
			$id_cabang 				= $get_cabang['id'];
			$npsn 					= $get_cabang['kode'];
			$cabang 				= $get_cabang['nama'];

			$get_status				= $this->db->get_where('rabs', ['id_cabang' => $id_cabang])->row_array();
			$this->data['status']	= $get_status['status'];
			$this->data['npsn']  	= $npsn;
			$this->data['cabang']  	= str_replace('%20', ' ', $cabang);
			$this->data['total']	= $this->preview->getTotalHarga($npsn);
			$this->content 			= 'rab-preview-sekolah';
		}
		$this->navigation 			= ['RAB Preview'];
		$this->plugins 				= ['datatables'];

		// Breadcrumb setting
		$this->breadcrumb_1 		= 'Dashboard';
		$this->breadcrumb_1_url 	= base_url() . 'dashboard';
		$this->breadcrumb_2 		= 'RAB Preview';
		$this->breadcrumb_2_url 	= '#';

		// Send data to view
		$this->render();
	}

	public function detail($npsn=null, $cabang=null)
	{
		// Page Settings
		$this->title 					= 'RAB Preview';
		$this->content 					= 'rab-preview-detail';
		$this->navigation 				= ['RAB Preview'];
		$this->plugins 					= ['datatables'];

		// Breadcrumb setting
		$this->breadcrumb_1 			= 'Dashboard';
		$this->breadcrumb_1_url 		= base_url() . 'dashboard';
		$this->breadcrumb_2 			= 'RAB Preview Detail';
		$this->breadcrumb_2_url 		= '#';
		$this->data['npsn']  			= $npsn;
		$this->data['cabang']  			= str_replace('%20', ' ', $cabang);
		$this->data['total']			= $this->preview->getTotalHarga($npsn);
		// Send data to view
		$this->render();
	}

	public function tindakan($npsn=null, $status=null){
		if($npsn != null){
			$get_cabang = $this->db->get_where('cabangs', ['kode' => $npsn])->row_array();
			$id_cabang  = $get_cabang['id'];

			$upd['status'] = $status;
			$exe = $this->db->where('id_cabang', $id_cabang);
			$exe = $this->db->update('rabs', $upd);

			if($exe){
				$get_total = $this->preview->getTotalHarga($npsn);
				$get_total2 = $this->preview->getTotalHargaRupiah($npsn);
				$total_ringgit = $get_total['total_harga_ringgit'];
				$total_rupiah = $get_total2['total_harga_rupiah'];
				if($status == 2){
					$saldo['id_cabang'] = $id_cabang;
					$saldo['total_ringgit'] = $total_ringgit;
					$saldo['total_rupiah'] = $total_rupiah;
					$saldo['status'] = 'aktif';
					$saldo['created_date'] = date("Y-m-d H:i:s");
					$this->db->insert('saldos', $saldo);

					$saldo_pemasukan['id_user'] = $this->session->userdata('data')['id'];
					$saldo_pemasukan['id_cabang'] = $id_cabang;
					$saldo_pemasukan['id_rab'] = 0;
					$saldo_pemasukan['keterangan'] = 'sudah dicairkan';
					$saldo_pemasukan['total_ringgit'] = $total_ringgit;
					$saldo_pemasukan['total_rupiah'] = $total_rupiah;
					$saldo_pemasukan['status'] = 'aktif';
					$saldo_pemasukan['created_date'] = date("Y-m-d H:i:s");
					$this->db->insert('saldo_pemasukans', $saldo_pemasukan);
				}
				echo "<script>alert('RAB berhasil diproses')</script>";
				redirect('rab/preview', 'refresh');
			}else{
				echo "<script>alert('Gagal diproses')</script>";
				redirect('rab/preview', 'refresh');
			}
		}else{
			echo "<script>alert('NPSN tidak ada')</script>";
			redirect('rab/preview', 'refresh');
		}
	}

	// Ajax Data
	public function ajax_data()
	{
		$status = $this->input->post('status');
		$start 	= $this->input->post('start');
		$draw 	= $this->input->post('draw');
		$length = $this->input->post('length');
		$cari 	= $this->input->post('search');
		if(isset($cari['value'])){
			$_cari = $cari['value'];
		}else{
			$_cari = null;
		}
		$data 	= $this->preview->getAllData($length, $start, $_cari, $status)->result_array();
		$count 	= $this->preview->getAllData(null,null, $_cari, $status)->num_rows();
		
		array($cari);

		echo json_encode(array('recordsTotal'=>$count, 'recordsFiltered'=> $count, 'draw'=>$draw, 'search'=> $_cari, 'data'=>$data));
	}

	public function ajax_data_detail()
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
		$data 	= $this->preview->getAllDataDetail($length, $start, $_cari, $npsn)->result_array();
		$count 	= $this->preview->getAllDataDetail(null,null, $_cari, $npsn)->num_rows();
		
		array($cari);

		echo json_encode(array('recordsTotal'=>$count, 'recordsFiltered'=> $count, 'draw'=>$draw, 'search'=> $_cari, 'data'=>$data));
	}

	public function excel()
	{
		$npsn 	= "9LN01080";
		$data['nama_cabang'] = $npsn;
		$data['aktifitas_1'] = $this->db->query("select * from aktifitas WHERE kode = (select a.id_pengkodeans from aktifitas a ,rabs b, cabangs c where b.id_aktifitas = a.id and b.id_cabang = c.id and c.kode = '".$npsn."' GROUP BY id_pengkodeans)")->result_array();
		$data['aktifitas_2'] = $this->db->query("select a.uraian,a.id_pengkodeans,a.kode from aktifitas a ,rabs b, cabangs c where b.id_aktifitas = a.id and b.id_cabang = c.id and c.kode = '".$npsn."' GROUP BY kode")->result_array();
		$data['isi'] = $this->preview->getAllDataDetail(null, null, null, $npsn)->result_array();
		$this->load->view('templates/export/eksport-excel', $data);
	}

	function __construct()
	{
		parent::__construct();
		$this->load->model('rab/previewModel', 'preview');
		$this->default_template = 'templates/dashboard';
		$this->load->library('plugin');
		$this->load->helper('url');

		// Cek session
		$this->sesion->cek_session();
	}
}

/* End of file Data.php */
/* Location: ./application/controllers/kota.php */