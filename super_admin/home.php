<?php

if (!isset($_SESSION)) {
	session_start();
}

require_once 'includes.php';

require_once("conn.php");

?>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>Home | Online Learning Platforms | Dashboard</title>

	<?php
	require_once 'headercss.php';
	?>

</head>

<body>

	<?php
	// require_once 'preloader.php';
	?>


	<!--**********************************
        Main wrapper start
    ***********************************-->
	<div id="main-wrapper">



		<!--**********************************
            Sidebar start
        ***********************************-->
		<div class="deznav">
			<div class="deznav-scroll">
				<?php
				require_once 'sidebarmenu.php';
				?>
			</div>
		</div>
		<!--**********************************
            Sidebar end
        ***********************************-->
		<?php
		require_once 'coutquery.php';
		?>

		<!-- Content body start -->
		<div class="content-body bg-lblue">
			<!-- row -->
			<div class="row m-0">
				<div class="col-sm-12 col-md-9 col-lg-9 col-xl-9 col-xxl-9 pt-4">

					<div class="wel_sec bg-primary mb-3">
						<div class="row">
							<div class="col-sm-6 col-md-6 col-lg-6 col-xl-5 my-auto">
								<div class="left_sec py-4 px-5">
									<h2 class="text-light fw-bold">Welcome Back, Lak</h2>
									<p class="text-light mt-3 desc">You’ve learned 70% of your goal this week!
										Keep it up and improve your progress.</p>
								</div>
							</div>
							<div class="col-md-1 col-lg-2 col-xl-3 d-none d-xl-inline"></div>
							<div class="col-sm-6 col-md-5 col-lg-4 col-xl-3 my-auto">
								<div class="left_sec text-center">
									<img class="w-100 right_img" src="../assets/img/Humaaans_Space.png" alt="">
								</div>
							</div>
						</div>
					</div>
					<div class="scroll-sec">
						<div class="row">
							<div class="col-sm-12 col-md-6">
								<div class="card border-0 bg-light">
									<div class="card-body">
										<p class="h6 mb-3 fw-bold">Profile & Payments</p>
										<div class="h-scroll">
											<div class="card bg-primary bg-opacity-10 border-0 p-4 mb-3">
												<div class="row">
													<div class="col-auto my-auto">
														<div class="bg-primary sq-box rounded-circle text-center">
															<h4 class="text-light">
																<i class="fa fa-shield" aria-hidden="true"></i>
															</h4>
														</div>
													</div>
													<div class="col my-auto">
														<p class="h6 mb-0 fw-bold">Online Payments</p>
														<a class="small" href="online_payments.php">View more</a>
													</div>
												</div>
											</div>
											<div class="card bg-primary bg-opacity-10 border-0 p-4 mb-3">
												<div class="row">
													<div class="col-auto my-auto">
														<div class="bg-primary sq-box rounded-circle text-center">
															<h4 class="text-light">
																<i class="fa fa-credit-card" aria-hidden="true"></i>
															</h4>
														</div>
													</div>
													<div class="col my-auto">
														<p class="h6 mb-0 fw-bold">Bank Payments</p>
														<a class="small" href="paid_bank_payaments.php">View more</a>
													</div>
												</div>
											</div>
											<div class="card bg-primary bg-opacity-10 border-0 p-4 mb-3">
												<div class="row">
													<div class="col-auto my-auto">
														<div class="bg-primary sq-box rounded-circle text-center">
															<h4 class="text-light">
																<i class="fa fa-user-o" aria-hidden="true"></i>
															</h4>
														</div>
													</div>
													<div class="col my-auto">
														<p class="h6 mb-0 fw-bold">Teacher Payments</p>
														<a class="small" href="payment_report.php">View more</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-12 col-md-6">
								<div class="card border-0 bg-light">
									<div class="card-body">
										<p class="h6 mb-3 fw-bold">Lectures</p>
										<div class="h-scroll">
											<?php
											$totLec = mysqli_query($conn, "SELECT lesson, image FROM `lmsclass_schlmsle` WHERE add_date2 <= '" . date('Y-m-t') . "' ");
											while ($sub_resalt = mysqli_fetch_array($totLec)) {
											?>
												<div class="card border-0 rounded-0 p-3">
													<div class="row">
														<div class="col-auto">
															<div class="sq-box bg-warning bg-opacity-10 rounded-3">
																<img src="../super_admin/../admin/images/class/<?php echo $sub_resalt['image']; ?>" alt="" class="img-fluid m-auto">
															</div>
														</div>
														<div class="col">
															<p class="fw-bold mb-1">
																<?php echo $sub_resalt['lesson']; ?>
															</p>
															<a href="/super_admin/class_schedule.php" class="btn bg-success bg-opacity-10 text-success btn-sm">View More</a>
														</div>
													</div>
												</div>

											<?php
											}
											?>
										</div>

									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- <div class="fdb-sec my-3">
						<div class="card border-0 bg-light">
							<div class="card-body">
								<div class="h-scroll">
									<p class="h6 mb-3 fw-bold">Feedbacks</p>
									<p>How would you rate your overall experience with the Build an Android Application in Swift
										Learn the fundamentals? </p>
									<div class="star-sec">
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star"></span>
										<span class="fa fa-star"></span>
									</div>
									<div class="rvw-sec mt-3">
										<table class="w-100 table table-borderless">
											<tr>
												<td width="10%">
													<p>?</p>
												</td>
												<td width="50%">
													<p>is easy to use the course</p>
												</td>
												<td width="40%">
													<span class="fa fa-star checked"></span>
													<span class="fa fa-star checked"></span>
													<span class="fa fa-star checked"></span>
													<span class="fa fa-star"></span>
													<span class="fa fa-star"></span>
												</td>
											</tr>
											<tr>
												<td width="10%">
													<p>?</p>
												</td>
												<td width="50%">
													<p>has the features I want</p>
												</td>
												<td width="40%">
													<span class="fa fa-star checked"></span>
													<span class="fa fa-star checked"></span>
													<span class="fa fa-star checked"></span>
													<span class="fa fa-star"></span>
													<span class="fa fa-star"></span>
												</td>
											</tr>
											<tr>
												<td width="10%">
													<p>?</p>
												</td>
												<td width="50%">
													<p>Feel good</p>
												</td>
												<td width="40%">
													<span class="fa fa-star checked"></span>
													<span class="fa fa-star checked"></span>
													<span class="fa fa-star checked"></span>
													<span class="fa fa-star"></span>
													<span class="fa fa-star"></span>
												</td>
											</tr>
											<tr>
												<td width="10%">
													<p>?</p>
												</td>
												<td width="50%">
													<p>is reliable</p>
												</td>
												<td width="40%">
													<span class="fa fa-star checked"></span>
													<span class="fa fa-star checked"></span>
													<span class="fa fa-star checked"></span>
													<span class="fa fa-star"></span>
													<span class="fa fa-star"></span>
												</td>
											</tr>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div> -->
					<div class="row">
						<div class="col-xl-12 col-xxl-12 col-sm-12">
							<div class="row">
								<div class="col-xl-4 col-xxl-4 col-sm-6">
									<div class="widget-stat card bg-primary">
										<div class="card-body">
											<div class="media">
												<span class="mr-3">
													<i class="la la-users"></i>
												</span>
												<div class="media-body text-white">
													<p class="mb-1 text-light">Total Students</p>
													<h3 class="text-white"><?php echo $total_register ?></h3>
													<div class="progress mb-2 bg-white">
														<div class="progress-bar progress-animated bg-light" style="width: 80%"></div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-xl-4 col-xxl-4 col-sm-6">
									<div class="widget-stat card bg-warning">
										<div class="card-body">
											<div class="media">
												<span class="mr-3">
													<i class="la la-black-tie"></i>
												</span>
												<div class="media-body text-white">
													<p class="mb-1 text-light">Total Teachers</p>
													<h3 class="text-white"><?php echo $total_teacher ?></h3>
													<div class="progress mb-2 bg-white">
														<div class="progress-bar progress-animated bg-light" style="width: 50%"></div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-xl-4 col-xxl-4 col-sm-6">
									<div class="widget-stat card bg-secondary">
										<div class="card-body">
											<div class="media">
												<span class="mr-3">
													<i class="la la-calendar-o"></i>
												</span>
												<div class="media-body text-white">
													<p class="mb-1 text-light">Total Batch</p>
													<h3 class="text-white"><?php echo $total_class ?></h3>
													<div class="progress mb-2 bg-white">
														<div class="progress-bar progress-animated bg-light" style="width: 76%"></div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-xl-4 col-xxl-4 col-sm-6">
									<div class="widget-stat card bg-danger">
										<div class="card-body">
											<div class="media">
												<span class="mr-3">
													<i class="la la-buysellads"></i>
												</span>
												<div class="media-body text-white">
													<p class="mb-1 text-light">Total Courses</p>
													<h3 class="text-white"><?php echo $total_subject ?></h3>
													<div class="progress mb-2 bg-white">
														<div class="progress-bar progress-animated bg-light" style="width: 30%"></div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-xl-4 col-xxl-4 col-sm-6">
									<div class="widget-stat card bg-primary">
										<div class="card-body">
											<div class="media">
												<span class="mr-3">
													<i class="la la-play-circle-o"></i>
												</span>
												<div class="media-body text-white">
													<p class="mb-1 text-light">Total Video Lessons</p>
													<h3 class="text-white"><?php echo $total_lesson ?></h3>
													<div class="progress mb-2 bg-white">
														<div class="progress-bar progress-animated bg-light" style="width: 30%"></div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-xl-4 col-xxl-4 col-sm-6">
									<div class="widget-stat card bg-warning">
										<div class="card-body">
											<div class="media">
												<span class="mr-3">
													<i class="la la-slideshare"></i>
												</span>
												<div class="media-body text-white">
													<p class="mb-1 text-light">Total Class Schedule</p>
													<h3 class="text-white"><?php echo $total_class_schedule ?></h3>
													<div class="progress mb-2 bg-white">
														<div class="progress-bar progress-animated bg-light" style="width: 30%"></div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-xl-4 col-xxl-4 col-sm-6">
									<div class="widget-stat card bg-secondary">
										<div class="card-body">
											<div class="media">
												<span class="mr-3">
													<i class="la la-money"></i>
												</span>
												<div class="media-body text-white">
													<p class="mb-1 text-light">Total Payment</p>
													<h3 class="text-white"><?php echo $total_payment ?></h3>
													<div class="progress mb-2 bg-white">
														<div class="progress-bar progress-animated bg-light" style="width: 30%"></div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-xl-4 col-xxl-4 col-sm-6">
									<div class="widget-stat card bg-danger">
										<div class="card-body">
											<div class="media">
												<span class="mr-3">
													<i class="la la-user-secret"></i>
												</span>
												<div class="media-body text-white">
													<p class="mb-1 text-light">Total Admin Users</p>
													<h3 class="text-white"><?php echo $total_users ?></h3>
													<div class="progress mb-2 bg-white">
														<div class="progress-bar progress-animated bg-light" style="width: 30%"></div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-xl-4 col-xxl-4 col-sm-6">
									<div class="widget-stat card bg-success">
										<div class="card-body">
											<div class="media">
												<span class="mr-3">
													<i class="fa fa-university"></i>
												</span>
												<div class="media-body text-white">
													<p class="mb-1 text-light">Current Month Total Revenue</p>
													<h3 class="text-white">
														<?php
														$total_rev = mysqli_query($conn, "SELECT SUM(amount) AS total FROM `lmspayment` WHERE status=1 AND created_at <= '" . date('Y-m-t') . "' ");
														while ($sub_resalt = mysqli_fetch_array($total_rev)) {
															echo $sub_resalt['total'];
														}
														?>
													</h3>
													<div class="progress mb-2 bg-white">
														<div class="progress-bar progress-animated bg-light" style="width: 30%"></div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="col-xl-4 col-xxl-4 col-sm-6">
									<div class="widget-stat card bg-success">
										<div class="card-body">
											<div class="media">
												<span class="mr-3">
													<i class="fa fa-university"></i>
												</span>
												<div class="media-body text-white">
													<p class="mb-1 text-light">Total Expences</p>
													<h3 class="text-white">


														<?php
														$total_exp = mysqli_query($conn, "SELECT SUM(cost) AS total FROM `lmsexpense` WHERE date <= '" . date('Y-m-t') . "' ");
														while ($sub_resalt = mysqli_fetch_array($total_exp)) {
															echo $sub_resalt['total'];
														}
														?>
													</h3>
													<div class="progress mb-2 bg-white">
														<div class="progress-bar progress-animated bg-light" style="width: 30%"></div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-12 col-lg-12 col-xxl-12 col-md-12">
							<div class="col-xl-12 col-lg-12 col-xxl-12 col-md-12">
								<div class="row">
									<div class="col-xl-12 col-lg-12 col-xxl-12 col-md-12">
										<div class="card-header">
											<h2 style="font-weight:bold;text-align:center;">Batch Wise Total Student Couting</h2>
											<hr>
										</div>
									</div>
									<br>
									<hr>
									<?php
									$sub_qury = mysqli_query($conn, "SELECT * FROM lmsclass order by cid");
									while ($sub_resalt = mysqli_fetch_array($sub_qury)) { ?>
										<div class="col-xl-4 col-xxl-4 col-sm-6">
											<div class="widget-stat card" style="background-color:#046ce4;">
												<div class="card-body">
													<div class="media">
														<span class="mr-3">
															<i class="la la-users"></i>
														</span>
														<div class="media-body text-white">
															<p class="mb-1 text-light"><?php echo $sub_resalt['name']; ?></p>
															<h3 class="text-white">Total Students - <?php
																									$stmt = $DB_con->prepare('SELECT COUNT(*) AS  register_count1 FROM lmsregister where level="' . $sub_resalt['cid'] . '"');
																									$stmt->execute();
																									$result = $stmt->fetch();
																									$total_register1 = $result['register_count1']; ?> [<?php echo $total_register1 ?>]</h3>
															<div class="progress mb-2 bg-white">
																<div class="progress-bar progress-animated bg-light" style="width: 80%"></div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									<?php } ?>
								</div>
							</div>
						</div>
					</div>
				</div>



				<div class="col-sm-12 col-md-3 col-lg-3 col-xl-3 col-xxl-3 bg-light rounded-left pt-4">
					<?php
					require_once 'right-sidebar.php';
					?>
				</div>
			</div>
			<!--Content body end -->

			<?php
			require_once 'footer.php';
			?>

		</div>
		<!--**********************************
        Main wrapper end
    ***********************************-->

		<?php
		require_once 'footerjs.php';
		?>

</body>

</html>