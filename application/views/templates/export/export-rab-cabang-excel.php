<!DOCTYPE html>

<html>

<head>
    <title>Export Data</title>
    <style>
        #table {
            font-family: Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        #table td,
        #table th {
            border: 1px solid #ddd;
            padding: 8px;
        }

        #table tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        #table tr:hover {
            background-color: #ddd;
        }

        #table th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: #4CAF50;
            color: white;
        }
    </style>
</head>

<body>
    <?php

    header("Content-type: application/vnd-ms-excel");

    header("Content-Disposition: attachment; filename=RAB Cabang.xls");

    ?>
    <div class="container">
        <div class="page-header text-center">
            <h4>Laporan Penjualan<br></h4>
        </div>
        <div id="table">
            <table>
                <thead>
                    <tr>
                        <th> Cabang</th>
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
                        <th> Status</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($data as $d) : ?>
                        <tr>
                            <td><?= $d['nama_cabang']; ?></td>
                            <td><?= $d['uraian']; ?></td>
                            <td><?= $d['kodes']; ?></td>
                            <td><?= $d['nama_aktifitas']; ?></td>
                            <td><?= $d['jumlah_1']; ?></td>
                            <td><?= $d['satuan_1']; ?></td>
                            <td><?= $d['jumlah_2']; ?></td>
                            <td><?= $d['satuan_2']; ?></td>
                            <td><?= $d['jumlah_3']; ?></td>
                            <td><?= $d['satuan_3']; ?></td>
                            <td><?= $d['jumlah_4']; ?></td>
                            <td><?= $d['satuan_4']; ?></td>
                            <td><?= number_format($d['harga_ringgit'], 0, ".", "."); ?></td>
                            <td><?= number_format($d['harga_rupiah'], 0, ",", ","); ?></td>
                            <td><?= number_format($d['total_harga_ringgit'], 0, ".", "."); ?></td>
                            <td><?= number_format($d['total_harga_rupiah'], 0, ",", ","); ?></td>
                            <td><?= $d['prioritas']; ?></td>
                            <td><?= $d['statuss']; ?></td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>
</body>

</html>