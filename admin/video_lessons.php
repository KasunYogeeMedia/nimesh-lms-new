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
	<title>Video Lessons | Online Learning Platforms | Dashboard</title>
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
							<h4>All Video Lessons</h4>
						</div>
					</div>
					<div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="home.php">Home</a></li>
							<li class="breadcrumb-item active"><a href="javascript:void(0);">Video Lessons</a></li>
							<li class="breadcrumb-item active"><a href="javascript:void(0);">All Video Lessons</a></li>
						</ol>
					</div>
				</div>

				<div class="row">

					<div class="col-lg-12">
						<div class="row tab-content">
							<div id="list-view" class="tab-pane fade active show col-lg-12">
								<div class="card border-0 bg-light">
									<div class="card-header">
										<h4 class="card-title">All Video Lessons</h4>
										<a href="add_video_lessons.php" class="btn btn-square btn-secondary">+ Add Video Lessons</a>
									</div>
									<div class="card-body">
										<div class="table-responsive">
											<table id="dataTable" class="table table-bordered">
												<thead>
													<tr>
														<th>ID</th>
														<th>Action</th>
														<th>Type</th>
														<th>Teacher</th>
														<th>Batch</th>
														<th>Course</th>
														<th>Title</th>
														<th>Cover</th>
														<th>Month</th>
														<th>Date</th>
														<th>Option</th>
														<th>Available Days</th>
														<th>Views Per Day</th>
													</tr>
												</thead>
												<tbody>
													<?php

													$stmt = $DB_con->prepare('SELECT * FROM lmslesson ORDER BY lid');

													$stmt->execute();

													if ($stmt->rowCount() > 0) {

														while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {

															extract($row);

													?>
															<tr>
																<td><?php echo $row['lid']; ?></td>
																<td>
																	<a class="btn btn-primary" href="edit_video_lessons.php?leid=<?php echo $row["lid"]; ?>">
																		<i class="fa fa-edit"></i>
																	</a>
																	<a class="btn btn-danger" href="delete_video_lessons.php?leid=<?php echo $row["lid"]; ?>">
																		<i class="fa fa-times-circle"></i>
																	</a>
																</td>
																<td><?php echo $row['type']; ?></td>
																<td><?php

																	$id = $row['tid'];

																	$query = $DB_con->prepare('SELECT fullname FROM lmstealmsr WHERE tid=' . $id);

																	$query->execute();

																	$result = $query->fetch();

																	echo $result['fullname'];

																	?></td>
																<td><?php

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
																<td><?php echo $row['title']; ?></td>
																<td>
																	<?php if ($row['cover'] == "") {
																		$pro_img = "../profile/images/hd_dp.jpg";
																	} else {
																		$pro_img = "images/lesson/cover/" . $row['cover'];
																	} ?><img src="<?php echo $pro_img; ?>" class="pro_pick">
																</td>
																<td><span style="font-size:14px;"> <?php echo date_format(date_create($row['add_date']), "F"); ?></span></td>
																<td><?php echo $row['add_date']; ?></td>
																<td>
																	<?php

																	if ($row['status'] == "0") {

																		echo '<button class="btn btn-primary btn-sm" on>Pending</button>';
																	} else if ($row['status'] == "1") {

																		echo '<button class="btn btn-success btn-sm">Success</button>';
																	}

																	?>
																</td>

																<td><?php echo $row['available_days']; ?></td>
																<td><?php echo $row['no_of_views_per_day']; ?></td>

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