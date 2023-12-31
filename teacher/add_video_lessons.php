<?php

if (!isset($_SESSION)) {
	session_start();
}

require_once 'includes.php';

require_once("../super_admin/conn.php");

require_once("../super_admin/config.php");

require_once '../super_admin/dbconfig4.php';

if (isset($_SESSION['tid'])) {

	$user_qury = mysqli_query($conn, "SELECT * FROM lmstealmsr WHERE tid='$_SESSION[tid]'");

	$user_resalt = mysqli_fetch_array($user_qury);



	if ($user_resalt['image'] == "") {

		$image_path = "../profile/images/hd_dp.jpg";
	} else {

		$image_path = "../admin/images/teacher/" . $user_resalt['image'];
	}
}

$msg5 = '';

if (isset($_POST['add_lesson'])) {
	$tid = $_POST['tid'];
	$type = $_POST['type'];
	$class = $_POST['class'];
	$subject = $_POST['subject'];
	$title = $_POST['title'];
	$video = $_POST['video'];
	$status = $_POST['status'];

	date_default_timezone_set("Asia/Colombo");

	$payment_month = mysqli_real_escape_string($conn, $_POST['payment_month'] . date("-d H:i:s"));

	$available_days = $_POST['available_days'];
	$no_of_views_per_day = $_POST['no_of_views_per_day'];

	$imgFile = $_FILES['user_image']['name'];
	$tmp_dir = $_FILES['user_image']['tmp_name'];
	$imgSize = $_FILES['user_image']['size'];

	if (empty($type)) {
		$errMSG = "Please Select Type.";
	} else if (empty($class)) {
		$errMSG = "Please Select Class.";
	} else if (empty($subject)) {
		$errMSG = "Please Select Course.";
	} else if (empty($title)) {
		$errMSG = "Please Enter Title.";
	} else if (empty($video)) {
		$errMSG = "Please Copy Video Code Or Link.";
	} else if (empty($status)) {
		$errMSG = "Please Select Status.";
	} {
		$upload_dir = '../admin/images/lesson/cover/'; // upload directory

		$imgExt = strtolower(pathinfo($imgFile, PATHINFO_EXTENSION)); // get image extension
		// valid image extensions
		$valid_extensions = array('jpeg', 'jpg', 'png', 'gif', 'docx', 'pdf', 'video', 'mp3'); // valid extensions
		// rename uploading image
		$userpic = rand(1, 1000000) . "." . $imgExt;
		// allow valid image file formats
		if (in_array($imgExt, $valid_extensions)) {
			// check file size '5MB'
			if ($imgSize < 5000000) {
				move_uploaded_file($tmp_dir, $upload_dir . $userpic);
			} else {
				$errMSG = "Sorry, your file is too large.";
			}
		} else {
			$errMSG = "Sorry, only JPG, JPEG, PNG & GIF , DOCX & PDF files are allowed.";
		}
	}
	if (!isset($errMSG)) {
		$stmt = $DB_con->prepare('INSERT INTO lmslesson(tid,type,class,subject,title,cover,video,add_date,status,available_days,no_of_views_per_day) VALUES(:tid,:type,:class,:subject,:title,:upic,:video,:payment_month,:status,:available_days,:no_of_views_per_day)');
		$stmt->bindParam(':tid', $tid);
		$stmt->bindParam(':type', $type);
		$stmt->bindParam(':class', $class);
		$stmt->bindParam(':subject', $subject);
		$stmt->bindParam(':title', $title);
		$stmt->bindParam(':upic', $userpic);
		$stmt->bindParam(':video', $video);
		$stmt->bindParam(':payment_month', $payment_month);
		$stmt->bindParam(':status', $status);


		$stmt->bindParam(':available_days', $available_days);
		$stmt->bindParam(':no_of_views_per_day', $no_of_views_per_day);


		if ($stmt->execute()) {
			$successMSG = "Your Video Lessons Successfully Submitted.";

			header("refresh:2;video_lessons.php"); // redirects image view page after 5 seconds.
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
	<title>Add Video Lessons | Teacher Panel | Online Learning Platforms </title>

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
							<h4>Add Video Lessons</h4>
						</div>
					</div>
					<div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.php">Home</a></li>
							<li class="breadcrumb-item"><a href="javascript:void(0);">Video Lessons</a></li>
							<li class="breadcrumb-item active"><a href="javascript:void(0);">Add Video Lessons</a></li>
						</ol>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-12">
						<div class="card border-0 bg-light">
							<div class="card-header">
								<h4 class="card-title">Add Video Lessons</h4>
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
													<option value="" selected>Select Teacher</option>
													<?php

													$stmt = $DB_con->prepare('SELECT * FROM lmstealmsr where tid="' . $_SESSION['tid'] . '" ORDER BY tid');

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
												<label class="form-label">Type</label>
												<select class="form-control" name="type" required>
													<option value="">Select Type </option>
													<option>Free</option>
													<option>Paid</option>
												</select>
											</div>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-12">
											<div class="form-group">
												<label class="form-label">Batch</label>
												<select class="form-control" name="class" required onChange="JavaScript:send_level(this.value);">
													<option value="" hidden="lms">Select Batch</option>
													<?php
													$stmt = $DB_con->prepare('SELECT * FROM lmsclass ORDER BY cid');
													$stmt->execute();
													if ($stmt->rowCount() > 0) {
														while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
															extract($row);
													?>
															<option value="<?php echo $row['cid']; ?>"><?php echo $row['name']; ?></option>
													<?php }
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
												<label class="form-label">Course</label>
												<span id="subject_dis">
													<select name="subject" id="" required class="form-control">
														<option hidden="yes"><?php if (isset($_GET['edit'])) {
																					echo $edit_resalt['subject'];
																				} else {
																					echo "Course Not Found";
																				} ?></option>
													</select>
												</span>
											</div>
										</div>
										<div class="col-lg-7 col-md-7 col-sm-12">
											<div class="form-group">
												<label class="form-label">Title</label>
												<input type="text" class="form-control" name="title" placeholder="Enter Title" required>
											</div>
										</div>
										<div class="col-lg-4 col-md-4 col-sm-12">
											<div class="form-group">
												<label class="form-label">Cover Image</label>
												<input type="file" class="form-control" name="user_image">
												<hr>
												<p style="font-weight:bold;color:red;">Note : "Only Upload - Jpg|Png"</p>
											</div>
										</div>
										<div class="col-lg-8 col-md-8 col-sm-12">
											<div class="form-group">
												<label class="form-label">Video URL</label>
												<input class="form-control" type="text" name="video" placeholder="Video URL" required>
											</div>
										</div>

										<div class="col-lg-2 col-md-2 col-sm-12">
											<div class="form-group">
												<label class="form-label">Available Days</label>
												<input class="form-control" type="text" name="available_days" placeholder="Available Days" required>
											</div>
										</div>

										<div class="col-lg-2 col-md-2 col-sm-12">
											<div class="form-group">
												<label class="form-label">Views Per Day</label>
												<input class="form-control" type="text" name="no_of_views_per_day" placeholder="Views Per Day" required>
											</div>
										</div>

										<div class="col-lg-3 col-md-6 col-sm-12 mb-2 d-none">
											<label class="form-label">Upload Month</label>
											<input name="payment_month" type="month" id="payment_month" class="form-control" value="<?php echo date("Y-m") ?>">
										</div>

										<div class="col-lg-2 col-md-2 col-sm-12">
											<div class="form-group">
												<label class="form-label">Status</label>
												<select class="form-control" id="input-6" name="status" required>
													<option value="1">Published</option>
													<option value="0">Unpublshed</option>
												</select>
											</div>
										</div>

										<div class="col-lg-12 col-md-12 col-sm-12">
											<input type="submit" name="add_lesson" class="btn btn-primary" value="Save changes">
											<a class="btn btn-danger" href="video_lessons.php"><i class="fa fa-times"></i> Cancel</a>
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