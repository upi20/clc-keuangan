$(() => {

	let base_url = '<?php echo base_url();?>'

	// initialize responsive datatable
	dynamic()
	
	kode()

	function dynamic()
	{
		$('#dt_basic').DataTable({
			"ajax": {
				"url": "<?= base_url()?>cabang/ajax_data/",
				"data": null,
				"type": 'POST'
			},
			"processing": true,
          	"serverSide": true,
			"columns": [
				{ "data": "kode" },
				{ "data": "nama" },
				{ "data": "user_email" },
				{ "data": "no_telpon" },
				{ "data": "alamat" },
				{ "data": "jumlah_kelas_7" },
				{ "data": "jumlah_kelas_8" },
				{ "data": "jumlah_kelas_9" },
				{ "data": "total_jumlah_siswa" },
				{ "data": "jumlah_guru_bina" },
				{ "data": "jumlah_guru_pamong" },
				{ "data": "total_jumlah_guru" },
				{ "data": "status" },
				{
					"data": "id", render(data, type, full, meta)
					{
						return `<div class="pull-right">
									<button class="btn btn-primary btn-xs" onclick="Ubah(${data})">
										<i class="fa fa-edit"></i> Ubah
									</button>
									<button class="btn btn-danger btn-xs" onclick="Hapus(${data})">
										<i class="fa fa-trash"></i> Hapus
									</button>
								</div>`
					}
				}
			],
			"aoColumnDefs": [
			  { 'bSortable': false, 'aTargets': [ "no-sort" ] }
			]
		})
	}


	// Fungsi simpan 
	$('#form').submit((ev) => {
		ev.preventDefault()

		let id = $('#id').val()
		let kode = $('#kode').val()
		let id_user = $('#id_user').val()
		let nama = $('#nama').val()
		let no_telpon = $('#no_telpon').val()
		let alamat = $('#alamat').val()
		let jumlah_kelas_7 = $('#jumlah_kelas_7').val()
		let jumlah_kelas_8 = $('#jumlah_kelas_8').val()
		let jumlah_kelas_9 = $('#jumlah_kelas_9').val()
		let jumlah_guru_bina = $('#jumlah_guru_bina').val()
		let jumlah_guru_pamong = $('#jumlah_guru_pamong').val()
		let status = $('#status').val()
		let email = $('#email').val()

		if (id == 0) {

			// Insert
			$.ajax({
					method: 'post',
					url: '<?= base_url() ?>cabang/insert',
					data: {
						kode: kode,
						nama: nama,
						no_telpon: no_telpon,
						alamat: alamat,
						status: status,
						email: email,
						jumlah_kelas_7: jumlah_kelas_7,
						jumlah_kelas_8: jumlah_kelas_8,
						jumlah_kelas_9: jumlah_kelas_9,
						jumlah_guru_bina: jumlah_guru_bina,
						jumlah_guru_pamong: jumlah_guru_pamong
					}
				}).done((data) => {
					$.doneMessage('Berhasil ditambahkan.', 'cabang')
					$("#dt_basic").dataTable().fnDestroy()
					dynamic()

				})
				.fail(($xhr) => {
					$.failMessage('Gagal ditambahkan.', 'cabang')
				}).
				always(() => {
					$('#myModal').modal('toggle')
				})
		} else {

			// Update

			$.ajax({
					method: 'post',
					url: '<?= base_url() ?>cabang/update',
					data: {
						id: id,
						id_user: id_user,
						kode: kode,
						nama: nama,
						no_telpon: no_telpon,
						alamat: alamat,
						status: status,
						email: email,
						jumlah_kelas_7: jumlah_kelas_7,
						jumlah_guru_bina: jumlah_guru_bina,
						jumlah_guru_pamong: jumlah_guru_pamong
					}
				}).done((data) => {
					$.doneMessage('Berhasil diubah.', 'cabang')
					$("#dt_basic").dataTable().fnDestroy()
					dynamic()

				})
				.fail(($xhr) => {
					$.failMessage('Gagal diubah.', 'cabang')
				}).
				always(() => {
					$('#myModal').modal('toggle')
				})
		}
	})

	// Fungsi Delete
	$('#OkCheck').click(() => {

		let id = $("#idCheck").val()

		$.ajax({
				method: 'post',
				url: '<?= base_url() ?>cabang/delete',
				data: {
					id: id
				}
			}).done((data) => {
				$.doneMessage('Berhasil dihapus.', 'cabang')
				$("#dt_basic").dataTable().fnDestroy()
				dynamic()

			})
			.fail(($xhr) => {
				$.failMessage('Gagal dihapus.', 'cabang')
			}).
			always(() => {
				$('#ModalCheck').modal('toggle')
			})
	})

	// Clik Tambah
	$('#tambah').on('click', () => {
		$('#myModalLabel').html('Tambah cabang')
		kode()
		$('#id').val('')
		$('#kode').val('')
		$('#nama').val('')
		$('#no_telpon').val('')
		$('#alamat').val('')
		$('#status').val(1)
		$('#email').val('')
		$('#jumlah_kelas_7').val('')
		$('#jumlah_kelas_8').val('')
		$('#jumlah_kelas_9').val('')
		$('#jumlah_guru_bina').val('')
		$('#jumlah_guru_pamong').val('')
		$('#myModal').modal('toggle')
	})

	function kode(){
		$.ajax({
			method: 'post',
			url: '<?= base_url() ?>cabang/getKode',
			data: null
		}).done((data) => {
			$("#kode").val(data.id)
		})
	}
})


// Click Hapus
const Hapus = (id) => {
	$("#idCheck").val(id)
	$("#LabelCheck").text('Form Hapus')
	$("#ContentCheck").text('Apakah anda yakin akan menghapus data ini?')
	$('#ModalCheck').modal('toggle')
}

// Click Ubah
const Ubah = (id) => {
	$.ajax({
		method: 'post',
		url: '<?= base_url() ?>cabang/getDataDetail',
		data: {
			id: id
		}
	}).done((data) => {
		console.log(data.user_id)
		$('#myModalLabel').html('Ubah cabang')
		$('#id').val(data.id)
		$('#id_user').val(data.id_user)
		$('#kode').val(data.kode)
		$('#nama').val(data.nama)
		$('#no_telpon').val(data.no_telpon)
		$('#alamat').val(data.alamat)
		$('#jumlah_kelas_7').val(data.jumlah_kelas_7)
		$('#jumlah_kelas_8').val(data.jumlah_kelas_8)
		$('#jumlah_kelas_9').val(data.jumlah_kelas_9)
		$('#jumlah_guru_bina').val(data.jumlah_guru_bina)
		$('#jumlah_guru_pamong').val(data.jumlah_guru_pamong)
		$('#status').val(data.status)
		$('#email').val(data.email)

		$('#myModal').modal('toggle')
	})
	.fail(($data) => {
		$.failMessage('Gagal mendapatkan data.', ' cabang')
	})
}
