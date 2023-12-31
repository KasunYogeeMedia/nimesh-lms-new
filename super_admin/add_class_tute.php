<?php

if (!isset($_SESSION)) {
	session_start();
}

require_once 'includes.php';

require_once '../super_admin/conn.php';

require_once '../super_admin/config.php';

require_once '../super_admin/dbconfig4.php';

$msg5 = '';

if (isset($_POST['add_classtute'])) {

	$tid = $_POST['tid'];
	$class = $_POST['class'];
	$subject = $_POST['subject'];
	$month = $_POST['month'];
	$ctype = $_POST['ctype'];
	$title = $_POST['title'];
	$status = $_POST['status'];

	date_default_timezone_set("Asia/Colombo");

	$payment_month = mysqli_real_escape_string($conn, $_POST['payment_month'] . date("-d H:i:s"));

	$imgFile = $_FILES['user_image']['name'];
	$tmp_dir = $_FILES['user_image']['tmp_name'];
	$imgSize = $_FILES['user_image']['size'];

	if (empty($class)) {
		$errMSG = "Please Select Class.";
	} else if (empty($subject)) {
		$errMSG = "Please Select Course.";
	} else if (empty($month)) {
		$errMSG = "Please Select Month.";
	} else if (empty($ctype)) {
		$errMSG = "Please Select Type.";
	} else if (empty($title)) {
		$errMSG = "Please Select Title.";
	} else if (empty($status)) {
		$errMSG = "Please Select Status.";
	} {
		$upload_dir = '../admin/images/classtute/'; // upload directory

		$imgExt = strtolower(pathinfo($imgFile, PATHINFO_EXTENSION)); // get image extension

		// valid image extensions
		$valid_extensions = array('jpeg', 'jpg', 'png', 'gif', 'docx', 'pdf', 'video', 'mp3'); // valid extensions

		// rename uploading image
		$userpic = rand(1, 1000000) . "." . $imgExt;

		// allow valid image file formats
		if (in_array($imgExt, $valid_extensions)) {
			// lmsck file size '5MB'
			if ($imgSize < 5000000) {
				move_uploaded_file($tmp_dir, $upload_dir . $userpic);
			} else {
				$errMSG = "Sorry, your file is too large.";
			}
		} else {
			$errMSG = "Sorry, only JPG, JPEG, PNG & GIF , DOCX & PDF files are allowed.";
		}
	}
	// if no error occured, continue ....
	if (!isset($errMSG)) {
		$stmt = $DB_con->prepare('INSERT INTO lmsclasstute(tid,class,subject,month,ctype,title,tdocument,add_date,status) VALUES(:tid,:class,:subject,:month,:ctype,:title,:upic,:payment_month,:status)');
		$stmt->bindParam(':tid', $tid);
		$stmt->bindParam(':class', $class);
		$stmt->bindParam(':subject', $subject);
		$stmt->bindParam(':month', $month);
		$stmt->bindParam(':ctype', $ctype);
		$stmt->bindParam(':title', $title);
		$stmt->bindParam(':upic', $userpic);
		$stmt->bindParam(':payment_month', $payment_month);
		$stmt->bindParam(':status', $status);

		if ($stmt->execute()) {

			$successMSG = "Class Tute Successfully Added.";

			header("refresh:2;class_tute.php"); // redirects image view page after 5 seconds.

		} else {

			$errMSG = "error while inserting....";
		}
	}
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>Add Class Tute | Online Learning Platforms | Dashboard</title>
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
							<h4>Add Class Tute</h4>
						</div>
					</div>
					<div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.php">Home</a></li>
							<li class="breadcrumb-item"><a href="javascript:void(0);">Class Tute</a></li>
							<li class="breadcrumb-item active"><a href="javascript:void(0);">Add Class Tute</a></li>
						</ol>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-12">
						<div class="card border-0 bg-light">
							<div class="card-header">
								<h4 class="card-title">Add Class Tute</h4>
							</div>
							<div class="card-body">
								<?php

								if (isset($errMSG)) {

								?>

									<div class="alert alert-danger alert-dismissible alert-alt solid fade show">
										<button type="button" class="close h-100" data-dismiss="alert" aria-label="Close"><span><i class="mdi mdi-close"></i></span></button>
										<strong>Error!</strong> <?php echo $errMSG; ?>
									</div>

								<?php

								} else if (isset($successMSG)) {

								?>

									<div class="alert alert-success alert-dismissible alert-alt solid fade show">
										<button type="button" class="close h-100" data-dismiss="alert" aria-label="Close"><span><i class="mdi mdi-close"></i></span></button>
										<strong>Success!</strong> <?php echo $successMSG; ?>.
									</div>

								<?php

								}

								?>
								<form method="POST" enctype="multipart/form-data">
									<div class="row">
										<div class="col-lg-3 col-md-3 col-sm-12">
											<div class="form-group">
												<label class="form-label">Teacher</label>
												<select class="form-control" name="tid" required>
													<?php

													$stmt = $DB_con->prepare('SELECT * FROM lmstealmsr where status="1" ORDER BY tid');

													$stmt->execute();

													if ($stmt->rowCount() > 0) {

														while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {

															extract($row);

													?>
															<option value="<?php echo $row['tid']; ?>"><?php echo $row['fullname']; ?></option>
													<?php
														}
													}
													?>
												</select>
											</div>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-12">
											<div class="form-group">
												<label class="form-label">Batch</label>
												<select class="form-control" name="class" onChange="JavaScript:send_level(this.value);" required>
													<option value="" hidden="yes">Select Batch</option>
													<?php

													$stmt = $DB_con->prepare('SELECT * FROM lmsclass ORDER BY cid');
													$stmt->execute();
													if ($stmt->rowCount() > 0) {
														while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
															extract($row);
													?>
															<option value="<?php echo $row['cid']; ?>"><?php echo $row['name']; ?></option>
													<?php
														}
													}
													?>
												</select>
											</div>
										</div>
										<script>
											function send_level(level_id) {
												var xhttp = new XMLHttpRequest();
												xhttp.onreadystatechange = function() {
													if (this.readyState == 4 && this.status == 200) {
														document.getElementById("subject_dis").innerHTML = this.responseText;
													}
												};
												xhttp.open("GET", "ajax_subject_filter.php?level_id=" + level_id, true);
												xhttp.send();
											}
										</script>
										<div class="col-lg-3 col-md-3 col-sm-12">
											<div class="form-group">
												<label class="form-label">Class Course</label>
												<span id="subject_dis">
													<select name="subject" class="form-control" required>
														<option hidden="yes"><?php if (isset($_GET['edit'])) {
																					echo $edit_resalt['subject'];
																				} else {
																					echo "Course Not Found";
																				} ?></option>
													</select>
												</span>
											</div>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-12">
											<div class="form-group">
												<label class="form-label">Month</label>
												<select class="form-control" name="month" required>
													<option style="display:none;">Select Month</option>
													<option>January</option>
													<option>February</option>
													<option>March</option>
													<option>April</option>
													<option>May</option>
													<option>June</option>
													<option>July</option>
													<option>August</option>
													<option>September</option>
													<option>October</option>
													<option>November</option>
													<option>December</option>
												</select>
											</div>
										</div>
										<div class="col-lg-2 col-md-2 col-sm-12">
											<div class="form-group">
												<label class="form-label">Class Type</label>
												<select class="form-control" name="ctype" required>
													<option>Online Class</option>
													
												</select>
											</div>
										</div>
										<div class="col-lg-5 col-md-5 col-sm-12">
											<div class="form-group">
												<label class="form-label">Title</label>
												<input type="text" class="form-control" name="title" placeholder="Enter Class Tute Title" required>
											</div>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-12">
											<div class="form-group">
												<label class="form-label">Upload Document</label>
												<input type="file" class="form-control" name="user_image">
												<hr>
												<p style="font-weight:bold;color:red;">Note : "Only Upload - Pdf|Docx|Jpg|Png"</p>
											</div>
										</div>

										<div class="col-lg-3 col-md-6 col-sm-12 mb-2 d-none">
											<label class="form-label">Upload Month</label>
											<input name="payment_month" type="month" id="payment_month" class="form-control" value="<?php echo date("Y-m") ?>">
										</div>

										<div class="col-lg-2 col-md-2 col-sm-12">
											<div class="form-group">
												<label class="form-label">Status</label>
												<select class="form-control" name="status" required>
													<option value="1">Published</option>
													<option value="0">Unpublished</option>
												</select>
											</div>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12">
											<input type="submit" name="add_classtute" class="btn btn-primary" value="Save changes">
											<a class="btn btn-danger" href="class_tute.php"><i class="fa fa-times"></i> Cancel</a>
										</div>
									</div>
								</form>
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