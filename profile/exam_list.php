<?php

session_start();

include '../super_admin/conn.php';
require_once '../super_admin/dbconfig4.php';
//require '../class/timer.php';
$user_qury = mysqli_query($conn, "SELECT * FROM lmsregister WHERE reid='$_SESSION[reid]'");
$user_resalt = mysqli_fetch_array($user_qury);

$image_qury = mysqli_query($conn, "SELECT * FROM lmsregister WHERE reid='$_SESSION[reid]'");
$image_resalt = mysqli_fetch_array($image_qury);

if ($image_resalt['image'] == "") {
	$dis_image_path = "images/hd_dp.jpg";
} else {
	$dis_image_path = "uploadImg/" . $image_resalt['image'];
}

if (isset($_GET['type'])) {
	if ($_GET['type'] == 1) {
		$type = "Payed";
	}
	if ($_GET['type'] == 0) {
		$type = "Free";
	}
} else {
	header("location:exam_list.php?type=0");
}
unset($_SESSION['exam_id']);

//$timer = new timer($DB_con);
?>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, shrink-to-fit=9">
	<meta name="description" content="demolms.lk">
	<meta name="author" content="demolms.lk">
	<title>Exam List | Online Learning Platforms | Student Panel</title>
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
							<h2 class="st_title mb-4"><i class="uil uil-file-alt"></i><?php echo $type; ?> Exam List</h2>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12 col-md-12">
							<?php
							if ($full_pay == 1) { ?>
								<div class="table-responsive mt-30">
									<table id="dataTable" class="table table-bordered" style="margin-top: 10px;">
										<thead>
											<tr>
												<th>Take</th>
												<th>Exam Name</th>
												<th>Course/Course/Class</th>
												<th>Questions</th>
												<th>Time Details</th>
											</tr>
										</thead>
										<tbody>
											<?php
											$sub_arrey = array();

											//print_r($_SESSION);
											$reg_qury = mysqli_query($conn, "SELECT * FROM lmsregister WHERE reid='$_SESSION[reid]'");
											$reg_resalt = mysqli_fetch_array($reg_qury);

											$sub_qury = mysqli_query($conn, "SELECT * FROM lmsreq_subject WHERE sub_req_reg_no='$reg_resalt[contactnumber]'");
											while ($sub_resalt = mysqli_fetch_array($sub_qury)) {
												array_push($sub_arrey, '"' . $sub_resalt['sub_req_sub_id'] . '"');
											}

											$sub_filter = join(",", $sub_arrey);

											if ($_GET['type'] == 1) {
												$check_payment = mysqli_query($conn, "SELECT * FROM lmspayment p WHERE p.userID='$_SESSION[reid]' AND p.pay_sub_id IN ($sub_filter)");
												if (mysqli_num_rows($check_payment) > 0) {
													$display = 1;
												} else {
													$display = 0;
												}
											} else {
												$display = 1;
											}

											$join_str = "lms_exam_details INNER JOIN lmssubject ON lms_exam_details.lms_exam_subject=lmssubject.sid";
											$exam_qury = mysqli_query($conn, "SELECT * FROM $join_str WHERE lms_exam_subject IN ($sub_filter) AND lms_exam_pay_type='$_GET[type]' ORDER BY lms_exam_id DESC");
											while ($exam_resalt = mysqli_fetch_array($exam_qury)) {
												if ($display == 1) {
											?>

													<tr style="text-transform: capitalize;">
														<td style="white-space: normal;">
															<?php
															$check_exam = mysqli_query($conn, "SELECT * FROM lms_exam_report r WHERE r.exam_report_user='$_SESSION[reid]' AND r.exam_report_paper='$exam_resalt[lms_exam_id]'");
															if (mysqli_num_rows($check_exam) > 0) {
															?>
																<a href="#" class="btn btn-success btn-sm">Already Taken</a>

																<?php if ($exam_resalt['lms_exam_end_time'] < date("Y-m-d H:i:s")) { ?>
																	<a href="results.php?view=<?php echo $exam_resalt['lms_exam_id']; ?>" style="color: white;" class="btn btn-success btn-sm">View</a>
																<?php } else { ?>
																	<a href="" style="color: white;" class="btn btn-success btn-sm">Waiting...</a>
																<?php } ?>

															<?php } else { ?>
																<a href="exam.php?exam_id=<?php echo $exam_resalt['lms_exam_id']; ?>" class="btn btn-success btn-sm">Take Exam</a>
															<?php } ?>
														</td>


														<td><?php echo $exam_resalt['lms_exam_name']; ?></td>
														<td><?php echo $exam_resalt['name']; ?></td>
														<td><?php echo $exam_resalt['lms_exam_question']; ?></td>
														<td style="white-space: nowrap; font-weight: normal;">
															Added: <?php echo date("Y-m-d h:i:s A", strtotime($exam_resalt['lms_exam_add_time'])); ?><br>
															Start: <?php echo date("Y-m-d h:i:s A", strtotime($exam_resalt['lms_exam_start_time'])); ?><br>
															End: <?php echo date("Y-m-d h:i:s A", strtotime($exam_resalt['lms_exam_end_time'])); ?>
														</td>
													</tr>
											<?php
												}
											}
											?>
										</tbody>
									</table>
								</div>
							<?php } else { ?>
								<div class="alert alert-warning" role="alert">
									You are not pay the course full payment!
								</div>
							<?php } ?>

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