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
	<title>Ebook | Online Learning Platforms | Dashboard</title>
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
							<h4>All Ebook</h4>
						</div>
					</div>
					<div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="home.php">Home</a></li>
							<li class="breadcrumb-item active"><a href="javascript:void(0);">Ebook</a></li>
							<li class="breadcrumb-item active"><a href="javascript:void(0);">All Ebook</a></li>
						</ol>
					</div>
				</div>

				<div class="row">

					<div class="col-lg-12">
						<div class="row tab-content">
							<div id="list-view" class="tab-pane fade active show col-lg-12">
								<div class="card border-0 bg-light">
									<div class="card-header">
										<h4 class="card-title">All Ebook</h4>
										<a href="add_ebook.php" class="btn btn-square btn-secondary">+ Add Ebook</a>
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

													$stmt = $DB_con->prepare('SELECT * FROM lmsebook ORDER BY ctuid');

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
																	<a class="btn btn-primary" href="edit_ebook.php?cttid=<?php echo $row["ctuid"]; ?>">
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