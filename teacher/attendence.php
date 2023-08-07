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


if (isset($_GET['remove'])) {
	$remove = mysqli_real_escape_string($conn, $_GET['remove']);
	mysqli_query($conn, "DELETE FROM lmsclass_schlmsle WHERE classid='$remove'");
	echo "<script>window.location='class_schedule.php';</script>";
}
?>

<!DOCTYPE html>
<html lang="en">

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>Class Schedule | Teacher Panel | Online Learning Platforms </title>

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
							<h4>Students Attendance</h4>
						</div>
					</div>
					<div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="home.php">Home</a></li>
							<li class="breadcrumb-item active"><a href="javascript:void(0);">Class Schedule</a></li>
							<li class="breadcrumb-item active"><a href="javascript:void(0);">Students Attendance</a></li>
						</ol>
					</div>
				</div>

				<div class="row">

					<div class="col-lg-12">
						<div class="row tab-content">
							<div id="list-view" class="tab-pane fade active show col-lg-12">
								<div class="card border-0 bg-light">

									<div class="card-body">
										<div class="table-responsive">
											<table id="dataTable" class="table table-bordered">
												<thead>
													<tr>
														<th>#</th>
														<th>Teacher</th>
														<th>Lesson</th>
														<th>Batch</th>
														<th>Course</th>
														<th>Month</th>
														<th>Date</th>
														<th>Start</th>
														<th>End</th>
														<th>Add Time</th>
													</tr>
												</thead>
												<tbody>
													<?php
													$count = 0;
													$list_qury = mysqli_query($conn, "SELECT * FROM lmsclass_schlmsle INNER JOIN lmstealmsr ON lmsclass_schlmsle.tealmsr=lmstealmsr.tid where tid='" . $_SESSION['tid'] . "' ORDER BY classid DESC");

													while ($list_resalt = mysqli_fetch_array($list_qury)) {
														$count++;

														$level_qury = mysqli_query($conn, "SELECT * FROM lmsclass WHERE cid='$list_resalt[level]'");
														$level_resalt = mysqli_fetch_array($level_qury);

														$subject_qury = mysqli_query($conn, "SELECT * FROM lmsclass_schlmsle WHERE classid='$list_resalt[classid]'");
														$subject_resalt = mysqli_fetch_array($subject_qury);
													?>
														<tr>
															<td><?php echo number_format($count, 0); ?></td>

															<td style="text-transform: capitalize;"><?php echo $list_resalt['fullname']; ?></td>
															<td style="text-transform: capitalize;"><a class="btn btn-primary" href="attendence_result.php?att_res=<?php echo $list_resalt['classid']; ?>"><?php echo $list_resalt['lesson']; ?></a></td>
															<td style="text-transform: capitalize;"><?php echo $level_resalt['name']; ?></td>
															<td style="text-transform: capitalize;">
																<?php

																$id = $subject_resalt['subject'];

																$query = $DB_con->prepare('SELECT name FROM lmssubject WHERE sid=' . $id);

																$query->execute();

																$result = $query->fetch();

																echo $result['name'];

																?>
															</td>
															<td><span style="font-size:14px;"> <?php echo date_format(date_create($list_resalt['add_date2']), "F"); ?></span></td>
															<td><?php echo date_format(date_create($list_resalt['classdate']), "M d, Y"); ?></td>
															<td><?php echo date_format(date_create($list_resalt['class_start_time']), "h:i:s A"); ?></td>
															<td><?php echo date_format(date_create($list_resalt['class_end_time']), "h:i:s A"); ?></td>
															<td><?php echo date_format(date_create($list_resalt['add_date2']), "h:i:s A"); ?></td>

														</tr>
													<?php
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