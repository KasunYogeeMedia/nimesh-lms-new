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

		$image_path = "../super_admin/images/teacher/" . $user_resalt['image'];
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
						<ul class="nav nav-pills mb-3">
							<li class="nav-item"><a href="#list-view" data-toggle="tab" class="nav-link btn-primary mr-1 show active">List View</a></li>
							<li class="nav-item"><a href="#grid-view" data-toggle="tab" class="nav-link btn-primary">Grid View</a></li>
						</ul>
					</div>
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
																	<a class="btn btn-primary" href="edit_class_tute.php?cttid=<?php echo $row["ctuid"]; ?>">
																		<i class="fa fa-edit"></i>
																	</a>
																	<a class="btn btn-danger" href="delete_class_tute.php?cttid=<?php echo $row["ctuid"]; ?>">
																		<i class="fa fa-times-circle"></i>
																	</a>
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
																<td><a href="../super_admin/images/classtute/<?php echo $row['tdocument']; ?>" class="badge badge-primary" target="_blank">View Tute</a></td>
																<td><span class="badge badge-secondary" style="font-size:14px;"> <?php echo date_format(date_create($row['add_date']), "F"); ?></span></td>
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
							<div id="grid-view" class="tab-pane fade col-lg-12">
								<div class="row">
									<tbody>
										<?php

										$stmt = $DB_con->prepare('SELECT * FROM lmsclasstute ORDER BY ctuid');

										$stmt->execute();

										if ($stmt->rowCount() > 0) {

											while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {

												extract($row);

										?>
												<div class="col-lg-4 col-md-6 col-sm-6 col-12">
													<div class="card border-0 bg-light">
														<div class="card-body">
															<div class="text-center">
																<div class="profile-photo">
																	<a class="btn btn-success btn-rounded mt-3 px-4" href="../super_admin/images/classtute/<?php echo $row['tdocument']; ?>" target="_blank">View Tute</a>
																</div>
																<h3 class="mt-4 mb-1"><strong><?php echo $row['title']; ?></strong></h3>
																<p class="text-muted"><strong>Month : <?php echo $row['month']; ?></strong></p>
																<ul class="list-group mb-3 list-group-flush">
																	<li class="list-group-item px-0 d-flex justify-content-between">
																		<span class="mb-0">Type :</span><strong><?php echo $row['ctype']; ?></strong>
																	</li>
																	<li class="list-group-item px-0 d-flex justify-content-between">
																		<span class="mb-0">Batch :</span><strong>
																			<?php
																			$id = $row['class'];
																			$query = $DB_con->prepare('SELECT name FROM lmsclass WHERE cid=' . $id);
																			$query->execute();
																			$result = $query->fetch();
																			echo $result['name'];
																			?></strong>
																	</li>
																	<li class="list-group-item px-0 d-flex justify-content-between">
																		<span class="mb-0">Class :</span><strong>
																			<?php
																			$id = $row['subject'];
																			$query = $DB_con->prepare('SELECT name FROM lmssubject WHERE sid=' . $id);
																			$query->execute();
																			$result = $query->fetch();
																			echo $result['name'];
																			?></strong>
																	</li>
																	<li class="list-group-item px-0 d-flex justify-content-between">
																		<span class="mb-0">Teacher : </span><strong>
																			<?php

																			$id = $row['tid'];

																			$query = $DB_con->prepare('SELECT fullname FROM lmstealmsr WHERE tid=' . $id);

																			$query->execute();

																			$result = $query->fetch();

																			echo $result['fullname'];

																			?></strong>
																	</li>
																	<li class="list-group-item px-0 d-flex justify-content-between">
																		<span class="mb-0">Month :</span><strong><span class="badge badge-success" style="font-size:14px;"> <?php echo date_format(date_create($row['add_date']), "F"); ?></span></strong>
																	</li>


																	<li class="list-group-item px-0 d-flex justify-content-between">
																		<span class="mb-0">Status : </span><strong>
																			<?php

																			if ($row['status'] == "0") {

																				echo '<button class="btn btn-primary btn-sm" on>Pending</button>';
																			} else if ($row['status'] == "1") {

																				echo '<button class="btn btn-success btn-sm">Published</button>';
																			}

																			?></strong>
																	</li>
																	<li class="list-group-item px-0 d-flex justify-content-between">
																		<span class="mb-0">Added Date :</span><strong><?php echo $row['add_date']; ?></strong>
																	</li>
																</ul>
																<a class="btn btn-primary btn-rounded mt-3 px-4" href="edit_class_tute.php?cttid=<?php echo $row["ctuid"]; ?>">
																	<i class="fa fa-edit"></i>
																</a>
																<a class="btn btn-danger btn-rounded mt-3 px-4" href="delete_class_tute.php?cttid=<?php echo $row["ctuid"]; ?>">
																	<i class="fa fa-times-circle"></i>
																</a>
															</div>
														</div>
													</div>
												</div>
										<?php }
										}
										?>
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