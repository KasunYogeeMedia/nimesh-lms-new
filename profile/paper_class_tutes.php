﻿<?php
session_start();
include '../super_admin/conn.php';
require_once '../super_admin/dbconfig4.php';
$user_qury = mysqli_query($conn, "SELECT * FROM lmsregister INNER JOIN lmsclass ON lmsregister.level=lmsclass.cid WHERE reid='$_SESSION[reid]'");
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
	<meta name="description" content="englishwithera.com">
	<meta name="author" content="englishwithera.com">
	<title>Paper Class Tutes | Online Learning Platforms | Student Panel</title>
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
				<?php
				require_once 'pay_alert.php';
				?>
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-12">
							<h4 class="item_title mb-4">Tutes</h4>

						</div>
						<!-- <div class="col-lg-12">
							<div class="widget-box bg-light mb-2 p-3">
								<form method="post">
									<div class="row">
										<div class="col-lg-3 col-md-3">
											From : <input name="s_month" type="month" class="form-control" id="s_month" value="<?php echo date("Y-m"); ?>">
										</div>
										<div class="col-lg-3 col-md-3">
											To : <input name="e_month" type="month" class="form-control" id="e_month" value="<?php echo date("Y-m"); ?>">
										</div>
										<div class="col-lg-3 col-md-3">
											Class : <select name="fsubject" required class="form-control" style="border: 2px solid #ccc;">
												<option hidden="yes">Select Class</option>
												<?php
												$sub_array = array();
												$sub_qury = mysqli_query($conn, "SELECT * FROM lmsreq_subject WHERE sub_req_reg_no='$user_resalt[contactnumber]'");
												while ($sub_resalt = mysqli_fetch_assoc($sub_qury)) {
													array_push($sub_array, "'" . $sub_resalt['sub_req_sub_id'] . "'");
												}
												$sub_array_join = join(",", $sub_array);

												$stmt = $DB_con->prepare("SELECT * FROM lmssubject WHERE sid IN ($sub_array_join) and status='Publish' ORDER BY name");
												$stmt->execute();
												if ($stmt->rowCount() > 0) {
													while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
														extract($row);
												?>
														<option value="<?php echo $row['sid']; ?>"><?php echo $row['name']; ?> </option>
												<?php }
												}
												?>
											</select>
										</div>
										<div class="col-lg-3 col-md-3">
											<br><button name="fil_bt" type="submit" class="btn btn-dark">Filter</button>
										</div>
									</div>
								</form>

							</div>
						</div> -->
						<div class="col-md-12">
							<div class="_14d25">
								<div class="row">
									<?php
									if (isset($_POST['fil_bt'])) {
										$s_month = date("Y-m-01", strtotime($_POST['s_month']));
										$e_month = date("Y-m-t", strtotime($_POST['e_month']));
										$fsubject = $_POST['fsubject'];

										$sub_array = array();
										$sub_qury = mysqli_query($conn, "SELECT * FROM lmsreq_subject WHERE sub_req_reg_no='$user_resalt[contactnumber]'");
										while ($sub_resalt = mysqli_fetch_assoc($sub_qury)) {
											array_push($sub_array, "'" . $sub_resalt['sub_req_sub_id'] . "'");
										}
										$sub_array_join = join(",", $sub_array);

										$tute_qury = mysqli_query($conn, "SELECT * FROM lmsclasstute WHERE class='$user_resalt[level]' and subject IN ($sub_array_join) and ctype='Paper Class' and status='1'");
										while ($tute_resalt = mysqli_fetch_array($tute_qury)) {

											$tealmsr_qury = mysqli_query($conn, "SELECT * FROM lmstealmsr WHERE tid='$tute_resalt[tid]'");
											$tealmsr_resalt = mysqli_fetch_array($tealmsr_qury);

									?>
											<div class="col-lg-3 col-md-4">
												<div class="fcrse_1 mt-30">
													<a href="#" class="fcrse_img">
														<img src="images/pro_pick2.png" class="pro_pick2">
														<div class="course-overlay">
															<div class="badge_seller"><i class="uil uil-star"></i> <?php echo $tute_resalt['ctype']; ?></div>
															<div class="crse_reviews">
																<i class="fa fa-check-circle"></i> <?php echo date_format(date_create($tute_resalt['add_date']), "F"); ?>
															</div>
															<span class="play_btn1"><i class="uil uil-play"></i></span>
															<div class="crse_timer">
																<?php

																$id = $tute_resalt['class'];

																$query = $DB_con->prepare('SELECT name FROM lmsclass WHERE cid=' . $id);

																$query->execute();

																$result = $query->fetch();

																echo $result['name'];

																?> - <?php

																		$id = $tute_resalt['class'];

																		$query = $DB_con->prepare('SELECT name FROM lmssubject WHERE class_id=' . $id);

																		$query->execute();

																		$result = $query->fetch();

																		echo $result['name'];

																		?> </div>
														</div>
													</a>
													<div class="fcrse_content">
														<a href="#" class="crse14s"><?php echo $tute_resalt['title']; ?> - (<?php echo $tute_resalt['month']; ?>)</a>
														<div class="auth1lnkprce">
															<p class="cr1fot">
															<div class="user-status">
																<div class="user-avatar">
																	<?php if ($tealmsr_resalt['image'] == "") {
																		$pro_img = "images/hd_dp.jpg";
																	} else {
																		$pro_img = "../admin/images/teacher/" . $tealmsr_resalt['image'];
																	} ?><img src="<?php echo $pro_img; ?>" class="pro_pick">
																</div>
																<p class="user-status-title"><span class="bold"><?php echo $tealmsr_resalt['fullname']; ?></span></p>
																<p class="user-status-tag online">Teacher</p>
																<br>
																<?php
																$st_date = date_format(date_create($tute_resalt['add_date']), "Y-m-01");
																$end_date = date("Y-m-t", strtotime($st_date));

																$lmsck_payment = mysqli_query($conn, "SELECT * FROM lmspayment WHERE userID='$_SESSION[reid]' and pay_sub_id='$tute_resalt[subject]' and status='1' and expiredate BETWEEN '$st_date' AND '$end_date'");
																if (mysqli_num_rows($lmsck_payment) > 0) {
																?>

																	<a href="../admin/images/classtute/<?php echo $tute_resalt['tdocument']; ?>" class="save_btn btn-block" target="_blank" download>Download Tute</a>
																<?php
																} else {
																?>
																	<a href="student_profile.php" class="save_btn btn-block">No Class Payment Here</a>
																<?php
																}
																?>

															</div>
														</div>

													</div>
												</div>
											</div>
										<?php
										}
									} else {
										?>
										<?php

										$sub_array = array();
										$sub_qury = mysqli_query($conn, "SELECT * FROM lmsreq_subject WHERE sub_req_reg_no='$user_resalt[contactnumber]'");
										while ($sub_resalt = mysqli_fetch_assoc($sub_qury)) {
											array_push($sub_array, "'" . $sub_resalt['sub_req_sub_id'] . "'");
										}
										$sub_array_join = join(",", $sub_array);

										$tute_qury = mysqli_query($conn, "SELECT * FROM lmsclasstute WHERE class='$user_resalt[level]' and subject IN ($sub_array_join) and ctype='Paper Class' and status='1'");
										while ($tute_resalt = mysqli_fetch_array($tute_qury)) {

											$tealmsr_qury = mysqli_query($conn, "SELECT * FROM lmstealmsr WHERE tid='$tute_resalt[tid]'");
											$tealmsr_resalt = mysqli_fetch_array($tealmsr_qury);
										?>
											<div class="col-lg-3 col-md-4">
												<div class="fcrse_1 mt-30">
													<a href="#" class="fcrse_img">
														<img src="images/pro_pick2.png" class="pro_pick2">
														<div class="course-overlay">
															<div class="badge_seller"><i class="uil uil-star"></i> <?php echo $tute_resalt['ctype']; ?></div>
															<div class="crse_reviews">
																<i class="fa fa-check-circle"></i> <?php echo date_format(date_create($tute_resalt['add_date']), "F"); ?>
															</div>
															<span class="play_btn1"><i class="uil uil-play"></i></span>
															<div class="crse_timer">
																<?php

																$id = $tute_resalt['class'];

																$query = $DB_con->prepare('SELECT name FROM lmsclass WHERE cid=' . $id);

																$query->execute();

																$result = $query->fetch();

																echo $result['name'];

																?> - <?php

																		$id = $tute_resalt['class'];

																		$query = $DB_con->prepare('SELECT name FROM lmssubject WHERE class_id=' . $id);

																		$query->execute();

																		$result = $query->fetch();

																		echo $result['name'];

																		?> </div>
														</div>
													</a>
													<div class="fcrse_content">
														<a href="#" class="crse14s"><?php echo $tute_resalt['title']; ?> - (<?php echo $tute_resalt['month']; ?>)</a>
														<div class="auth1lnkprce">
															<p class="cr1fot">
															<div class="user-status">
																<div class="user-avatar">
																	<?php if ($tealmsr_resalt['image'] == "") {
																		$pro_img = "images/hd_dp.jpg";
																	} else {
																		$pro_img = "../admin/images/teacher/" . $tealmsr_resalt['image'];
																	} ?><img src="<?php echo $pro_img; ?>" class="pro_pick">
																</div>
																<p class="user-status-title"><span class="bold"><?php echo $tealmsr_resalt['fullname']; ?></span></p>
																<p class="user-status-tag online">Teacher</p>
																<br>
																<?php

																$vmonth = date_format(date_create($tute_resalt['add_date']), "Y-m-01");
																date_default_timezone_set("Asia/Colombo");
																$lmsck_date = date('Y-m-d');
																$lmsck_payments = mysqli_query($conn, "SELECT * FROM lmspayment WHERE userID='$_SESSION[reid]' and pay_sub_id='$tute_resalt[subject]' and status='1'");
																$row = mysqli_fetch_assoc($lmsck_payments);

																$subject_validate = mysqli_query($conn, "SELECT * FROM lmssubject WHERE sid='$tute_resalt[subject]'");
																$subject_data = mysqli_fetch_assoc($subject_validate);

																$lmsck_sum = mysqli_query($conn, "SELECT SUM(amount) AS total_payment FROM lmspayment WHERE userID='$_SESSION[reid]' AND pay_sub_id='$tute_resalt[subject]' AND status='1'");

																$total_payment = mysqli_fetch_assoc($lmsck_sum);
																$userID = $_SESSION['reid'];

																if (mysqli_num_rows($lmsck_payments) > 0) {

																	if ((int)$total_payment['total_payment'] == (int)$subject_data['price'] && $row['next_paydate'] == NULL || (int)$total_payment['total_payment'] == (int)$subject_data['price'] && $row['next_paydate'] != NULL) {



																?>


																		<a href="../admin/images/classtute/<?php echo $tute_resalt['tdocument']; ?>" class="save_btn btn-block" target="_blank" download>Download Tute</a>


																		<div>
																			<p id="showCounts"></p>
																		</div>

																	<?php
																		//not full payment but next pay date available student  
																	} else if ((int)$total_payment['total_payment'] < (int)$subject_data['price'] && $lmsck_date < $row['next_paydate']) { ?>

																		<a href="../admin/images/classtute/<?php echo $tute_resalt['tdocument']; ?>" class="save_btn btn-block" target="_blank" download>Download Tute</a>


																		<div>
																			<p id="showCounts"></p>
																		</div>

																	<?php
																	} else { ?>



																		<a href="student_profile.php" class="save_btn btn-block">Payment Here</a>
																	<?php

																	}
																	?>

																<?php

																} else { ?>
																	<a href="student_profile.php" class="save_btn btn-block">Payment Here</a>
																<?php } ?>


															</div>
														</div>

													</div>
												</div>
											</div>
									<?php
										}
									}
									?>

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