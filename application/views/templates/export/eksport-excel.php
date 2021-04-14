<!DOCTYPE html>

<html>

<head>

	<title>Export Data</title>

</head>

<style type="text/css">

	body{

		font-family: sans-serif;

	}

	table{

		margin: 20px auto;

		border-collapse: collapse;

	}

	table th,

	table td{

		border: 1px solid #3c3c3c;

		padding: 3px 8px;

	}

	a{

		background: blue;

		color: #fff;

		padding: 8px 10px;

		text-decoration: none;

		border-radius: 2px;

	}

</style>



<body>

<?php

	header("Content-type: application/vnd-ms-excel");

	header("Content-Disposition: attachment; filename=RAB ".$nama_cabang.".xls");

?>

<p>RENCANA KEGIATAN DAN ANGGARAN SEKOLAH(RKAS)<br>
BANTUAN OPERASIONAL CLC SEKOLAH MENENGAH PERTAMA(SMP)<br>
TAHUN 2021</p>


<table>
	<tr>
		<td>CLC</td>
		<td>: CLC KOTA KINABALU</td>
	</tr>
	<tr>
		<td>Negara</td>
		<td>: Malaysia</td>
	</tr>
</table>
<br>
<table id="dt_basic" class="table table-striped table-bordered table-hover" width="100%" border="1">
	<thead>			                
		<tr>
			<th> Aktifitas</th>
			<th> Kode Sub Aktifitas</th>
			<th> Nama Sub Aktifitas</th>
			<th> Jumlah</th>
			<th> Satuan</th>
			<th> Jumlah</th>
			<th> Satuan</th>
			<th> Jumlah</th>
			<th> Satuan</th>
			<th> Jumlah</th>
			<th> Satuan</th>
			<th> Ringgit</th>
			<th> Rupiah</th>
			<th> Total Ringgit</th>
			<th> Total Rupiah</th>
			<th> Prioritas</th>
		</tr>
		<?php foreach ($aktifitas_1 as $key):?>
			<tr>
				<td></td>
				<td align="left"><?= $key['kode']?></td>
				<td><?= $key['uraian']?></td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
			</tr>
		<?php endforeach; ?>
		<?php foreach ($aktifitas_2 as $key):?>
			<tr>
				<td></td>
				<td><?= $key['kode']?></td>
				<td><?= $key['uraian'] ?></td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
			</tr>
		<?php endforeach; ?>
		<?php foreach ($isi as $key): ?>
		<tr>
			<td><?= $key['uraian'] ?></td>
			<td><?= $key['kodes'] ?></td>
			<td><?= $key['nama_aktifitas'] ?></td>
			<td><?= $key['jumlah_1'] ?></td>
			<td><?= $key['satuan_1'] ?></td>
			<td><?= $key['jumlah_2'] ?></td>
			<td><?= $key['satuan_2'] ?></td>
			<td><?= $key['jumlah_3'] ?></td>
			<td><?= $key['satuan_3'] ?></td>
			<td><?= $key['jumlah_4'] ?></td>
			<td><?= $key['satuan_4'] ?></td>
			<td><?= $key['harga_ringgit'] ?></td>
			<td><?= $key['harga_rupiah'] ?></td>
			<td><?= $key['total_harga_ringgit'] ?></td>
			<td><?= $key['total_harga_rupiah'] ?></td>
			<td><?= $key['prioritas'] ?></td>
		</tr>
		<?php endforeach ?>
	</thead>
</table>

</body>

</html>