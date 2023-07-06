<?php

session_start();

require_once '../admin/dbconfig4.php';

require_once("../admin/config.php");

include '../admin/conn.php';

if (!isset($_SESSION['reid'])) {

	header('location:../login.php');

	die();
}
$user_qury = mysqli_query($conn, "SELECT * FROM lmsregister INNER JOIN lmsclass ON lmsregister.level=lmsclass.cid WHERE reid='$_SESSION[reid]'");
$user_resalt = mysqli_fetch_array($user_qury);

$image_qury = mysqli_query($conn, "SELECT * FROM lmsregister WHERE reid='$_SESSION[reid]'");
$image_resalt = mysqli_fetch_array($image_qury);

if ($image_resalt['image'] == "") {
	$dis_image_path = "images/hd_dp.jpg";
} else {
	$dis_image_path = "uploadImg/" . $image_resalt['image'];
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, shrink-to-fit=9">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>Bank Payment | Online Learning Platforms | Student Panel</title>
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
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-12">
							<h2 class="st_title"> Bank Payments History</h2>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12 col-md-12">
							<ul class="more_options_tt">
								<li><button class="more_items_14 active">This Month</button></li>
								<li><button class="more_items_14">Last Month</button></li>
								<li>
									<div class="explore_search">
										<div class="ui search focus">
											<div class="ui left icon input swdh11 swdh15">
												<input class="prompt srch_explore" type="text" placeholder="Month">
												<i class="uil uil-search-alt icon icon8"></i>
											</div>
										</div>
									</div>
								</li>
							</ul>
						</div>
						<div class="col-lg-12 col-md-12">
							<div class="table-responsive mt-30">
								<table width="100%" class="table ucp-table earning__table" id="content-table">
									<thead class="thead-s">
										<tr>
											<th scope="col">Status</th>
											<th scope="col">Batch/Course</th>
											<th scope="col">Slip</th>
											<th scope="col">Amount</th>
											<th scope="col">Valid Date - Paid Month</th>
											<th scope="col">Pay Date</th>
										</tr>
									</thead>
									<tbody>
										<?php
										$today_time = date("Y-m-d");

										$payment_qury = mysqli_query($conn, "SELECT * FROM lmspayment WHERE paymentMethod='Bank' and userID='$_SESSION[reid]' ORDER BY pid DESC");
										while ($payment_resalt = mysqli_fetch_array($payment_qury)) {
										?>
											<tr>
												<td>
													<?php
													if ($payment_resalt['status'] == 0) {
													?>
														<span class="badge badge-warning">Pending</span>
													<?php
													} elseif ($payment_resalt['status'] == 1) {
													?>
														<span class="badge badge-success">Active</span>
													<?php
													} elseif ($payment_resalt['status'] == 2) {
													?>
														<span class="badge badge-danger">Reject</span>
													<?php
													}
													?>
												</td>
												<td>
													<span class="badge badge-warning">
														<?php
														// Assuming $payment_result['pay_sub_id'] is already sanitized or prepared safely.
														$sub_qury = mysqli_query($conn, "SELECT s.name AS subject_name, c.name AS class_name FROM lmssubject s INNER JOIN lmsclass c ON s.class_id = c.cid WHERE s.sid = '$payment_resalt[pay_sub_id]'");

														while ($sub_resalt = mysqli_fetch_array($sub_qury)) {
															echo $sub_resalt['subject_name'] . ' - ' . $sub_resalt['class_name'] . ' ';
														}
														?>
													</span>

												</td>
												<td>
													<a href="<?php echo "$url/profile/uploadslip/" . $payment_resalt['fileName']; ?>" target="_blank" class="badge badge-primary">View Slip</a>
												</td>
												<td>
													<span class="badge badge-primary">Rs.<?php echo number_format($payment_resalt['amount'], 2); ?></span>
												</td>
												<td>
													<a href="#"><span class="badge badge-success" style="font-size:14px;">Valid Date : <i class="fa fa-check-circle"></i> <?php echo date_format(date_create($payment_resalt['expiredate']), "M d, Y"); ?> - Paid Month : <i class="fa fa-check-circle"></i> <?php echo date_format(date_create($payment_resalt['pay_month']), "F"); ?></span></a>
												</td>
												<td>
													<?php echo date_format(date_create($payment_resalt['created_at']), "M d, Y | h:i:s A"); ?>
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