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
	<title>Class Tute | Teacher Panel | Online Learning Platforms </title>

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
							<h4>All Class Tute</h4>
						</div>
					</div>
					<div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="home.php">Home</a></li>
							<li class="breadcrumb-item active"><a href="javascript:void(0);">Class Tute</a></li>
							<li class="breadcrumb-item active"><a href="javascript:void(0);">All Class Tute</a></li>
						</ol>
					</div>
				</div>

				<div class="row">

					<div class="col-lg-12">
						<div class="row tab-content">
							<div id="list-view" class="tab-pane fade active show col-lg-12">
								<div class="card border-0 bg-light">
									<div class="card-header">
										<h4 class="card-title">All Class Tute</h4>
										<a href="add_class_tute.php" class="btn btn-square btn-secondary">+ Add Class Tute</a>
									</div>
									<div class="card-body">
										<div class="table-responsive">
											<table id="dataTable" class="table table-bordered">
												<thead>
													<tr>
														<th>ID</th>
														<th>Option</th>
														<th>Action</th>
														<th>Teacher</th>
														<th>Batch</th>
														<th>Course</th>
														<th>Month</th>
														<th>Class Type</th>
														<th>Title</th>
														<th>Document</th>
														<th>Upoload Month</th>
														<th>Date</th>
													</tr>
												</thead>
												<tbody>
													<?php

													$stmt = $DB_con->prepare('SELECT * FROM lmsclasstute where tid="' . $_SESSION['tid'] . '" ORDER BY ctuid');

													$stmt->execute();

													if ($stmt->rowCount() > 0) {

														while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {

															extract($row);

													?>
															<tr>
																<td><?php echo $row['ctuid']; ?></td>
																<td>
																	<?php

																	if ($row['status'] == "0") {

																		echo '<button class="btn btn-primary btn-sm" on>Pending</button>';
																	} else if ($row['status'] == "1") {

																		echo '<button class="btn btn-success btn-sm">Published</button>';
																	}

																	?>
																</td>
																<td>
																	<a class="btn btn-primary mb-1" href="edit_class_tute.php?cttid=<?php echo $row["ctuid"]; ?>">
																		<i class="fa fa-edit"></i>
																	</a>
																	<!-- Button trigger modal -->
																	<a class="btn btn-danger" href="#" data-bs-toggle="modal" data-bs-target="#deleteConfirmationModal<?php echo $row["ctuid"]; ?>">
																		<i class="fa fa-times-circle"></i>
																	</a>

																	<!-- Modal -->
																	<div class="modal fade" id="deleteConfirmationModal<?php echo $row["ctuid"]; ?>" tabindex="-1" aria-labelledby="deleteConfirmationModalLabel" aria-hidden="true">
																		<div class="modal-dialog">
																			<div class="modal-content">
																				<div class="modal-header">
																					<h5 class="modal-title" id="deleteConfirmationModalLabel">Delete Class Tutorial</h5>
																					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
																				</div>
																				<div class="modal-body">
																					<p>Are you sure you want to delete this class tutorial?</p>
																				</div>
																				<div class="modal-footer">
																					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
																					<a class="btn btn-danger" href="delete_class_tute.php?cttid=<?php echo $row["ctuid"]; ?>">Delete</a>
																				</div>
																			</div>
																		</div>
																	</div>

																</td>
																<td>
																	<?php

																	$id = $row['tid'];

																	$query = $DB_con->prepare('SELECT fullname FROM lmstealmsr WHERE tid=' . $id);

																	$query->execute();

																	$result = $query->fetch();

																	echo $result['fullname'];

																	?>
																</td>
																<td>
																	<?php
																	$id = $row['class'];
																	$query = $DB_con->prepare('SELECT name FROM lmsclass WHERE cid=' . $id);
																	$query->execute();
																	$result = $query->fetch();
																	echo $result['name'];
																	?></td>
																<td>
																	<?php
																	$id = $row['subject'];
																	$query = $DB_con->prepare('SELECT name FROM lmssubject WHERE sid=' . $id);
																	$query->execute();
																	$result = $query->fetch();
																	echo $result['name'];
																	?>
																</td>
																<td><?php echo $row['month']; ?></td>
																<td><?php echo $row['ctype']; ?></td>
																<td><?php echo $row['title']; ?></td>
																<td><a href="../admin/images/classtute/<?php echo $row['tdocument']; ?>" class="btn btn-primary" target="_blank">View Tute</a></td>
																<td><span style="font-size:14px;"> <?php echo date_format(date_create($row['add_date']), "F"); ?></span></td>
																<td><?php echo $row['add_date']; ?></td>
															</tr>
													<?php }
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