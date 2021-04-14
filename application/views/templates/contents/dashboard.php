<!-- MAIN CONTENT -->
<div id="content">

	<!-- row -->
	<div class="row">

		<!-- col -->
		<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
			<h1 class="page-title txt-color-blueDark">
				<!-- PAGE HEADER -->
				<i class="fa-fw fa fa-table"></i>

				<?= $title ?>
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

	<section id="widget-grid" class="">

		<!-- row -->
		<div class="row">

			<!-- NEW WIDGET START -->
			<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<div class="row" style="margin-top: -30px;">
					<div class="col-lg-8">
						<div class="row">
							<div class="col-sm-6 col-md-6 col-lg-6">
								<div class="product-content product-wrap clearfix" style="height: 110px;">
									<div class="row">
										<div class="col-md-4 col-sm-12 col-xs-12">
											<div class="product-image" style="height: 109px;min-height: auto;">
												<i class="fa fa-home" style="font-size: 50px; margin: auto; width: 50%;padding: 30px;"></i>
											</div>
										</div>
										<div class="col-md-8 col-sm-12 col-xs-12">
											<div class="product-deatil" style="border-bottom: none;">
												<h5 class="name" style="margin-top: 10px;">
													<a href="#">
														Total Cabang <span></span>
													</a>
												</h5>
												<p class="price-container">
													<span><?= $pusat['jml'] ?></span>
												</p>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-6 col-md-6 col-lg-6">
								<div class="product-content product-wrap clearfix" style="height: 110px;">
									<div class="row">
										<div class="col-md-4 col-sm-12 col-xs-12">
											<div class="product-image" style="height: 109px;min-height: auto;">
												<i class="fa fa-tasks" style="font-size: 50px; margin: auto; width: 50%;padding: 30px;"></i>
											</div>
										</div>
										<div class="col-md-8 col-sm-12 col-xs-12">
											<div class="product-deatil" style="border-bottom: none;">
												<h5 class="name" style="margin-top: 10px;">
													<a href="#">
														Total Cabang belum RAB <span></span>
													</a>
												</h5>
												<p class="price-container">
													<span>3</span>
												</p>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-6 col-md-6 col-lg-6">
								<div class="product-content product-wrap clearfix" style="height: 110px;">
									<div class="row">
										<div class="col-md-4 col-sm-12 col-xs-12">
											<div class="product-image" style="height: 109px;min-height: auto;">
												<i class="fa fa-tasks" style="font-size: 50px; margin: auto; width: 50%;padding: 30px;"></i>
											</div>
										</div>
										<div class="col-md-8 col-sm-12 col-xs-12">
											<div class="product-deatil" style="border-bottom: none;">
												<h5 class="name" style="margin-top: 10px;">
													<a href="#">
														Total Cabang udah RAB <span></span>
													</a>
												</h5>
												<p class="price-container">
													<span>3</span>
												</p>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-6 col-md-6 col-lg-6">
								<div class="product-content product-wrap clearfix" style="height: 110px;">
									<div class="row">
										<div class="col-md-4 col-sm-12 col-xs-12">
											<div class="product-image" style="height: 109px;min-height: auto;">
												<i class="fa fa-dollar" style="font-size: 50px; margin: auto; width: 50%;padding: 30px;"></i>
											</div>
										</div>
										<div class="col-md-8 col-sm-12 col-xs-12">
											<div class="product-deatil" style="border-bottom: none;">
												<h5 class="name" style="margin-top: 10px;">
													<a href="#">
														Total Pemasukan Cabang <span></span>
													</a>
												</h5>
												<p class="price-container">
													<span>3</span>
												</p>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-6 col-md-6 col-lg-6">
								<div class="product-content product-wrap clearfix" style="height: 110px;">
									<div class="row">
										<div class="col-md-4 col-sm-12 col-xs-12">
											<div class="product-image" style="height: 109px;min-height: auto;">
												<i class="fa fa-dollar" style="font-size: 50px; margin: auto; width: 50%;padding: 30px;"></i>
											</div>
										</div>
										<div class="col-md-8 col-sm-12 col-xs-12">
											<div class="product-deatil" style="border-bottom: none;">
												<h5 class="name" style="margin-top: 10px;">
													<a href="#">
														Total Pengeluaran Cabang <span></span>
													</a>
												</h5>
												<p class="price-container">
													<span>3</span>
												</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- profile -->
					<div class="col-lg-4">
						<div class="product-content product-wrap clearfix" style="height: 394px;">
							<div class="row">
								<div class="col-md-1 col-sm-12 col-xs-12">
								</div>
								<div class="col-md-11 col-sm-12 col-xs-12">
									<div class="product-deatil" style="border-bottom: none;">
										<h4><b>Profil Data</b></h4>
										<hr>
										<table style="width: 100%;">
											<tr>
												<td style="width: 25%;">
													<h5 class="name" style="font-size: 12px;">NPSN</h5>
												</td>
												<td style="width: 5%;">:</td>
												<td>
													<h5 class="name" style="font-size: 14px;"><b><?= $pusat['profile']['kode']; ?></b></h5>
												</td>
											</tr>
											<tr>
												<td style="width: 25%;">
													<h5 class="name" style="font-size: 12px;">Nama</h5>
												</td>
												<td style="width: 5%;">:</td>
												<td>
													<h5 class="name" style="font-size: 14px;"><b><?= $pusat['profile']['nama']; ?></b></h5>
												</td>
											</tr>
											<tr>
												<td style="width: 25%;">
													<h5 class="name" style="font-size: 12px;">No. Telpon</h5>
												</td>
												<td style="width: 5%;">:</td>
												<td>
													<h5 class="name" style="font-size: 14px;"><b><?= $pusat['profile']['no_telpon']; ?></b></h5>
												</td>
											</tr>
											<tr>
												<td style="width: 25%;">
													<h5 class="name" style="font-size: 12px;">Alamat</h5>
												</td>
												<td style="width: 5%;">:</td>
												<td>
													<h5 class="name" style="font-size: 14px;"><b><?= $pusat['profile']['alamat']; ?></b></h5>
												</td>
											</tr>
										</table>
										<hr>
										<h5 style="text-align: center;">"Memanusiakan Manusia"</h5>
									</div>
								</div>
							</div>
						</div>
					</div>
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
				<!-- your contents here -->
			</div>

		</div>

		<!-- end row -->

	</section>

</div>
<!-- END MAIN CONTENT -->