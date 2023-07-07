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

		<?php
		// require_once 'navheader.php'; 
		?>

		<!--**********************************
            Header start
        ***********************************-->
		<!-- <div class="header">
			<div class="header-content">
				<nav class="navbar navbar-expand">
					<div class="collapse navbar-collapse justify-content-between">
						<div class="header-left">

						</div>

						<ul class="navbar-nav header-right">
							<li class="nav-item dropdown header-profile">
								<a class="nav-link" href="#" role="button" data-toggle="dropdown">
									<img src="images/profile/pic1.jpg" width="20" alt="" />
								</a>
								<div class="dropdown-menu dropdown-menu-right">
									<a href="admin.php" class="dropdown-item ai-icon">
										<svg id="icon-user1" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user">
											<path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
											<circle cx="12" cy="7" r="4"></circle>
										</svg>
										<span class="ml-2"><?php echo $user_name; ?></span>
									</a>
									<a href="logout.php" class="dropdown-item ai-icon">
										<svg id="icon-logout" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-log-out">
											<path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path>
											<polyline points="16 17 21 12 16 7"></polyline>
											<line x1="21" y1="12" x2="9" y2="12"></line>
										</svg>
										<span class="ml-2">Logout </span>
									</a>
								</div>
							</li>
						</ul>
					</div>
				</nav>
			</div>
		</div> -->
		<!--**********************************
            Header end ti-comment-alt
        ***********************************-->

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
							<div class="col-sm-12 col-md-4">
								<div class="card border-0">
									<div class="card-body">
										<p class="h6 mb-3 fw-bold">Profile & Payments</p>
										<div class="h-scroll">
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
														<p class="h6 mb-0 fw-bold">Your Profile</p>
														<a class="small" href="">View more</a>
													</div>
												</div>
											</div>
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
														<p class="h6 mb-0 fw-bold">Bank Payment</p>
														<a class="small" href="">View more</a>
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
														<p class="h6 mb-0 fw-bold">Card Payment</p>
														<a class="small" href="">View more</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-12 col-md-8">
								<div class="card border-0">
									<div class="card-body">
										<p class="h6 mb-3 fw-bold">Lectures</p>
										<div class="h-scroll">
											<div class="card border-0 rounded-0">
												<div class="row">
													<div class="col-auto">
														<div class="sq-box bg-warning bg-opacity-10 rounded-3">
															<img src="../assets/img/bird.png" alt="" class="img-fluid m-auto">
														</div>
													</div>
													<div class="col">
														<p class="fw-bold mb-1">
															Build an Android Application in Swift
															Learn the fundamentals
														</p>
														<a href="" class="btn bg-success bg-opacity-10 text-success btn-sm">View More</a>
													</div>
												</div>
											</div>
											<div class="card border-0 rounded-0">
												<div class="row">
													<div class="col-auto">
														<div class="sq-box bg-warning bg-opacity-10 rounded-3">
															<img src="../assets/img/bird.png" alt="" class="img-fluid m-auto">
														</div>
													</div>
													<div class="col">
														<p class="fw-bold mb-1">
															Build an Android Application in Swift
															Learn the fundamentals
														</p>
														<a href="" class="btn bg-success bg-opacity-10 text-success btn-sm">View More</a>
													</div>
												</div>
											</div>
											<div class="card border-0 rounded-0">
												<div class="row">
													<div class="col-auto">
														<div class="sq-box bg-warning bg-opacity-10 rounded-3">
															<img src="../assets/img/bird.png" alt="" class="img-fluid m-auto">
														</div>
													</div>
													<div class="col">
														<p class="fw-bold mb-1">
															Build an Android Application in Swift
															Learn the fundamentals
														</p>
														<a href="" class="btn bg-success bg-opacity-10 text-success btn-sm">View More</a>
													</div>
												</div>
											</div>
											<div class="card border-0 rounded-0">
												<div class="row">
													<div class="col-auto">
														<div class="sq-box bg-warning bg-opacity-10 rounded-3">
															<img src="../assets/img/bird.png" alt="" class="img-fluid m-auto">
														</div>
													</div>
													<div class="col">
														<p class="fw-bold mb-1">
															Build an Android Application in Swift
															Learn the fundamentals
														</p>
														<a href="" class="btn bg-success bg-opacity-10 text-success btn-sm">View More</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="fdb-sec my-3">
						<div class="card border-0">
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
					</div>
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
													<p class="mb-1 text-light">Total Revenue</p>
													<h3 class="text-white"><?php /*
																			$c_date = date("Y-01-01");

																			$income_qury = mysqli_query($conn, "SELECT SUM(amount) as total_income FROM lmspayment WHERE pay_month = '$c_date' AND status='1'");
																			$icome_resalt = mysqli_fetch_array($income_qury);

																			$pay_qury = mysqli_query($conn, "SELECT SUM(lms_teacher_payment_history_amount) as total_pay FROM lms_teacher_payment_history");
																			$pay_resalt = mysqli_fetch_array($pay_qury);

																			$pay_qury1 = mysqli_query($conn, "SELECT SUM(lms_teacher_payment_company_amount) as total_pay1 FROM lms_teacher_payment_history");
																			$pay_resalt1 = mysqli_fetch_array($pay_qury1);

																			$a = $icome_resalt['total_income'] - ($pay_resalt['total_pay'] + $pay_resalt1['total_pay1']);

																			$payment_count = mysqli_query($conn, "SELECT SUM(amount) amount FROM lmspayment WHERE status=1");
																			$payment_resalt = mysqli_fetch_assoc($payment_count);

																			//echo 'Rs '.number_format((float)$icome_resalt['amount'],2);
																			*/ ?></h3>
													<h3><?php echo number_format($payment_resalt['amount'], 2) ?></h3>
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