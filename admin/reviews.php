<?php

if (!isset($_SESSION)) {
	session_start();
}

require_once 'includes.php';

require_once '../super_admin/dbconfig4.php';

?>
<!DOCTYPE html>
<html lang="en">

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>Reviews | Online Learning Platforms | Dashboard</title>
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
							<h4>All Reviews</h4>
						</div>
					</div>
					<div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="home.php">Home</a></li>
							<li class="breadcrumb-item active"><a href="javascript:void(0);">Reviews</a></li>
							<li class="breadcrumb-item active"><a href="javascript:void(0);">All Reviews</a></li>
						</ol>
					</div>
				</div>

				<div class="row">

					<div class="col-lg-12">
						<div class="row tab-content">
							<div id="list-view" class="tab-pane fade active show col-lg-12">
								<div class="card border-0 bg-light">
									<div class="card-header">
										<h4 class="card-title">All Reviews</h4>
									</div>
									<div class="card-body">
										<div class="table-responsive">
											<table id="dataTable" class="table table-bordered">
												<thead>
													<tr>
														<th>ID</th>
														<th>Action</th>
														<th>Option</th>
														<th>Student</th>
														<th>Teacher name</th>
														<th>Title</th>
														<th>Rate</th>
														<th>Review</th>
														<th>Date</th>
													</tr>
												</thead>
												<tbody>
													<?php

													$stmt = $DB_con->prepare('SELECT * FROM lmscomments ORDER BY id');

													$stmt->execute();

													if ($stmt->rowCount() > 0) {

														while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {

															extract($row);

													?>
															<tr>
																<td><?php echo $row['id']; ?></td>
																<td>
																	<!-- Button trigger modal -->
																	<a class="btn btn-danger" data-toggle="modal" data-target="#deleteConfirmationModal">
																		<i class="la la-trash-o"></i>
																	</a>

																	<!-- Modal -->
																	<div class="modal fade" id="deleteConfirmationModal" tabindex="-1" role="dialog" aria-labelledby="deleteConfirmationModalLabel" aria-hidden="true">
																		<div class="modal-dialog" role="document">
																			<div class="modal-content">
																				<div class="modal-header">
																					<h5 class="modal-title" id="deleteConfirmationModalLabel">Delete Review</h5>
																					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
																						<span aria-hidden="true">&times;</span>
																					</button>
																				</div>
																				<div class="modal-body">
																					<p>Are you sure you want to delete this review?</p>
																				</div>
																				<div class="modal-footer">
																					<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
																					<a class="btn btn-danger" href="delete_review.php?rrid=<?php echo $row["id"]; ?>">Delete</a>
																				</div>
																			</div>
																		</div>
																	</div>

																</td>
																<td><?php

																	if ($row['status'] == "0") {

																		echo '<button class="btn btn-primary btn-sm" on>Pending</button>';
																	} else if ($row['status'] == "1") {

																		echo '<button class="btn btn-success btn-sm">Success</button>';
																	}

																	?></td>
																<td>
																	<img src="../profile/uploadImg/<?php

																									$id = $row['uid'];

																									$query = $DB_con->prepare('SELECT image FROM lmsregister WHERE reid=' . $id);

																									$query->execute();

																									$result = $query->fetch();

																									echo $result['image'];

																									?>" alt="" id="dis_image" style="width: 32px; height: 32px; border-radius: 100%; cursor: pointer; object-fit: cover; background-position: center;" />


																	<?php

																	$id = $row['uid'];

																	$query = $DB_con->prepare('SELECT fullname FROM lmsregister WHERE reid=' . $id);

																	$query->execute();

																	$result = $query->fetch();

																	echo $result['fullname'];

																	?>
																</td>
																<td>
																	<img src="images/teacher/<?php

																								$id = $row['tealmsr'];

																								$query = $DB_con->prepare('SELECT image FROM lmstealmsr WHERE tid=' . $id);

																								$query->execute();

																								$result = $query->fetch();

																								echo $result['image'];

																								?>" alt="" id="dis_image" style="width: 32px; height: 32px; border-radius: 100%; cursor: pointer; object-fit: cover; background-position: center;" />

																	<?php

																	$id = $row['tealmsr'];

																	$query = $DB_con->prepare('SELECT fullname FROM lmstealmsr WHERE tid=' . $id);

																	$query->execute();

																	$result = $query->fetch();

																	echo $result['fullname'];

																	?>
																</td>
																<td><?php echo $row['title']; ?></td>
																<td>
																	<h5 style="font-weight:bold;color:orange;">
																		<?php

																		if ($row['rate'] == "1") {

																			echo '<i class="ti-star active"></i>';
																		} else if ($row['rate'] == "2") {

																			echo '<i class="ti-star active"></i><i class="ti-star active"></i>';
																		} else if ($row['rate'] == "3") {

																			echo '<i class="ti-star active"></i><i class="ti-star active"></i><i class="ti-star active"></i>';
																		} else if ($row['rate'] == "4") {

																			echo '<i class="ti-star active"></i><i class="ti-star active"></i><i class="ti-star active"></i><i class="ti-star active"></i>';
																		} else if ($row['rate'] == "5") {

																			echo '<i class="ti-star active"></i><i class="ti-star active"></i><i class="ti-star active"></i><i class="ti-star active"></i><i class="ti-star"></i>';
																		}

																		?>
																	</h5>
																</td>
																<td>"<?php echo $row['review']; ?>"</td>
																<td><?php echo $row['add_date']; ?></td>
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