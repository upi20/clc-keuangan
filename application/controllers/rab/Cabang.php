<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Cabang extends Render_Controller
{


	public function index()
	{
		// Page Settings
		if ($this->session->userdata('data')['level'] == 'Super Admin') {
			$this->title 					= 'RAB Cabang';
			$this->content 					= 'rab-cabang';
		} elseif ($this->session->userdata('data')['level'] == 'Admin Sekolah') {
			$get_status = $this->db->join('cabangs b', 'b.id = a.id_cabang')->get_where('rabs a', ['b.user_id' => $this->session->userdata('data')['id']])->row_array();
			$status = $get_status['status'];
			if ($status == 0) {
				$status = 'Proses';
			} elseif ($status == 1) {
				$status = 'Ajukan';
			} elseif ($status == 2) {
				$status = 'Terima';
			} elseif ($status == 3) {
				$status = 'Tolak';
			} else {
				$status = '';
			}
			$this->title 					= 'RAB Cabang - (Status: ' . $status . ')';
			$this->content 					= 'rab-cabang-sekolah';
		} else {
			$this->content 					= 'halaman-kosong';
		}
		$this->navigation 				= ['RAB Cabang'];
		$this->plugins 					= ['datatables'];

		// Breadcrumb setting
		$this->breadcrumb_1 			= 'Dashboard';
		$this->breadcrumb_1_url 		= base_url() . 'dashboard';
		$this->breadcrumb_2 			= 'RAB Cabang';
		$this->breadcrumb_2_url 		= '#';

		$this->data['cabang']			= $this->db->get('cabangs')->result_array();
		$this->data['aktifitas']		= $this->db->get_where('aktifitas', ['id_pengkodeans !=' => 0])->result_array();
		$this->data['subaktifitas']		= $this->db->get('rabs')->result_array();

		// Send data to view
		$this->render();
	}


	// Ajax Data
	public function ajax_data()
	{
		$status = $this->input->post('status');
		$start 	= $this->input->post('start');
		$draw 	= $this->input->post('draw');
		$length = $this->input->post('length');
		$cari 	= $this->input->post('search');
		if (isset($cari['value'])) {
			$_cari = $cari['value'];
		} else {
			$_cari = null;
		}
		$data 	= $this->cabang->getAllData($length, $start, $_cari, $status)->result_array();
		$count 	= $this->cabang->getAllData(null, null, $_cari, $status)->num_rows();

		array($cari);

		echo json_encode(array('recordsTotal' => $count, 'recordsFiltered' => $count, 'draw' => $draw, 'search' => $_cari, 'data' => $data));
	}


	// Get data detail
	public function getDataAktifitas()
	{
		$id 							= $this->input->post('id');

		$exe 							= $this->cabang->getDataAktifitas($id);

		$this->output_json($exe);
	}

	// get data sub
	public function getSub()
	{
		# code...

		$id = $this->input->post('id');

		$get = $this->db->query("select max(kode) as id from rabs where id_aktifitas = '" . $id . "'")->row_array();
		$id_awal = $get['id'];
		$id_awal = substr($id_awal, 4);
		// echo json_encode($id_awal);
		if ($id_awal == false) {
			# code...
			$get = $this->db->get_where('aktifitas', ['id' => $id])->row_array();
			$id_akhir = $get['kode'] . '.1';
			$exe['id'] = $get['id'];
			$exe['kode'] = $id_akhir;
			echo json_encode($exe);
		} else {
			$get = $this->db->get_where('aktifitas', ['id' => $id])->row_array();
			$id_akhir = $id_awal + 1;
			$id_akhir = $get['kode'] . '.' . $id_akhir;
			$exe['id'] = $get['id'];
			$exe['kode'] = $id_akhir;
			echo json_encode($exe);
		}
	}

	// get data sub sub
	public function getSubSub()
	{
		# code...

		$id = $this->input->post('id');

		$get = $this->db->query("select * from rabs where id_aktifitas = '" . $id . "'")->result_array();

		echo json_encode($get);
	}

	public function getKurs()
	{
		# code...
		$ringgit = $this->input->post('ringgit');

		$get = $this->db->get('kurs')->row_array();
		$exe['rupiah'] = $ringgit * $get['rupiah'];

		echo json_encode($exe);
	}

	public function getKonfersi()
	{
		# code...
		$jumlah = $this->input->post('jumlah');

		$get = $this->db->get_where('kurs')->row_array();
		$exe['ringgit'] = $ringgit *
			$exe['rupiah'] = $ringgit * $get['rupiah'];

		echo json_encode($exe);
	}


	// Insert data
	public function insert()
	{
		$id_cabang		 				= $this->input->post('id_cabang');
		$id_aktifitas					= $this->input->post('id_aktifitas');
		$id_aktifitas_sub				= $this->input->post('id_aktifitas_sub');
		$id_aktifitas_cabang			= $this->input->post('id_aktifitas_cabang');
		$kode_isi_1 					= $this->input->post('kode_isi_1');
		$kode_isi_2 					= $this->input->post('kode_isi_2');
		$kode_isi_3 					= $this->input->post('kode_isi_3');
		$kode 							= $this->input->post('kode');
		$nama 							= $this->input->post('nama');
		$jumlah_1 						= $this->input->post('jumlah_1');
		$satuan_1 						= $this->input->post('satuan_1');
		$jumlah_2 						= $this->input->post('jumlah_2');
		$satuan_2 						= $this->input->post('satuan_2');
		$jumlah_3 						= $this->input->post('jumlah_3');
		$satuan_3 						= $this->input->post('satuan_3');
		$jumlah_4 						= $this->input->post('jumlah_4');
		$satuan_4 						= $this->input->post('satuan_4');
		$harga_ringgit 					= $this->input->post('harga_ringgit');
		$harga_rupiah 					= $this->input->post('harga_rupiah');
		$total_harga_ringgit 			= $this->input->post('total_harga_ringgit');
		$total_harga_rupiah				= $this->input->post('total_harga_rupiah');
		$prioritas 						= $this->input->post('prioritas');
		$status 						= $this->input->post('status');
		// $status 						= $this->input->post('status');

		$exe 							= $this->cabang->insert($id_cabang, $id_aktifitas, $id_aktifitas_sub, $id_aktifitas_cabang, $kode_isi_1, $kode_isi_2, $kode_isi_3, $kode, $nama, $jumlah_1, $satuan_1, $jumlah_2, $satuan_2, $jumlah_3, $satuan_3, $jumlah_4, $satuan_4, $harga_ringgit, $harga_rupiah, $total_harga_ringgit, $total_harga_rupiah, $prioritas, $status);
		$this->output_json(
			[
				'id' 	=> $exe
			]
		);
	}


	// Update data
	public function update()
	{
		$id 							= $this->input->post('id');
		$id_cabang		 				= $this->input->post('id_cabang');
		$id_aktifitas					= $this->input->post('id_aktifitas');
		$kode_isi_1 					= $this->input->post('kode_isi_1');
		$kode_isi_2 					= $this->input->post('kode_isi_2');
		$kode_isi_3 					= $this->input->post('kode_isi_3');
		$kode 							= $this->input->post('kode');
		$nama 							= $this->input->post('nama');
		$satuan 						= $this->input->post('satuan');
		$harga_ringgit 					= $this->input->post('harga_ringgit');
		$harga_rupiah 					= $this->input->post('harga_rupiah');
		$jumlah 						= $this->input->post('jumlah');
		$total_harga_ringgit 			= $this->input->post('total_harga_ringgit');
		$total_harga_rupiah				= $this->input->post('total_harga_rupiah');
		$prioritas 						= $this->input->post('prioritas');
		$status 						= $this->input->post('status');

		$exe 							= $this->cabang->update($id, $id_cabang, $id_aktifitas, $kode_isi_1, $kode_isi_2, $kode_isi_3, $kode, $nama, $satuan, $harga_ringgit, $harga_rupiah, $jumlah, $total_harga_ringgit, $total_harga_rupiah, $prioritas, $status);

		$this->output_json(
			[
				'id' 				=> $id
			]
		);
	}


	// Delete data
	public function delete()
	{
		$id 							= $this->input->post('id');

		$exe 							= $this->cabang->delete($id);

		$this->output_json(
			[
				'id' 			=> $id
			]
		);
	}

	public function getCabang()
	{
		$exe 							= $this->cabang->getCabang();

		$this->output_json($exe);
	}

	public function getAktifitas()
	{
		$exe 							= $this->cabang->getAktifitas();

		$this->output_json($exe);
	}

	public function getAktifitasSub()
	{
		$id_aktifitas 			= $this->input->post('id_aktifitas');
		$exe 					= $this->cabang->getAktifitasSub($id_aktifitas);

		$this->output_json($exe);
	}

	public function getAktifitasCabang()
	{
		$id_aktifitas_sub 		= $this->input->post('id_aktifitas_sub');
		$exe 					= $this->cabang->getAktifitasCabang($id_aktifitas_sub);

		$this->output_json($exe);
	}

	public function getAktifitasCabangKodeIsi1()
	{
		$id_aktifitas_cabang 			= $this->input->post('id_aktifitas_cabang');
		$exe 					= $this->cabang->getAktifitasCabangKodeIsi1($id_aktifitas_cabang);

		$this->output_json($exe);
	}

	public function getAktifitasCabangKodeIsi2()
	{
		$kode_isi_1 			= $this->input->post('kode_isi_1');
		$exe 					= $this->cabang->getAktifitasCabangKodeIsi2($kode_isi_1);

		$this->output_json($exe);
	}

	public function getAktifitasCabangKodeIsi3()
	{
		$kode_isi_2 			= $this->input->post('kode_isi_2');
		$exe 					= $this->cabang->getAktifitasCabangKodeIsi3($kode_isi_2);

		$this->output_json($exe);
	}

	public function getKodeCabang()
	{
		$id_aktifitas_sub 		= $this->input->post('id_aktifitas_sub');

		if ($this->session->userdata('data')['level'] == 'Super Admin') {
			$get_kode_max = $this->db->query("select max(kode) as kode from rabs where id_aktifitas = '" . $id_aktifitas_sub . "' and kode_isi_1 = 0")->row_array();
		} elseif ($this->session->userdata('data')['level'] == 'Admin Sekolah') {

			$get_kode_max = $this->db->query("select max(kode) as kode from rabs where id_cabang = '" . $this->id_cabang . "' and id_aktifitas = '" . $id_aktifitas_sub . "' and kode_isi_1 = 0")->row_array();
		}

		if ($get_kode_max['kode'] == null or $get_kode_max['kode'] == '') {
			$get_kode_max = $this->db->query("select max(kode) as kode from aktifitas where id = '" . $id_aktifitas_sub . "'")->row_array();
			$get_kode_max['kode'] = $get_kode_max['kode'] . ".0";
		}
		$this->output_json($get_kode_max);
	}

	public function getKodeCabangKodeIsi1()
	{
		$id_aktifitas_cabang 		= $this->input->post('id_aktifitas_cabang');

		if ($this->session->userdata('data')['level'] == 'Super Admin') {
			$get_kode_max = $this->db->query("select max(kode) as kode from rabs where kode_isi_1 = '" . $id_aktifitas_cabang . "' and kode_isi_2 = 0")->row_array();
		} elseif ($this->session->userdata('data')['level'] == 'Admin Sekolah') {
			$get_kode_max = $this->db->query("select max(kode) as kode from rabs where id_cabang = '" . $this->id_cabang . "' and kode_isi_1 = '" . $id_aktifitas_cabang . "' and kode_isi_2 = 0")->row_array();
		}

		if ($get_kode_max['kode'] == null or $get_kode_max['kode'] == '') {
			$get_kode_max = $this->db->query("select max(kode) as kode from rabs where id = '" . $id_aktifitas_cabang . "'")->row_array();
			$get_kode_max['kode'] = $get_kode_max['kode'] . ".0";
		}
		$this->output_json($get_kode_max);
	}

	public function getKodeCabangKodeIsi2()
	{
		$kode_isi_1 		= $this->input->post('kode_isi_1');


		if ($this->session->userdata('data')['level'] == 'Super Admin') {
			$get_kode_max = $this->db->query("select max(kode) as kode from rabs where kode_isi_2 = '" . $kode_isi_1 . "' and kode_isi_3 = '0'")->row_array();
		} elseif ($this->session->userdata('data')['level'] == 'Admin Sekolah') {
			$get_kode_max = $this->db->query("select max(kode) as kode from rabs where id_cabang = '" . $this->id_cabang . "' and kode_isi_2 = '" . $kode_isi_1 . "' and kode_isi_3 = '0'")->row_array();
		}

		if ($get_kode_max['kode'] == null or $get_kode_max['kode'] == '') {
			$get_kode_max = $this->db->query("select max(kode) as kode from rabs where id = '" . $kode_isi_1 . "'")->row_array();
			$get_kode_max['kode'] = $get_kode_max['kode'] . ".0";
		}
		$this->output_json($get_kode_max);
	}

	public function getKodeCabangKodeIsi3()
	{
		$kode_isi_2 		= $this->input->post('kode_isi_2');


		if ($this->session->userdata('data')['level'] == 'Super Admin') {
			$get_kode_max = $this->db->query("select max(kode) as kode from rabs where kode_isi_3 = '" . $kode_isi_2 . "'")->row_array();
		} elseif ($this->session->userdata('data')['level'] == 'Admin Sekolah') {
			$get_kode_max = $this->db->query("select max(kode) as kode from rabs where id_cabang = '" . $this->id_cabang . "' and kode_isi_3 = '" . $kode_isi_2 . "'")->row_array();
		}

		if ($get_kode_max['kode'] == null or $get_kode_max['kode'] == '') {
			$get_kode_max = $this->db->query("select max(kode) as kode from rabs where id = '" . $kode_isi_2 . "'")->row_array();
			$get_kode_max['kode'] = $get_kode_max['kode'] . ".0";
		}
		$this->output_json($get_kode_max);
	}

	public function cetakExcel()
	{
		$status = $this->input->post('status');
		$start 	= $this->input->post('start');
		$draw 	= $this->input->post('draw');
		$length = $this->input->post('length');
		$cari 	= $this->input->post('search');
		if (isset($cari['value'])) {
			$_cari = $cari['value'];
		} else {
			$_cari = null;
		}
		$data['data'] = $this->cabang->getAllData($length, $start, $_cari, $status)->result_array();

		$this->load->view("templates/export/export-rab-cabang-excel", $data);
	}

	function __construct()
	{
		parent::__construct();
		$this->load->model('rab/CabangModel', 'cabang');
		$this->default_template = 'templates/dashboard';
		$this->load->library('plugin');
		$this->load->helper('url');
		$get_cabang 			= $this->db->get_where('cabangs', ['user_id' => $this->session->userdata('data')['id']])->row_array();
		$this->id_cabang 				= $get_cabang['id'];
		// Cek session
		$this->sesion->cek_session();
	}
}

/* End of file Data.php */
/* Location: ./application/controllers/kota.php */