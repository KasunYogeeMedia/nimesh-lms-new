<?php

if (!isset($_SESSION)) {
	session_start();
}

require_once 'includes.php';

require_once '../super_admin/conn.php';

require_once '../super_admin/dbconfig4.php';

if (isset($_GET['delete'])) {
	$delete = mysqli_real_escape_string($conn, $_GET['delete']);
	mysqli_query($conn, "DELETE FROM lmstealmsr WHERE tid='$delete'");
	echo "<script>window.location='teachers.php';</script>";
}

if (isset($_GET['status']) && isset($_GET['type'])) {
	$status = mysqli_real_escape_string($conn, $_GET['status']);
	$type = mysqli_real_escape_string($conn, $_GET['type']);

	if ($type == 1) {
		$update = 0;
	}
	if ($type == 0) {
		$update = 1;
	}

	mysqli_query($conn, "UPDATE lmstealmsr SET status='$update' WHERE tid='$status'");

	echo "<script>window.location='teachers.php';</script>";
}

?>
<!DOCTYPE html>
<html lang="en">

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>Teachers | Online Learning Platforms | Dashboard</title>
	<?php
	require_once 'headercss.php';
	?>
</head>

<body>

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

		<!--**********************************
            Content body start
        ***********************************-->
		<div class="content-body bg-lblue">
			<!-- row -->
			<div class="container-fluid">

				<div class="row page-titles mx-0">
					<div class="col-sm-6 p-md-0">
						<div class="welcome-text">
							<h4>All Teachers</h4>
						</div>
					</div>
					<div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="home.php">Home</a></li>
							<li class="breadcrumb-item active"><a href="javascript:void(0);">Teachers</a></li>
							<li class="breadcrumb-item active"><a href="javascript:void(0);">All Teachers</a></li>
						</ol>
					</div>
				</div>

				<div class="row">

					<div class="col-lg-12">
						<div class="row tab-content">
							<div id="list-view" class="tab-pane fade active show col-lg-12">
								<div class="card border-0 bg-light">
									<div class="card-header">
										<h4 class="card-title">All Teachers </h4>
										<a href="add_teacher.php" class="btn btn-square btn-secondary">+ Add Teacher</a>
									</div>
									<div class="card-body">
										<div class="table-responsive">
											<table id="dataTable" class="table table-bordered">
												<thead>
													<tr>
														<th>#</th>
														<th>Profile</th>
														<th>Action</th>
														<th>Status</th>
														<th>Name</th>
														<th>Phone</th>
														<th>Email</th>
														<th>Batch</th>
														<th>Classes</th>
													</tr>
												</thead>
												<tbody>
													<?php
													$count = 0;
													$tec_qury = mysqli_query($conn, "SELECT * FROM lmstealmsr ORDER BY fullname");
													while ($tec_resalt = mysqli_fetch_array($tec_qury)) {
														$count++;
													?>
														<tr>
															<td><?php echo number_format($count, 0); ?></td>
															<td><?php if ($tec_resalt['image'] == "") {
																	$pro_img = "../profile/images/hd_dp.jpg";
																} else {
																	$pro_img = "images/teacher/" . $tec_resalt['image'];
																} ?><img src="<?php echo $pro_img; ?>" class="pro_pick"></td>
															<td style="white-space: nowrap">
																<a href="edit_teacher.php?edit=<?php echo $tec_resalt['tid']; ?>" title="Edit" class="btn btn-sm btn-primary" style="margin-right: 5px;"><i class="la la-pencil"></i></a>
																<a href="teachers.php?status=<?php echo $tec_resalt['tid']; ?>&type=<?php echo $tec_resalt['status']; ?>" title="Status Change" style="margin-right: 5px;" onClick="JavaScript:return confirm('Are you sure change this status?');" class="btn btn-sm btn-secondary"><i class="fa fa-lg fa-cogs" style="color: darkblue;"></i></a>
																<a href="#" title="Delete" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#deleteTeacherModal<?php echo $tec_resalt['tid']; ?>">
																	<i class="la la-trash-o"></i>
																</a>

																<!-- Modal -->
																<div class="modal fade" id="deleteTeacherModal<?php echo $tec_resalt['tid']; ?>" tabindex="-1" aria-labelledby="deleteTeacherModalLabel<?php echo $tec_resalt['tid']; ?>" aria-hidden="true">
																	<div class="modal-dialog">
																		<div class="modal-content">
																			<div class="modal-header">
																				<h5 class="modal-title" id="deleteTeacherModalLabel<?php echo $tec_resalt['tid']; ?>">Delete Teacher</h5>
																				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
																					<span aria-hidden="true">&times;</span>
																				</button>
																			</div>
																			<div class="modal-body">
																				Are you sure you want to delete this teacher?
																			</div>
																			<div class="modal-footer">
																				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
																				<a href="teachers.php?delete=<?php echo $tec_resalt['tid']; ?>" class="btn btn-danger">Delete</a>
																			</div>
																		</div>
																	</div>
																</div>

															</td>
															<td align="center">
																<?php
																if ($tec_resalt['status'] == 1) {
																?>
																	<span class="btn btn-success btn-sm">Active</span>
																<?php
																}
																if ($tec_resalt['status'] == 0) {
																?>
																	<span class="btn btn-primary btn-sm">Deactive</span>
																<?php
																}
																?>
															</td>
															<td style="text-transform: capitalize;"><?php echo $tec_resalt['fullname']; ?></td>
															<td><?php echo "0" . (int)$tec_resalt['contactnumber']; ?></td>
															<td><?php echo $tec_resalt['username']; ?></td>
															<td>
																<?php
																$level_array = array();
																$level_qury = mysqli_query($conn, "SELECT * FROM lmstealmsr_multiple INNER JOIN lmsclass ON lmstealmsr_multiple.tealmsr_contain_id=lmsclass.cid WHERE tealmsr_system_id='$tec_resalt[systemid]' and tealmsr_type='2'");
																while ($level_resalt = mysqli_fetch_array($level_qury)) {
																	array_push($level_array, "• " . $level_resalt['name']);
																}
																echo join("<br>", $level_array);
																?>
															</td>
															<td>
																<?php
																$subject_array = array();
																$subject_qury = mysqli_query($conn, "SELECT * FROM lmstealmsr_multiple INNER JOIN lmssubject ON lmstealmsr_multiple.tealmsr_contain_id=lmssubject.sid WHERE tealmsr_system_id='$tec_resalt[systemid]' and tealmsr_type='3'");
																while ($subject_resalt = mysqli_fetch_array($subject_qury)) {
																	array_push($subject_array, "• " . $subject_resalt['name']);
																}
																echo join("<br>", $subject_array);
																?>
															</td>
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

	<?php
	require_once 'footerjs.php';
	?>


</body>

</html>