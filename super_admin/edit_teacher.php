<?php

if (!isset($_SESSION)) {
	session_start();
}

require_once 'includes.php';

require_once '../super_admin/conn.php';

require_once '../super_admin/dbconfig4.php';

$error_png = 0;

if (isset($_GET['edit'])) {

	$edit = mysqli_real_escape_string($conn, $_GET['edit']);
	$edit_qury = mysqli_query($conn, "SELECT * FROM lmstealmsr WHERE tid='$edit'");
	$edit_resalt = mysqli_fetch_array($edit_qury);

	if ($edit_resalt['image'] == "") {
		$image_path = "../profile/images/hd_dp.jpg";
	} else {
		$image_path = "images/teacher/" . $edit_resalt['image'];
	}
}

if (isset($_POST['update_bt'])) {

	$fullname = mysqli_real_escape_string($conn, $_POST['fullname']);
	$address = mysqli_real_escape_string($conn, $_POST['address']);
	$contactnumber = (int)mysqli_real_escape_string($conn, $_POST['contactnumber']);
	// $subdetails = mysqli_real_escape_string($conn, $_POST['subdetails']);
	// $qualification = mysqli_real_escape_string($conn, $_POST['qualification']);
	$username = mysqli_real_escape_string($conn, $_POST['username']);
	// $Percentage = mysqli_real_escape_string($conn, $_POST['Percentage']);

	if ($_POST['password'] == "") {
		$password = $edit_resalt['password'];
	} else {
		$password = md5(mysqli_real_escape_string($conn, $_POST['password']));
	}


	$systemid = $edit_resalt['systemid'];


	if (!$_FILES['image']['name'] == "") {

		if ($_FILES['image']['type'] == "image/jpeg") {
			$imagename = time() . $_FILES['image']['name'];
			$source = $_FILES['image']['tmp_name'];
			$target = "images/teacher/" . str_replace(" ", "_", $imagename);
			$db_send_name = str_replace(" ", "_", $imagename);
			move_uploaded_file($source, $target);

			$imagepath = $imagename;
			$save = "images/teacher/" . $imagepath; //This is the new file you saving
			$file = "images/teacher/" . $imagepath; //This is the original file

			list($width, $height) = getimagesize($file);

			$modwidth = 300;

			$diff = $width / $modwidth;

			$modheight = $height / $diff;
			$tn = imagecreatetruecolor($modwidth, $modheight);
			$image = imagecreatefromjpeg($file);
			imagecopyresampled($tn, $image, 0, 0, 0, 0, $modwidth, $modheight, $width, $height);

			imagejpeg($tn, $save, 100);
		} else {
			$db_send_name = $edit_resalt['image'];
			$error_png = 1;
		}
	} else {
		$db_send_name = $edit_resalt['image'];
	}


	if (!empty($_POST['lavel'])) {
		mysqli_query($conn, "DELETE FROM lmstealmsr_multiple WHERE tealmsr_system_id='$systemid' and tealmsr_type='2'");
		foreach ($_POST['lavel'] as $lavel) {
			mysqli_query($conn, "INSERT INTO lmstealmsr_multiple(tealmsr_system_id, tealmsr_type, tealmsr_contain_id) VALUES ('$systemid','2','$lavel')");
		}
	}

	if (!empty($_POST['subject'])) {
		mysqli_query($conn, "DELETE FROM lmstealmsr_multiple WHERE tealmsr_system_id='$systemid' and tealmsr_type='3'");
		foreach ($_POST['subject'] as $subject) {
			mysqli_query($conn, "INSERT INTO lmstealmsr_multiple(tealmsr_system_id, tealmsr_type, tealmsr_contain_id) VALUES ('$systemid','3','$subject')");
		}
	}

	if (mysqli_query($conn, "UPDATE lmstealmsr SET fullname='$fullname',address='$address',contactnumber='$contactnumber',username='$username',password='$password',image='$db_send_name' WHERE tid='$edit'")) {
		echo "<script>window.location='edit_teacher.php?edit=$edit&succes&jpg=$error_png';</script>";
	} else {
		echo "<script>window.location='edit_teacher.php?edit=$edit&fail';</script>";
	}
}
?>

