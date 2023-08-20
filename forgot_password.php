<?php

if (!isset($_SESSION)) {
	session_start();
}
error_reporting(0);

require_once 'super_admin/conn.php';
require_once 'super_admin/config.php';
require_once 'super_admin/dbconfig4.php';

if (isset($_SESSION["reid"])) {

	$image_qury = mysqli_query($conn, "SELECT * FROM lmsregister WHERE reid='" . $_SESSION["reid"] . "'");
	$image_resalt = mysqli_fetch_array($image_qury);

	$fullname = $image_resalt['fullname'];

	if ($image_resalt['image'] == "") {
		$dis_image_path = "profile/images/hd_dp.jpg";
	} else {
		$dis_image_path = "profile/uploadImg/" . $image_resalt['image'];
	}
}

$code = rand(1000, 9999);

$veryfy = 0;
$status = "";
if (isset($_POST['send_code'])) {
	$contactnumber = (int)mysqli_real_escape_string($conn, $_POST['contactnumber']);
	$to = "+94" . (int)mysqli_real_escape_string($conn, $_POST['contactnumber']);
	$_SESSION['contactnumber'] = $contactnumber;

	if (mysqli_query($conn, "UPDATE lmsregister SET verifycode='$code' WHERE contactnumber='$contactnumber'")) {
		$message_text = "To reset Atlas Learn password please use the below code:$code";
		$message = urlencode($message_text);

		send_sms($to, $message_text);

		echo "<img src=''>";

		$veryfy = 1;
	}
}

if (isset($_POST['veryfy_bt'])) {
	if (isset($_SESSION['contactnumber'])) {
		$verifycode = mysqli_real_escape_string($conn, $_POST['verifycode']);
		$check_qury = mysqli_query($conn, "SELECT * FROM lmsregister WHERE contactnumber='$_SESSION[contactnumber]' and verifycode!=''");
		if (mysqli_num_rows($check_qury) > 0) {
			$check_realt = mysqli_fetch_array($check_qury);
			if ($check_realt['verifycode'] == $verifycode) {
				$veryfy = 2;
			} else {
				$status = "code_error";
				$veryfy = 1;
			}
		} else {
			$status = "no_user";
			$veryfy = 1;
		}
	} else {
		echo "<script>window.location='forgot_password.php';</script>";
	}
}

if (isset($_POST['change_pass'])) {
	$password = md5(mysqli_real_escape_string($conn, $_POST['password']));
	$re_password = md5(mysqli_real_escape_string($conn, $_POST['re_password']));

	if ($password == $re_password) {
		if (mysqli_query($conn, "UPDATE lmsregister SET password='$password' WHERE contactnumber='$_SESSION[contactnumber]'")) {

			mysqli_query($conn, "UPDATE lmsregister SET verifycode='' WHERE contactnumber='$_SESSION[contactnumber]'");

			unset($_SESSION['contactnumber']);

			echo "<script>window.location='login.php?change_pass_success';</script>";
		}
	} else {
		$status = "re_pass_error";
		$veryfy = 2;
	}
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="author" content="Sadegh Rastgoo" />
	<title>Frogot Password</title>
	<link rel="stylesheet" href="node_modules/normalize.css/normalize.css" />
	<link rel="stylesheet" href="./assets/css/stylesm.css">

	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<!-- Fonts -->
	<link rel="preconnect" href="https://fonts.gstatic.com" />
	<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@200;400;700&display=swap" rel="stylesheet" />
	<script src="https://kit.fontawesome.com/8e9390d601.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css" />
	<!-- Fonts -->
	<link rel="icon" href="assets/img/favicon.png" />
	<link rel="stylesheet" href="assets/css/log-styles.css" />
	<!-- font-awesome -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

	<style>
		.phone_val {
	padding-left: 20px !important;
}
	</style>
</head>

<body>
	<div class="background">
		<video class="background--vid" src="files/video-bg.mp4" autoplay muted loop></video>
	</div>
	<main>
		<div class="card__image-container">
			<div class="slide-images">
				<img class="slide" src="assets/img/slide1.png" alt="Card Image" />
				<img class="slide" src="assets/img/slide2.png" alt="Card Image" />
				<img class="slide" src="assets/img/slide3.png" alt="Card Image" />
			</div>
		</div>
		<!-- Signup Start -->

		<?php if ($veryfy == 0) { ?>

			<form method="POST">
				<h2>Forgot Password</h2>
				<div class="row">
					<div class="col-lg-12">
						<div class="single-form">
							<label class="lbltext">Phone Number</label>
							<input name="contactnumber" type="text" class="form-control phone_val" required="" placeholder="Your Phone Number" maxlength="10" minlength="10">
						</div>
					</div>
					<div class="col-lg-12">

						<div class="single-form">
							<!-- <input type="submit"  value="Send" class="btn btn-primary btn-block" style="background:#28a745;color:#ffffff;"> -->
							<button name="send_code" type="submit" class="custom-btn btn-13">Send</button>
						</div>
					</div>
					<a class="areu" href="login.php">Back to Login</a>
				</div>
			</form>
		<?php } ?>
		<?php if ($veryfy == 1) { ?>
			<form method="POST">
				<h2>Enter the Verification Code</h2>
				<?php if ($status == "code_error") { ?><div class="alert alert-danger">Fail! Verification code is not match, please try again.</div><?php } ?>
				<?php if ($status == "no_user") { ?><div class="alert alert-danger">Fail! User not valid, please try again.</div><?php } ?>
				<div class="row">
					<div class="col-lg-12">
						<div class="single-form">
							<label class="lbltext">Verification Code</label>
							<input name="verifycode" type="text" class="form-control phone_val" required placeholder="****" pattern="\d*" maxlength="4" minlength="4">
						</div>
					</div>
					<div class="col-lg-12">
						<div class="single-form">
							<!-- <input type="submit" name="veryfy_bt" value="" class="btn btn-primary btn-block" style="background:#28a745;color:#ffffff;"> -->
							<button name="veryfy_bt" type="submit" class="custom-btn btn-13">Verify</button>
						</div>
					</div>
				</div>
				<a class="areu" href="login.php">Back to Login</a>
			</form>
		<?php } ?>

		<?php if ($veryfy == 2) { ?>
			<form method="POST">
				<h2>Change Password</h2>
				<?php if ($status == "re_pass_error") { ?><div class="alert alert-danger">Fail! Re-enter Password not match, please try again.</div><?php } ?>
				<div class="row">
					<div class="col-lg-12">
						<div class="single-form">
							<label class="lbltext">New Password</label>
							<input name="password" id="username" type="password" class="form-control phone_val" required minlength="8">
						</div>
					</div>

					<div class="col-lg-12">
						<div class="single-form">
							<label class="lbltext">Re-Enter Password</label>
							<input name="re_password" id="username" type="password" class="form-control phone_val" required minlength="8">
						</div>
					</div>
					<div class="col-lg-12">
						<div class="single-form">
							<!-- <input type="submit" name="" value="" class="btn btn-primary btn-block" style="background:#28a745;color:#ffffff;"> -->
							<button name="change_pass" type="submit" class="custom-btn btn-13">Change Password</button>
						</div>
					</div>
				</div>
				<a class="areu" href="login.php">Back to Login</a>
			</form>

		<?php } ?>



		<!-- Signup End -->
	</main>
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<!-- Bootstrap Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>

</html>