$(() => {

	function format_ringgit(angka, prefix) 
	{
	 	if(angka)
	 	{
    		let number_string 	= angka.toString().replace(/[^,\d]/g, '').toString(),
			split   			= number_string.split(','),
			sisa     			= split[0].length % 3,
			rupiah     			= split[0].substr(0, sisa),
			ribuan     			= split[0].substr(sisa).match(/\d{3}/gi)

			// tambahkan titik jika yang di input sudah menjadi angka ribuan
			if(ribuan)
			{
				separator = sisa ? ',' : ''
				rupiah += separator + ribuan.join(',')
			}

			rupiah = split[1] != undefined ? rupiah + ',' + split[1] : rupiah
			
			// return prefix == undefined ? rupiah : (rupiah ? 'Rp. ' + rupiah : '')
			return prefix == undefined ? rupiah : (rupiah ? '' + rupiah : '')
	    }
	    else
	    {
	        return 0
	    }
	}

	function format_rupiah(angka, prefix) 
	{
	 	if(angka)
	 	{
    		let number_string 	= angka.toString().replace(/[^,\d]/g, '').toString(),
			split   			= number_string.split(','),
			sisa     			= split[0].length % 3,
			rupiah     			= split[0].substr(0, sisa),
			ribuan     			= split[0].substr(sisa).match(/\d{3}/gi)

			// tambahkan titik jika yang di input sudah menjadi angka ribuan
			if(ribuan)
			{
				separator = sisa ? '.' : ''
				rupiah += separator + ribuan.join('.')
			}

			rupiah = split[1] != undefined ? rupiah + ',' + split[1] : rupiah
			
			// return prefix == undefined ? rupiah : (rupiah ? 'Rp. ' + rupiah : '')
			return prefix == undefined ? rupiah : (rupiah ? '' + rupiah : '')
	    }
	    else
	    {
	        return 0
	    }
	}

	let base_url = '<?php echo base_url();?>'
	
	// initialize responsive datatable
	dynamic(npsn)
	$("#val-npsn").val(npsn)
	function dynamic(npsn=null)
	{
		$('#dt_basic').DataTable({
			"ajax": {
				"url": "<?= base_url()?>realisasi/ajax_data_dana_sisa/",
				"data": {
					'npsn': npsn
				},
				"type": 'POST'
			},
			"scrollX": true,
			"processing": true,
          	"serverSide": true,
			"columns": [
				{ "data": "kodes" },
				{ "data": "nama_aktifitas" },
				{ "data": "total_harga_ringgit" },
				{ "data": "total_harga_rupiah" },
				{ "data": "harga_ringgit" },
				{ "data": "harga_rupiah" },
				{
					"data": "harga_ringgit", render(data, type, full, meta)
					{
						let sisa = full.total_harga_ringgit-full.harga_ringgit
						return sisa
					}
				},
				{
					"data": "harga_rupiah", render(data, type, full, meta)
					{
						let sisa = full.total_harga_rupiah-full.harga_rupiah
						return sisa
					}
				},
				{
					"data": "id_realisasi", render(data, type, full, meta)
					{
						if(data == null){
							return `Belum Dibelanjakan`
						}else{
							return `Sudah Dibelanjakan`
						}
					}
				},
				{
					"data": "id_realisasi", render(data, type, full, meta)
					{
						if(data == null){
							return `<button style="width: 100%;" class="btn btn-primary btn-xs" onclick="Belanja(${full.id})">
										<i class="fa fa-edit"></i> Belanja
									</button>`
						}else{
							return `<button style="width: 100%;" class="btn btn-success btn-xs" onclick="Detail(${full.id_realisasi})">
										<i class="fa fa-edit"></i> Detail
									</button>`
						}
					}
				}
			],
			"aoColumnDefs": [
			  { 'bSortable': false, 'aTargets': [ "no-sort" ] }
			]
		})
	}

	$('#form').submit(function(evt) {
		evt.preventDefault();

		var formData = new FormData(this);
		let id 			= $('#form input[name=id]').val();
		$.ajax({
			type: 'POST',
			url:'<?= base_url() ?>realisasi/insert',
			data:formData,
			cache:false,
			contentType: false,
			processData: false,
			success: function(data) {
				$("#dt_basic").dataTable().fnDestroy();
				$.doneMessage('Berhasil ditambahkan.', 'Belanja')
				let npsn = $("#val-npsn").val()
				dynamic(npsn);
				$('#imageUploadForm input[name=id]').val(0);
				$('#nama').val('');
				$('#keterangan').val('');
				$('#file').val('');
				$('#harga_ringgit').val('');
				$('#harga_rupiah').val('');
				$('#myModal').modal('toggle');
			},
			error: function(data) {
				$.failMessage('Gagal ditambahkan.', 'Belanja')
				$('#myModal').modal('toggle');
			}
		});
		
	});
})

