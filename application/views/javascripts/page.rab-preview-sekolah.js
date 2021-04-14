$(() => {

	let base_url = '<?php echo base_url();?>'
	
	// initialize responsive datatable
	dynamic(npsn)

	function dynamic(npsn=null)
	{
		$('#dt_basic').DataTable({
			"ajax": {
				"url": "<?= base_url()?>rab/preview/ajax_data_detail/",
				"data": {
					'npsn': npsn
				},
				"type": 'POST'
			},
			"scrollX": true,
			"processing": true,
          	"serverSide": true,
			"columns": [
				{ "data": "uraian" },
				{ "data": "kodes" },
				{ "data": "nama_aktifitas" },
				{ "data": "jumlah_1" },
				{ "data": "satuan_1" },
				{ "data": "jumlah_2" },
				{ "data": "satuan_2" },
				{ "data": "jumlah_3" },
				{ "data": "satuan_3" },
				{ "data": "jumlah_4" },
				{ "data": "satuan_4" },
				{ "data": "harga_ringgit" },
				{ "data": "harga_rupiah" },
				{ "data": "total_harga_ringgit" },
				{ "data": "total_harga_rupiah" },
				{ "data": "prioritas" }
			],
			"aoColumnDefs": [
			  { 'bSortable': false, 'aTargets': [ "no-sort" ] }
			]
		})
	}



})

