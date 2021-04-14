
<div id="content">

	<!-- row -->
	<div class="row">
		
		<!-- col -->
		<div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
			<h1 class="page-title txt-color-blueDark">
				<!-- PAGE HEADER -->
				<i class="fa-fw fa fa-table"></i> 
				
				<?= $title ?> - <b><?=$npsn?> (<?=$cabang?>)</b>
			</h1>
		</div>

		<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
			<h1 class="page-title txt-color-blueDark" style="text-align: right;">
				Total Ringgit: <b><?=$total['total_harga_ringgit'];?></b>
			</h1>
		</div>
		<!-- end col -->
		
	</div>
	<!-- end row -->
	
	<!--
		The ID "widget-grid" will start to initialize all widgets below 
		You do not need to use widgets if you dont want to. Simply remove 
		the <section></section> and you can use wells or panels instead 
		-->
	
	<!-- widget grid -->
	<section id="widget-grid" class="">
	
		<!-- row -->
		<div class="row">
			
			<!-- NEW WIDGET START -->
			<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				
				<!-- Widget ID (each widget will need unique ID)-->
				<div class="jarviswidget" id="wid-id-0"
					data-widget-colorbutton="false"
					data-widget-editbutton="false"
					data-widget-deletebutton="false">
					<header>
						<span class="widget-icon"> <i class="fa fa-table"></i> </span>
					</header>
	
					<!-- widget div-->
					<div>
						
						<!-- widget edit box -->
						<div class="jarviswidget-editbox">
							<!-- This area used as dropdown edit box -->
							<input class="form-control" type="text">	
						</div>
						<!-- end widget edit box -->
						
						<!-- widget content -->
						<div class="widget-body">
				
							<table id="dt_basic" class="table table-striped table-bordered table-hover" width="100%">
								<thead>			                
									<tr>
										<th> Kode</th>
										<th> Nama</th>
										<th> Total Ringgit</th>
										<th> Total Rupiah</th>
										<th> Realisasi Ringgit</th>
										<th> Realisasi Rupiah</th>
										<th> Sisa Ringgit</th>
										<th> Sisa Rupiah</th>
										<th> Status</th>
										<th style="text-align: center;"> #</th>
									</tr>
								</thead>
								
							</table>	
						</div>
						<!-- end widget content -->
						
					</div>
					<!-- end widget div -->
					
				</div>
				<!-- end widget -->
	
			</article>
			<!-- WIDGET END -->
			
		</div>
	
		<!-- end row -->
	
	</section>
	<!-- end widget grid -->

</div>
<!-- END MAIN CONTENT -->

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<form id="form" method="post" enctype="multipart/form-data">
			<input type="hidden" name="id" id="id">
			<input type="hidden" name="id_cabang" id="id_cabang">
			<input type="hidden" name="val_npsn" id="val-npsn">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<div class="row">
						<div class="col-md-6">
							<br>
							<h4 style="font-weight: bold;" class="modal-title" id="myModalLabel"></h4>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<h6 id="npsn"></h6>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-6">
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="nama"> Kode</label>
										<input type="text" class="form-control" id="text-kode" readonly=""/>
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<label for="nama"> Nama</label>
										<input type="text" class="form-control" id="text-nama" readonly=""/>
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<label for="nama"> Total Ringgit</label>
										<input type="text" class="form-control" id="text-total-ringgit" readonly=""/>
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<label for="nama"> Total Rupiah</label>
										<input type="text" class="form-control" id="text-total-rupiah" readonly=""/>
									</div>
								</div>
							</div>

						</div>
						<div class="col-md-6">
							<div class="row">
								<div class="col-md-6" style="display: none;">
									<div class="form-group">
										<label for="nama"> Kode</label>
										<input type="text" class="form-control" id="kode" name="kode" readonly="" placeholder="" required/>
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<label for="nama"> Nama</label>
										<input type="text" class="form-control" id="nama" name="nama" placeholder="" required/>
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<label for="nama"> Keterangan</label>
										<textarea class="form-control" id="keterangan" name="keterangan"></textarea>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="nama"> Harga Ringgit</label>
										<input type="hidden" class="form-control" id="harga-ringgit" name="harga_ringgit">
										<input type="text" class="form-control" id="text-harga-ringgit">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="nama"> Harga Rupiah</label>
										<input type="hidden" class="form-control" id="harga-rupiah" name="harga_rupiah">
										<input type="text" class="form-control" id="text-harga-rupiah">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="nama"> Gambar</label>
										<input type="file" class="form-control" id="file" name="file" required/>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="nama"> Tanggal</label>
										<input type="date" class="form-control" value="<?php echo date('Y-m-d');?>" id="tanggal" name="tanggal" required/>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">
						Submit
					</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">
						Cancel
					</button>
				</div>
			</div><!-- /.modal-content -->
		</form>
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="myModalRealisasi" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<form id="form" method="post" enctype="multipart/form-data">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<div class="row">
						<div class="col-md-6">
							<br>
							<h4 style="font-weight: bold;" class="modal-title" id="myModalLabelRealisasi"></h4>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<h6 id="npsn-realisasi"></h6>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-6">
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="nama"> Kode</label>
										<input type="text" class="form-control" id="text2-kode" readonly=""/>
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<label for="nama"> Nama</label>
										<input type="text" class="form-control" id="text2-nama" readonly=""/>
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<label for="nama"> Total Ringgit</label>
										<input type="text" class="form-control" id="text2-total-ringgit" readonly=""/>
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<label for="nama"> Total Rupiah</label>
										<input type="text" class="form-control" id="text2-total-rupiah" readonly=""/>
									</div>
								</div>
							</div>

						</div>
						<div class="col-md-6">
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="nama"> Nama</label>
										<input type="text" class="form-control" id="nama-realisasi" readonly name="nama-realisasi" placeholder="" required/>
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<label for="nama"> Keterangan</label>
										<textarea class="form-control" id="keterangan-realisasi" readonly name="keterangan-realisasi"></textarea>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="nama"> Harga Ringgit</label>
										<input type="text" class="form-control" id="harga-ringgit-realisasi" readonly name="harga_ringgit">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="nama"> Harga Rupiah</label>
										<input type="text" class="form-control" id="harga-rupiah-realisasi" readonly name="harga_rupiah">
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<label for="nama"> Tanggal</label>
										<input type="date" class="form-control" id="tanggal-realisasi" readonly name="tanggal" required/>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-3">
						</div>
						<div class="col-md-6"style="text-align: center;">
							<div class="form-group"style="text-align: center;">
								<label for="nama"> Gambar</label>
								<hr>
								<div id="image"></div>
							</div>
						</div>
					</div>
				</div>
			</div><!-- /.modal-content -->
		</form>
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script type="text/javascript">
	let npsn = '<?=$npsn?>'
</script>