function format_ringgit(angka, prefix) 
{
 	if(angka)
 	{
		let number_string 	= angka.toString().replace(/[^,\d]/g, '').toString(),
		split   			= number_string.split(','),
		sisa     			= split[0].length % 3,
		rupiah     			= split[0].substr(0, sisa),
		ribuan     			= split[0].substr(sisa).match(/\d{3}/gi)

		// tambahkan titik jika yang di input sudah menjadi angka ribuan
		if(ribuan)
		{
			separator = sisa ? ',' : ''
			rupiah += separator + ribuan.join(',')
		}

		rupiah = split[1] != undefined ? rupiah + ',' + split[1] : rupiah
		
		// return prefix == undefined ? rupiah : (rupiah ? 'Rp. ' + rupiah : '')
		return prefix == undefined ? rupiah : (rupiah ? '' + rupiah : '')
    }
    else
    {
        return 0
    }
}

function format_rupiah(angka, prefix) 
{
 	if(angka)
 	{
		let number_string 	= angka.toString().replace(/[^,\d]/g, '').toString(),
		split   			= number_string.split(','),
		sisa     			= split[0].length % 3,
		rupiah     			= split[0].substr(0, sisa),
		ribuan     			= split[0].substr(sisa).match(/\d{3}/gi)

		// tambahkan titik jika yang di input sudah menjadi angka ribuan
		if(ribuan)
		{
			separator = sisa ? '.' : ''
			rupiah += separator + ribuan.join('.')
		}

		rupiah = split[1] != undefined ? rupiah + ',' + split[1] : rupiah
		
		// return prefix == undefined ? rupiah : (rupiah ? 'Rp. ' + rupiah : '')
		return prefix == undefined ? rupiah : (rupiah ? '' + rupiah : '')
    }
    else
    {
        return 0
    }
}

// Click Ubah
const Belanja = (id) => {
	$('#myModalLabel').html('Belanja')
	$.ajax({
		method: 'post',
		url: '<?= base_url() ?>realisasi/getDetailRab',
		data: {
			id: id
		}
	}).done((data) => {
		$("#npsn").text('NPSN: '+data.npsn)
		$("#id").val(id)
		$("#id_cabang").val(data.id_cabang)
		$("#text-kode").val(data.kode)
		$("#text-nama").val(data.nama_aktifitas)
		$("#text-total-ringgit").val('RM '+format_ringgit(data.total_harga_ringgit))
		$("#text-total-rupiah").val('Rp '+format_rupiah(data.total_harga_rupiah))
		$("#kode").val(data.kode)

		$('#myModal').modal('toggle')
	})
	.fail(($data) => {
		$.failMessage('Gagal mendapatkan data.', ' cabang')
	})

	$('#text-harga-ringgit').on('change', function(){
		$.ajax({
			method: 'post',
			url: '<?= base_url() ?>rab/cabang/getkurs',
			data: {
				ringgit : this.value,
			},
		}).done((data) => {
			$("#harga-ringgit").val(this.value)
			$("#text-harga-ringgit").val('RM '+format_ringgit(this.value))
			$("#harga-rupiah").val(data.rupiah)
			$("#text-harga-rupiah").val('Rp '+format_rupiah(data.rupiah))
		}).fail(($xhr) => {
			// console.log($xhr)
		})
		
	})
}

let base_url = '<?php echo base_url();?>'
const Detail = (id) => {
	$('#myModalLabelRealisasi').html('Detail Belanja')
	$.ajax({
		method: 'post',
		url: '<?= base_url() ?>realisasi/getDetailRealisasi',
		data: {
			id: id
		}
	}).done((data) => {
		$("#npsn-realisasi").text('NPSN: '+data.npsn)
		$("#id").val(id)
		$("#id_cabang").val(data.id_cabang)
		$("#kode-realisasi").val(data.kode)
		$("#nama-realisasi").val(data.nama)
		$("#keterangan-realisasi").val(data.keterangan)
		$("#harga-ringgit-realisasi").val('RM '+format_ringgit(data.harga_ringgit))
		$("#harga-rupiah-realisasi").val('Rp '+format_rupiah(data.harga_rupiah))
		$("#tanggal-realisasi").val(data.tanggal)
		$('#image').html('<img src="'+base_url+'gambar/'+data.gambar+'" width="100%;">');

		$("#text2-kode").val(data.kode)
		$("#text2-nama").val(data.nama_aktifitas)
		$("#text2-total-ringgit").val('RM '+format_ringgit(data.total_harga_ringgit))
		$("#text2-total-rupiah").val('Rp '+format_rupiah(data.total_harga_rupiah))

		$('#myModalRealisasi').modal('toggle')
	})
	.fail(($data) => {
		$.failMessage('Gagal mendapatkan data.', ' cabang')
	})
}