<!DOCTYPE html>
<html lang="en">

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>Edit Teacher | Online Learning Platforms | Dashboard</title>
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
							<h4>Edit Teacher</h4>
						</div>
					</div>
					<div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.php">Home</a></li>
							<li class="breadcrumb-item active"><a href="teachers.php">Teacher</a></li>
							<li class="breadcrumb-item active"><a href="edit_teacher.php">Edit Teacher</a></li>
						</ol>
					</div>
				</div>

				<div class="row">
					<div class="col-xl-12 col-xxl-12 col-sm-12">
						<div class="card border-0 bg-light">
							<div class="card-header">
								<h5 class="card-title">Edit Teacher</h5>
							</div>
							<div class="card-body">
								<?php if (isset($_GET['succes'])) { ?>
									<div class="alert alert-success alert-dismissible alert-alt solid fade show">
										<button type="button" class="close h-100" data-dismiss="alert" aria-label="Close"><span><i class="mdi mdi-close"></i></span></button>
										<strong>Success!</strong> Teacher details update successfully.
									</div>
								<?php } ?>
								<?php if (isset($_GET['fail'])) { ?>
									<div class="alert alert-danger alert-dismissible alert-alt solid fade show">
										<button type="button" class="close h-100" data-dismiss="alert" aria-label="Close"><span><i class="mdi mdi-close"></i></span></button>
										<strong>Error!</strong> Teacher details update fail. your enter detais allreday use.
									</div>
								<?php } ?>

								<form method="POST" enctype="multipart/form-data">
									<div class="row">
										<div class="col-lg-3 col-md-3 col-sm-12">
											<div class="form-group">
												<label class="form-label">Profile Photo</label>
												<p style="color:red;">Only JPG</p>
												<label for="fileName"><img src="<?php echo $image_path; ?>" id="yourImgTag" class="pro_pick"></label>
												<input type="file" name="image" id="fileName" hidden="lms" onChange="dis_name();">

												<script>
													function dis_name() {
														var input = document.getElementById("fileName");
														var fReader = new FileReader();
														fReader.readAsDataURL(input.files[0]);
														fReader.onloadend = function(event) {
															var img = document.getElementById("yourImgTag");
															img.src = event.target.result;
														}
													}
												</script>
											</div>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-12">
											<div class="form-group">
												<label class="form-label">Full Name</label>
												<input type="text" class="form-control" name="fullname" value="<?php echo $edit_resalt['fullname']; ?>" required>
											</div>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-12">
											<div class="form-group">
												<label class="form-label">Contact Number</label>
												<input type="tel" name="contactnumber" class="form-control" pattern="\d*" value="<?php echo "0" . $edit_resalt['contactnumber']; ?>" required>
											</div>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-12">
											<div class="form-group">
												<label class="form-label">Address</label>
												<input type="text" name="address" class="form-control" value="<?php echo $edit_resalt['address']; ?>" required>
											</div>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-12 d-none">
											<div class="form-group">
												<label class="form-label">Course Details</label>
												<input type="text" name="subdetails" class="form-control" value="<?php echo $edit_resalt['subdetails']; ?>">
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-sm-12 d-none">
											<div class="form-group">
												<label class="form-label">Qualification</label>
												<input type="text" name="qualification" class="form-control" value="<?php echo $edit_resalt['qualification']; ?>">
											</div>
										</div>
										<div class="col-lg-2 col-md-2 col-sm-12 d-none">
											<div class="form-group">
												<label class="form-label">Percentage (%)</label>
												<input type="text" name="Percentage" class="form-control" pattern="\d*" value="<?php echo $edit_resalt['Percentage']; ?>">
											</div>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-12">
											<div class="form-group">
												<label class="form-label">Batch</label>
												<table>
													<tbody>
														<?php
														$level_qury = mysqli_query($conn, "SELECT * FROM lmsclass ORDER BY name");
														while ($level_resalt = mysqli_fetch_array($level_qury)) {

															$lmsck_level_val = 0;
															$lmsck_level = mysqli_query($conn, "SELECT * FROM lmstealmsr_multiple WHERE tealmsr_system_id='$edit_resalt[systemid]' and tealmsr_type='2' and tealmsr_contain_id='$level_resalt[cid]'");
															if (mysqli_num_rows($lmsck_level) > 0) {
																$lmsck_level_val = 1;
															}
														?>
															<tr valign="middle">
																<td style="width: 20px;"><input type="checkbox" name="lavel[]" <?php if ($lmsck_level_val == 1) {
																																	echo "checked";
																																} ?> id="<?php echo "level" . $level_resalt['cid']; ?>" value="<?php echo $level_resalt['cid']; ?>"></td>
																<td><label for="<?php echo "level" . $level_resalt['cid']; ?>"><?php echo $level_resalt['name']; ?></label></td>
															</tr>
														<?php
														}
														?>
													</tbody>
												</table>
											</div>
										</div>
										<div class="col-lg-4 col-md-4 col-sm-12">
											<div class="form-group">
												<label class="form-label">Course</label>
												<table>
													<tbody>
														<?php
														$subject_qury = mysqli_query($conn, "SELECT * FROM lmssubject ORDER BY name");
														while ($subject_resalt = mysqli_fetch_array($subject_qury)) {

															$lmsck_subject_val = 0;
															$lmsck_subject = mysqli_query($conn, "SELECT * FROM lmstealmsr_multiple WHERE tealmsr_system_id='$edit_resalt[systemid]' and tealmsr_type='3' and tealmsr_contain_id='$subject_resalt[sid]'");
															if (mysqli_num_rows($lmsck_subject) > 0) {
																$lmsck_subject_val = 1;
															}
														?>
															<tr valign="middle">
																<td style="width: 20px;"><input type="checkbox" name="subject[]" <?php if ($lmsck_subject_val == 1) {
																																		echo "checked";
																																	} ?> id="<?php echo "subject" . $subject_resalt['sid']; ?>" value="<?php echo $subject_resalt['sid']; ?>"></td>
																<td><label for="<?php echo "subject" . $subject_resalt['sid']; ?>"><?php echo $subject_resalt['name']; ?> - [<?php

																																												$id = $subject_resalt['class_id'];

																																												$query = $DB_con->prepare('SELECT name FROM lmsclass WHERE cid=' . $id);

																																												$query->execute();

																																												$result = $query->fetch();

																																												echo $result['name'];

																																												?>]</label></td>
															</tr>
														<?php
														}
														?>
													</tbody>
												</table>
											</div>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-12">
											<div class="form-group">
												<label class="form-label">User Name (Email Address)</label>
												<input type="email" name="username" class="form-control" value="<?php echo $edit_resalt['username']; ?>" required>
											</div>
										</div>
										<div class="col-lg-2 col-md-2 col-sm-12">
											<div class="form-group">
												<label class="form-label">Password</label>
												<input type="password" name="password" class="form-control" value="<?php echo $edit_resalt['password']; ?>" required>
											</div>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12">
											<input type="submit" name="update_bt" class="btn btn-primary" value="Update">
											<a class="btn btn-light" href="teachers.php"><i class="fa fa-times"></i> Close</a>
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