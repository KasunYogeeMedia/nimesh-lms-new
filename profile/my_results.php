<?php

session_start();

require_once '../super_admin/dbconfig4.php';

require_once("../super_admin/config.php");

include '../super_admin/conn.php';

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
				<?php
				require_once 'pay_alert.php';
				?>
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-12">
							<h2 class="st_title mb-4"> Bank Payments History</h2>
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
								<?php 
						$sql = "SELECT *
						FROM verbal_exam ve
						LEFT JOIN lms_exam_report ler ON ve.userId = ler.exam_report_user
						LEFT JOIN exam_submissions es ON ve.userId = es.user_id
						LEFT JOIN course_work_submissions cws ON ve.userId = cws.user_id
						LEFT JOIN course_work_marks cwm ON ve.userId = cwm.user_id
						WHERE ve.userId = $_SESSION[reid]";

				$result = $conn->query($sql);

				// Check if there are results
				if ($result->num_rows > 0) {
					echo "<table border='1'><tr>";
					// Output column headers
					while ($row = $result->fetch_assoc()) {
						foreach ($row as $key => $value) {
							echo "<th>$key</th>";
						}
						break; // Only need to output column headers once
					}
					echo "</tr>";
					
					// Output data rows
					while ($row = $result->fetch_assoc()) {
						echo "<tr>";
						foreach ($row as $value) {
							echo "<td>$value</td>";
						}
						echo "</tr>";
					}
					echo "</table>";
				} else {
					echo "No results found.";
				}
				?>
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