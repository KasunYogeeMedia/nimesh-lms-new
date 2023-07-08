<?php

if (!isset($_SESSION)) {
	session_start();
}
include '../super_admin/conn.php';
require_once '../super_admin/dbconfig4.php';
$user_qury = mysqli_query($conn, "SELECT * FROM lmsregister WHERE reid='$_SESSION[reid]'");
$user_resalt = mysqli_fetch_array($user_qury);

$image_qury = mysqli_query($conn, "SELECT * FROM lmsregister WHERE reid='$_SESSION[reid]'");
$image_resalt = mysqli_fetch_array($image_qury);

if ($image_resalt['image'] == "") {
	$dis_image_path = "images/hd_dp.jpg";
} else {
	$dis_image_path = "uploadImg/" . $image_resalt['image'];
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, shrink-to-fit=9">
	<meta name="description" content="demolms.lk">
	<meta name="author" content="demolms.lk">
	<title>Paper Exam List | Online Learning Platforms | Student Panel</title>
	<?php
	require_once 'headercss.php';
	?>
</head>

<body>


	<?php
	require_once 'sidebarmenu.php';
	?>
	<!-- Body Start -->
	<div class="wrapper custom-theme bg-light">
		<div class="row m-0">
			<div class="col py-4">
				<button class="btn btn-light" id="rsbtnon" type="button" onclick="rightsbon()">
					<i class="fa fa-bars" aria-hidden="true"></i>
				</button>
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-12">
							<h4 class="item_title">Paper Exams</h4>
							<br>
							<a href="online_class.php" class="see150">See all</a>
						</div>
						<div class="col-md-12">
							<div class="_14d25">
								<div class="row">
									<?php if ($full_pay == 1) { ?>
										<?php
										$exams_qury = mysqli_query($conn, "SELECT * FROM lmsonlineexams WHERE status='1' ORDER BY exid DESC");
										while ($exams_resalt = mysqli_fetch_array($exams_qury)) {

											$tealmsr_qury = mysqli_query($conn, "SELECT * FROM lmstealmsr WHERE tid='$exams_resalt[tid]'");
											$tealmsr_resalt = mysqli_fetch_array($tealmsr_qury);
										?>
											<div class="col-lg-3 col-md-4">
												<div class="fcrse_1 mt-30">
													<a href="#" class="fcrse_img">
														<img src="images/exams_pick.png" class="pro_pick2" style="height:300px;">
														<div class="course-overlay">
															<div class="badge_seller"><i class="uil uil-star"></i> Start Time</strong> <?php echo date_format(date_create($exams_resalt['starttime']), "h:i:s A"); ?></div>
															<div class="badge_seller"><i class="uil uil-star"></i> End Time </strong> <?php echo date_format(date_create($exams_resalt['endtime']), "h:i:s A"); ?></div>
															<div class="crse_reviews" style="margin-top:25px;">
																<i class="fa fa-check-circle"></i>Exam Date</strong> <?php echo date_format(date_create($exams_resalt['edate']), "M d, Y"); ?>
															</div>


															<div class="crse_timer">
																<?php

																$id = $exams_resalt['subject'];

																$query = $DB_con->prepare('SELECT name FROM lmssubject WHERE sid=' . $id);

																$query->execute();

																$result = $query->fetch();

																echo $result['name'];

																?>
															</div>
														</div>
													</a>
													<div class="fcrse_content">
														<a href="#" class="crse14s"><?php echo $exams_resalt['examname']; ?></a>
														<div class="auth1lnkprce">
															<p class="cr1fot">
															<div class="user-status">
																<div class="user-avatar">
																	<?php if ($tealmsr_resalt['image'] == "") {
																		$pro_img = "img/pro_pick.png";
																	} else {
																		$pro_img = "../super_admin/images/teacher/" . $tealmsr_resalt['image'];
																	} ?><img src="<?php echo $pro_img; ?>">
																</div>
																<p class="user-status-title"><span class="bold"><?php echo $tealmsr_resalt['fullname']; ?></span></p>
																<p class="user-status-tag online">Teacher</p>
																<br>
																<a href="../super_admin/images/exams/<?php echo $exams_resalt['edocument']; ?>" class="save_btn btn-block" target="_blank" download>Download Paper</a>

																<a href="submissions.php?exid=<?php echo $exams_resalt['exid']; ?>" class="save_btn btn-block">Submissions</a>

															</div>
														</div>

													</div>
												</div>
											</div>
										<?php
										}
										?>
									<?php } else { ?>
										<div class="alert alert-warning" role="alert">
											You are not pay the course full payment!
										</div>
									<?php } ?>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="rgsb" class="rg-sb col-sm-6 col-md-5 col-lg-3 col-xl-3 col-xxl-3 bg-light rounded-left pt-4">
				<?php
				require_once 'right-sidebar.php';
				?>
			</div>
		</div>
		<?php
		require_once 'footer.php';
		?>
	</div>
	<!-- Body End -->
	<?php
	require_once 'footerjs.php';
	?>

</body>

</html>