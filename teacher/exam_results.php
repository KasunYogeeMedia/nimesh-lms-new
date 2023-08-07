<?php

if (!isset($_SESSION)) {
	session_start();
}

require_once 'includes.php';

require_once '../super_admin/dbconfig4.php';

require_once("../super_admin/conn.php");

if (isset($_SESSION['tid'])) {

	$user_qury = mysqli_query($conn, "SELECT * FROM lmstealmsr WHERE tid='$_SESSION[tid]'");

	$user_resalt = mysqli_fetch_array($user_qury);



	if ($user_resalt['image'] == "") {

		$image_path = "../profile/images/hd_dp.jpg";
	} else {

		$image_path = "../admin/images/teacher/" . $user_resalt['image'];
	}
} else {

	echo "<script>window.location='home.php';</script>";
}

?>
<!DOCTYPE html>
<html lang="en">

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>Exam Results | Teacher Panel | Online Learning Platforms </title>

	<?php
	require_once 'headercss.php';
	?>

</head>

<body>

	<!--**********************************
        Main wrapper start
    ***********************************-->
	<div id="main-wrapper">

		<?php
		// require_once 'navheader.php'; 
		?>


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
			<!-- row -->
			<div class="container-fluid">

				<div class="row page-titles mx-0">
					<div class="col-sm-6 p-md-0">
						<div class="welcome-text">
							<h4>All Exam Results</h4>
						</div>
					</div>
					<div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="home.php">Home</a></li>
							<li class="breadcrumb-item active"><a href="javascript:void(0);">Exam Results</a></li>
							<li class="breadcrumb-item active"><a href="javascript:void(0);">All Exam Results</a></li>
						</ol>
					</div>
				</div>

				<div class="row">

					<div class="col-lg-12">
						<div class="row tab-content">
							<div id="list-view" class="tab-pane fade active show col-lg-12">
								<div class="card border-0 bg-light">
									<div class="card-header">
										<h4 class="card-title">All Exam Results</h4>
									</div>
									<div class="card-body">
										<div class="table-responsive">
											<form method="post">
												<table class="m-3">
													<tbody>
														<tr>
															<td>
																<select name="lms_report_exam_code" id="" class="form-control" required>
																	<option value="" hidden="lms">Select Exam</option>
																	<?php
																	$join_str = "lms_exam_details INNER JOIN lmssubject ON lms_exam_details.lms_exam_subject=subject.id";
																	$exam_qury = mysqli_query($conn, "SELECT * FROM $join_str WHERE lms_exam_add_user='$_SESSION[tid]' ORDER BY lms_exam_name DESC");
																	while ($exam_resalt = mysqli_fetch_array($exam_qury)) {
																	?>
																		<option value="<?php echo $exam_resalt['lms_exam_system_id']; ?>"><?php echo $exam_resalt['lms_exam_name'] . " - " . $exam_resalt['name']; ?></option>
																	<?php } ?>
																</select>
															</td>
															<td>
																<button type="submit" class="btn btn-success">Filter</button>
															</td>
														</tr>
													</tbody>
												</table>
											</form>
											<table id="dataTable" class="table table-bordered">
												<thead>
													<tr>
														<th>Student</th>
														<th>End Time</th>
														<th>Total MCQ</th>
														<th>Faced</th>
														<th>Correct</th>
														<th>Percentage</th>
													</tr>
												</thead>
												<tbody>
													<?php
													if (isset($_POST['lms_report_exam_code'])) {

														$join_str = "lms_exam_report INNER JOIN register ON lms_exam_report.lms_report_user=register.reid INNER JOIN lms_exam_details ON lms_exam_report.lms_report_exam_code=lms_exam_details.lms_exam_system_id";
														$exam_qury = mysqli_query($conn, "SELECT * FROM $join_str WHERE lms_report_exam_code='$_POST[lms_report_exam_code]' ORDER BY lms_report_end_time DESC");
														while ($exam_resalt = mysqli_fetch_array($exam_qury)) {

															$resalt_qury = mysqli_query($conn, "SELECT * FROM lms_answer INNER JOIN lms_question_answer ON lms_answer.lms_answer_q=lms_question_answer.lms_question_answer_id WHERE lms_answer_identify='$exam_resalt[lms_report_exam_id]'");

															$cont_answer = mysqli_num_rows($resalt_qury);

															$corr_count = 0;
															while ($count_resalt = mysqli_fetch_array($resalt_qury)) {
																if ($count_resalt['lms_answer_a'] == $count_resalt['lms_answer_correct']) {
																	$corr_count++;
																}
															}
															$a = 100 / $exam_resalt['lms_exam_question'];
															$b = $a * $corr_count;
													?>
															<tr>
																<td><?php echo $exam_resalt['fullname']; ?></td>
																<td><?php echo date_format(date_create($exam_resalt['lms_report_end_time']), "M d, Y - h:i:s A"); ?></td>
																<td><?php echo $exam_resalt['lms_exam_question']; ?></td>
																<td><?php echo $cont_answer; ?></td>
																<td><?php echo $corr_count; ?></td>
																<td><?php echo $b; ?>%</td>
															</tr>
													<?php
														}
													}
													?>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>

			</div>
		</div>
		<!--**********************************
            Content body end
        ***********************************-->


		<!--**********************************
            Footer start
        ***********************************-->
		<div class="footer">
			<div class="copyright">
				<p>Copyright © Designed &amp; Developed by <a href="https://yogeemedia.com" target="_blank">Yogeemedia</a> 2021</p>
			</div>
		</div>
		<!--**********************************
            Footer end
        ***********************************-->

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