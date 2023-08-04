	<?php



require_once 'includes.php';

require_once("../super_admin/conn.php");

require_once '../super_admin/dbconfig4.php';



if (isset($_SESSION['tid'])) {

	$user_qury = mysqli_query($conn, "SELECT * FROM lmstealmsr WHERE tid='$_SESSION[tid]'");

	$user_resalt = mysqli_fetch_array($user_qury);



	if ($user_resalt['image'] == "") {

		$image_path = "../profile/images/hd_dp.jpg";
	} else {

		$image_path = "../super_admin/images/teacher/" . $user_resalt['image'];
	}
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>Home | Teacher Panel | Online Learning Platforms </title>

	<?php
	require_once 'headercss.php';
	?>

</head>

<body>

	<?php
	require_once 'preloader.php';
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
									<img src="../profile/images/hd_dp.jpg" width="20" alt="" />
								</a>
								<div class="dropdown-menu dropdown-menu-right">
									<a href="super_admin.php" class="dropdown-item ai-icon">
										<svg id="icon-user1" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user">
											<path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
											<circle cx="12" cy="7" r="4"></circle>
										</svg>
										<span class="ml-2"><?php echo $user_resalt['fullname']; ?></span>
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

		<!--**********************************
            Content body start
        ***********************************-->
		<div class="content-body bg-light">
			<div class="row m-0">
				<div class="col-sm-12 col-md-9 col-lg-9 col-xl-9 col-xxl-9 pt-4">

					<div class="wel_sec bg-primary mb-3">
						<div class="row">
							<div class="col-sm-6 col-md-6 col-lg-6 col-xl-5 my-auto">
								<div class="left_sec py-4 px-5">
									<h2 class="text-light fw-bold">Welcome Back, <?php echo $user_resalt['fullname']; ?></h2>
									<p class="text-light mb-0"><?php echo "0" . (int)$user_resalt['contactnumber']; ?></p>
									<p class="text-light mb-0 desc"><?php echo $user_resalt['qualification']; ?></p>
									<p class="text-light">Status:
										<?php if ($user_resalt['status'] == 1) { ?>
											<span class="badge badge-rounded badge-success">Active</span>
										<?php } ?>
										<?php if ($user_resalt['status'] == 0) { ?>
											<span class="badge badge-rounded badge-danger">Deactive</span>
										<?php } ?>
									</p>
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
					<!-- <div class="courses-sec">
						<div class="card border-0 bg-light">
							<div class="card-body">
								<p class="h5 mb-4 fw-bold text-dark">Top Courses</p>
								<div class="courses">
									<div class="row border-bottom mb-2 pb-2">
										<div class="col my-auto">
											<p class="h6 mb-0 fw-bold text-dark">Leaning HTML</p>
											<p class="mb-0">React & Bootstrap Framework</p>
										</div>
										<div class="col-auto text-end my-auto">
											<p class="h6 mb-0 text-dark"><span class="fw-bold">70 </span>sales</p>
										</div>
									</div>
									<div class="row border-bottom mb-2 pb-2">
										<div class="col my-auto">
											<p class="h6 mb-0 fw-bold text-dark">UI Kit Design</p>
											<p class="mb-0">Bootstrap Framework</p>
										</div>
										<div class="col-auto text-end my-auto">
											<p class="h6 mb-0 text-dark"><span class="fw-bold">70 </span>sales</p>
										</div>
									</div>
									<div class="row border-bottom mb-2 pb-2">
										<div class="col my-auto">
											<p class="h6 mb-0 fw-bold text-dark">UI Kit Design</p>
											<p class="mb-0">Bootstrap Framework</p>
										</div>
										<div class="col-auto text-end my-auto">
											<p class="h6 mb-0 text-dark"><span class="fw-bold">70 </span>sales</p>
										</div>
									</div>
									<div class="row border-bottom mb-2 pb-2">
										<div class="col my-auto">
											<p class="h6 mb-0 fw-bold text-dark">UI Kit Design</p>
											<p class="mb-0">Bootstrap Framework</p>
										</div>
										<div class="col-auto text-end my-auto">
											<p class="h6 mb-0 text-dark"><span class="fw-bold">70 </span>sales</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div> -->
					<div class="row">
						<div class="col-xl-6 col-xxl-6 col-sm-6">
							<div class="widget-stat card bg-primary">
								<div class="card-body">
									<div class="media">
										<span class="mr-3">
											<i class="la la-slideshare"></i>
										</span>
										<div class="media-body text-white">
											<p class="mb-1 text-light">Total Classes</p>
											<h3 class="text-white"><?php
																	$my_class = mysqli_query($conn, "SELECT * FROM lmsclass_schlmsle WHERE tealmsr='$_SESSION[tid]'");
																	echo number_format(mysqli_num_rows($my_class), 0);
																	?> </h3>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-6 col-xxl-6 col-sm-6">
							<div class="widget-stat card bg-primary">
								<div class="card-body">
									<div class="media">
										<span class="mr-3">
											<i class="la la-book"></i>
										</span>
										<div class="media-body text-white">
											<p class="mb-1 text-light">Total Tutes</p>
											<h3 class="text-white"><?php
																	$my_tute = mysqli_query($conn, "SELECT * FROM lmsclasstute WHERE tid='$_SESSION[tid]'");
																	echo number_format(mysqli_num_rows($my_tute), 0);
																	?></h3>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- <div class="col-xl-4 col-xxl-4 col-sm-6">
							<div class="widget-stat card bg-warning">
								<div class="card-body">
									<div class="media">
										<span class="mr-3">
											<i class="la la-play-circle-o"></i>
										</span>
										<div class="media-body text-white">
											<p class="mb-1">Total Videos</p>
											<h3 class="text-white"><?php
																	$my_videos = mysqli_query($conn, "SELECT * FROM lmslesson WHERE tid='$_SESSION[tid]'");
																	echo number_format(mysqli_num_rows($my_videos), 0);
																	?></h3>
										</div>
									</div>
								</div>
							</div>
						</div> -->
						<!-- <div class="col-xl-4 col-xxl-4 col-sm-6">
							<div class="widget-stat card bg-secondary">
								<div class="card-body">
									<div class="media">
										<span class="mr-3">
											<i class="la la-black-tie"></i>
										</span>
										<div class="media-body text-white">
											<p class="mb-1 text-light">Total Student</p>
											<h3 class="text-white"></h3>
										</div>
									</div>
								</div>
							</div>
						</div> -->
						<!-- <div class="col-xl-8 col-xxl-8 col-sm-6">
							<div class="widget-stat card bg-danger">
								<div class="card-body">
									<div class="media">
										<span class="mr-3">
											<i class="la la-money"></i>
										</span>
										<div class="media-body text-white">
											<p class="mb-1">Time Period : <?php echo date("Y-m-01"); ?> to <?php echo date("Y-m-t", strtotime(date("Y-m-d"))); ?></p>
											<h3 class="text-white">Current Income : </h3>
										</div>
									</div>
								</div>
							</div>
						</div> -->
					</div>
				</div>
				<div class="col-sm-12 col-md-3 col-lg-3 col-xl-3 col-xxl-3 bg-light rounded-left pt-4">
					<?php
					require_once 'right-sidebar.php';
					?>
				</div>
			</div>
			<!--**********************************
            Content body end
        ***********************************-->

			<?php
			require_once 'footer.php';
			?>

			<!--**********************************
           Support ticket button start
        ***********************************-->

			<!--**********************************
           Support ticket button end
        ***********************************-->


		</div>
		<!--**********************************
        Main wrapper end
    ***********************************-->

		<!--**********************************
        Scripts
    ***********************************-->


		<?php
		require_once 'footerjs.php';
		?>

</body>

</html>