<?php

if (!isset($_SESSION)) {
	session_start();
}

require_once 'includes.php';

require_once '../super_admin/conn.php';

require_once '../super_admin/dbconfig4.php';

?>
<!DOCTYPE html>
<html lang="en">

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>Class Tute | Online Learning Platforms | Dashboard</title>
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
									<img src="../admin/images/profile/pic1.jpg" width="20" alt="" />
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

		<!--**********************************
            Content body start
        ***********************************-->
		<div class="content-body bg-lblue">
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
														<th>Upload Month</th>
														<th>Date</th>
													</tr>
												</thead>
												<tbody>
													<?php

													$stmt = $DB_con->prepare('SELECT * FROM lmsclasstute ORDER BY ctuid');

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
																	<a class="btn btn-danger" href="#" data-toggle="modal" data-target="#deleteClassTutorialModal<?php echo $row["ctuid"]; ?>">
																		<i class="fa la la-trash-o"></i>
																	</a>

																	<!-- Modal -->
																	<div class="modal fade" id="deleteClassTutorialModal<?php echo $row["ctuid"]; ?>" tabindex="-1" aria-labelledby="deleteClassTutorialModalLabel<?php echo $row["ctuid"]; ?>" aria-hidden="true">
																		<div class="modal-dialog">
																			<div class="modal-content">
																				<div class="modal-header">
																					<h5 class="modal-title" id="deleteClassTutorialModalLabel<?php echo $row["ctuid"]; ?>">Delete Class Tutorial</h5>
																					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
																						<span aria-hidden="true">&times;</span>
																					</button>
																				</div>
																				<div class="modal-body">
																					Are you sure you want to delete this class tutorial?
																				</div>
																				<div class="modal-footer">
																					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
																					<a href="delete_class_tute.php?cttid=<?php echo $row["ctuid"]; ?>" class="btn btn-danger">Delete</a>
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
																<td><a href="../admin/images/classtute/<?php echo $row['tdocument']; ?>" target="_blank">View Tute</a></td>
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