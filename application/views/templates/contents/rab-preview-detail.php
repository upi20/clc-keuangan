
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
							<div class="pull-right">
								<a class="btn btn-success btn-sm" href="<?= base_url()?>rab/preview/excel">
									<i class="fa fa-download"></i> Excel
								</a>
								<button class="btn btn-danger btn-sm" id="pdf">
									<i class="fa fa-download"></i> PDF
								</button>
							</div>
				
							<table id="dt_basic" class="table table-striped table-bordered table-hover" width="100%">
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
	
		<!-- row -->
	
		<div class="row">
	
			<!-- a blank row to get started -->
			<div class="col-sm-12">
				<div class="pull-right">
					<a href="<?=base_url()?>rab/preview/tindakan/<?=$npsn?>/3" class="btn btn-danger btn-sm">
						<i class="fa fa-close"></i> Tolak
					</a>
					<a href="<?=base_url()?>rab/preview/tindakan/<?=$npsn?>/2" class="btn btn-primary btn-sm">
						<i class="fa fa-check"></i> Terima
					</a>
				</div>
			</div>
				
		</div>
	
		<!-- end row -->
	
	</section>
	<!-- end widget grid -->

</div>
<!-- END MAIN CONTENT -->
<script type="text/javascript">
	let npsn = '<?=$npsn?>'
</script>