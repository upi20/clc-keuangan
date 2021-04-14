<!-- MAIN CONTENT -->
<div id="content">


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
				<div class="row" style="margin-top: -30px;">
					<div class="col-lg-8">
						<div class="row">
							<div class="col-sm-6 col-md-6 col-lg-6">
								<div class="product-content product-wrap clearfix" style="height: 110px;">
									<div class="row">
										<div class="col-md-4 col-sm-12 col-xs-12">
											<div class="product-image" style="height: 109px;min-height: auto;">
												<i class="fa fa-users" style="font-size: 50px; margin: auto; width: 50%;padding: 30px;"></i>
											</div>
										</div>
										<div class="col-md-8 col-sm-12 col-xs-12">
											<div class="product-deatil" style="border-bottom: none;">
												<h5 class="name" style="margin-top: 10px;">
													<a href="#">
														Jumlah Dana Diterima <span></span>
													</a>
												</h5>
												<p class="price-container">
													<span>20</span>
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
												<i class="fa fa-calendar" style="font-size: 50px; margin: auto; width: 50%;padding: 30px;"></i>
											</div>
										</div>
										<div class="col-md-8 col-sm-12 col-xs-12">
											<div class="product-deatil" style="border-bottom: none;">
												<h5 class="name" style="margin-top: 10px;">
													<a href="#">
														Total Pengeluaran <span></span>
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
												<i class="fa fa-calendar" style="font-size: 50px; margin: auto; width: 50%;padding: 30px;"></i>
											</div>
										</div>
										<div class="col-md-8 col-sm-12 col-xs-12">
											<div class="product-deatil" style="border-bottom: none;">
												<h5 class="name" style="margin-top: 10px;">
													<a href="#">
														Total Saldo <span></span>
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
												<i class="fa fa-calendar" style="font-size: 50px; margin: auto; width: 50%;padding: 30px;"></i>
											</div>
										</div>
										<div class="col-md-8 col-sm-12 col-xs-12">
											<div class="product-deatil" style="border-bottom: none;">
												<h5 class="name" style="margin-top: 10px;">
													<a href="#">
														Jumlah Dana Dialihkan <span></span>
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
												<i class="fa fa-calendar" style="font-size: 50px; margin: auto; width: 50%;padding: 30px;"></i>
											</div>
										</div>
										<div class="col-md-8 col-sm-12 col-xs-12">
											<div class="product-deatil" style="border-bottom: none;">
												<h5 class="name" style="margin-top: 10px;">
													<a href="#">
														Jumlah Dana Sisa <span></span>
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
													<h5 class="name" style="font-size: 14px;"><b><?= $profil['kode'] ?></b></h5>
												</td>
											</tr>
											<tr>
												<td style="width: 25%;">
													<h5 class="name" style="font-size: 12px;">Nama</h5>
												</td>
												<td style="width: 5%;">:</td>
												<td>
													<h5 class="name" style="font-size: 14px;"><b><?= $profil['nama'] ?></b></h5>
												</td>
											</tr>
											<tr>
												<td style="width: 25%;">
													<h5 class="name" style="font-size: 12px;">No. Telpon</h5>
												</td>
												<td style="width: 5%;">:</td>
												<td>
													<h5 class="name" style="font-size: 14px;"><b><?= $profil['no_telpon'] ?></b></h5>
												</td>
											</tr>
											<tr>
												<td style="width: 25%;">
													<h5 class="name" style="font-size: 12px;">Alamat</h5>
												</td>
												<td style="width: 5%;">:</td>
												<td>
													<h5 class="name" style="font-size: 14px;"><b><?= $profil['alamat'] ?></b></h5>
												</td>
											</tr>
											<tr>
												<td style="width: 25%;">
													<h5 class="name" style="font-size: 12px;">Kelas 7</h5>
												</td>
												<td style="width: 5%;">:</td>
												<td>
													<h5 class="name" style="font-size: 14px;"><b><?= $profil['jumlah_kelas_7'] ?></b></h5>
												</td>
											</tr>
											<tr>
												<td style="width: 25%;">
													<h5 class="name" style="font-size: 12px;">Kelas 8</h5>
												</td>
												<td style="width: 5%;">:</td>
												<td>
													<h5 class="name" style="font-size: 14px;"><b><?= $profil['jumlah_kelas_8'] ?></b></h5>
												</td>
											</tr>
											<tr>
												<td style="width: 25%;">
													<h5 class="name" style="font-size: 12px;">Kelas 9</h5>
												</td>
												<td style="width: 5%;">:</td>
												<td>
													<h5 class="name" style="font-size: 14px;"><b><?= $profil['jumlah_kelas_9'] ?></b></h5>
												</td>
											</tr>
											<tr>
												<td style="width: 25%;">
													<h5 class="name" style="font-size: 12px;">Jumlah Siswa</h5>
												</td>
												<td style="width: 5%;">:</td>
												<td>
													<h5 class="name" style="font-size: 14px;"><b><?= $profil['total_jumlah_siswa'] ?></b></h5>
												</td>
											</tr>
											<tr>
												<td style="width: 25%;">
													<h5 class="name" style="font-size: 12px;">Guru Bina</h5>
												</td>
												<td style="width: 5%;">:</td>
												<td>
													<h5 class="name" style="font-size: 14px;"><b><?= $profil['jumlah_guru_bina'] ?></b></h5>
												</td>
											</tr>
											<tr>
												<td style="width: 25%;">
													<h5 class="name" style="font-size: 12px;">Guru Pamong</h5>
												</td>
												<td style="width: 5%;">:</td>
												<td>
													<h5 class="name" style="font-size: 14px;"><b><?= $profil['jumlah_guru_pamong'] ?></b></h5>
												</td>
											</tr>
											<tr>
												<td style="width: 25%;">
													<h5 class="name" style="font-size: 12px;">Jumlah Guru</h5>
												</td>
												<td style="width: 5%;">:</td>
												<td>
													<h5 class="name" style="font-size: 14px;"><b><?= $profil['total_jumlah_guru'] ?></b></h5>
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
	<!-- end widget grid -->

</div>
<!-- END MAIN CONTENT -->