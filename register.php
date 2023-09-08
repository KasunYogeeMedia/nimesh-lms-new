<?php

if (!isset($_SESSION)) {
	session_start();
}
error_reporting(0);

require_once 'super_admin/conn.php';
require_once 'super_admin/config.php';
require_once 'super_admin/dbconfig4.php';



$success_msg = 0;

if (isset($_POST['register'])) {
	$stnumber = mysqli_real_escape_string($con, $_POST['stnumber']);
	$email = mysqli_real_escape_string($con, $_POST['email']);
	$dob = mysqli_real_escape_string($con, $_POST['dob']);
	$gender = mysqli_real_escape_string($con, $_POST['gender']);
	$coupon = mysqli_real_escape_string($con, $_POST['coupon']);
	// $district = mysqli_real_escape_string($con, $_POST['district']);
	//$town = mysqli_real_escape_string($con, $_POST['town']);
	$pcontactnumber = (int)mysqli_real_escape_string($conn, $_POST['contactnumber']);
	//$pemail = mysqli_real_escape_string($con, $_POST['pemail']);
	//$pname = mysqli_real_escape_string($con, $_POST['pname']);
	$fullname = mysqli_real_escape_string($con, $_POST['fullname']);
	$address = mysqli_real_escape_string($con, $_POST['address']);
	$contactnumber = (int)mysqli_real_escape_string($conn, $_POST['contactnumber']);
	$to = "0" . (int)mysqli_real_escape_string($conn, $_POST['contactnumber']);
	$level = mysqli_real_escape_string($conn, $_POST['level']);
	$password = md5(mysqli_real_escape_string($con, $_POST['contactnumber']));
	$re_password = md5(mysqli_real_escape_string($con, $_POST['contactnumber']));

	if ($password == $re_password) {

		$amilack_mobile_qury = mysqli_query($con, "SELECT * FROM lmsregister WHERE contactnumber='$contactnumber'");
		if (mysqli_num_rows($amilack_mobile_qury) > 0) {
			//user allready
			$success_msg = 1;
		} else {
			//pass
			if (mysqli_query($con, "INSERT INTO lmsregister (stnumber,coupon,email,dob,gender,fullname,contactnumber,school,address, level,password, image, add_date, status, ip_address, relogin, reloging_ip, payment, verifycode) VALUES ('$stnumber','$coupon','$email','$dob','$gender','$fullname','$contactnumber',school,'$address', '$level','$password','', CURRENT_TIMESTAMP, '0', '', '0', '0', '0', '')")) {

				if (!empty($_POST['subjects'])) {
					foreach ($_POST['subjects'] as $subject_id) {
						mysqli_query($conn, "INSERT INTO lmsreq_subject(sub_req_reg_no, sub_req_sub_id) VALUES ('$contactnumber','$subject_id')");
					}
				}

				$to = "+94" . (int)mysqli_real_escape_string($conn, $_POST['contactnumber']);
				$message_text = "Congratulations on joining Atlas Learn! To log in please use the below details.\nUser name: $_POST[contactnumber]\npassword: $_POST[contactnumber]\n";
				$message = urlencode($message_text);
				//send_sms($to, $message_text);

				echo "<img src=''>";

				echo "<script>window.location='login.php?success';</script>";
			} else {
				//error
				$success_msg = 3;
			}
		}
	} else {
		//password error
		$success_msg = 2;
	}
}

?>

<!doctype html>
<html lang="en">

<head>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="author" content="Sadegh Rastgoo" />
	<title>Register</title>
	<link rel="stylesheet" href="node_modules/normalize.css/normalize.css" />

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
</head>

<body class="reg-page">
	<div class="background">
		<video class="background--vid" src="files/video-bg.mp4" autoplay muted loop></video>
	</div>
	<main>
		<div class="card__image-container">
			<div class="slide-images reg">
				<img class="slide" src="assets/img/slide1.png" alt="Card Image" />
				<img class="slide" src="assets/img/slide2.png" alt="Card Image" />
				<img class="slide" src="assets/img/slide3.png" alt="Card Image" />
			</div>
		</div>
		<form method="POST" id="myform">
			<?php if ($success_msg == 1) { ?><div class="alert alert-warning" role="alert">Sorry! You are already registered.</div><?php } ?>
			<?php if ($success_msg == 2) { ?><div class="alert alert-danger" role="alert">Error! The Re-Enter Password you entered does not match.</div><?php } ?>
			<?php if ($success_msg == 3) { ?><div class="alert alert-danger" role="alert">Error! Your entered details something is wrong. Please try again.</div><?php } ?>
			<?php if (isset($_GET['success'])) { ?><div class="alert alert-success" role="alert"> Thanks for registering! Sign in now and start learning right away! </div><?php } ?>
			<h2 class="heading-text">Sign Up</h2>

			<div class="inp-1">
				<i class="far fa fa-envelope fa-lg"></i>
				<input name="email" type="text" placeholder="Enter Your Email" value="<?php if (isset($_POST['email'])) {
																							echo $_POST['email'];
																						} ?>">
			</div>
			<div class="inp-1">
				<i class="fas fa fa-user fa-lg"></i>
				<input name="fullname" required type="text" placeholder="Enter Full Name" value="<?php if (isset($_POST['fullname'])) {
																										echo $_POST['fullname'];
																									} ?>">
			</div>
			<div class="inp-1">
				<i class="fas fa fa-phone fa-lg"></i>
				<input name="contactnumber" type="text" required placeholder="Enter Phone Number" value="<?php if (isset($_POST['contactnumber'])) {
																												echo $_POST['contactnumber'];
																											} ?>" maxlength="10" minlength="10">
			</div>
			<div class="inp-1">
				<i class="fas fa fa-birthday-cake fa-lg"></i>
				<input name="dob" required type="date" placeholder="Enter Your Birthday" value="<?php if (isset($_POST['dob'])) {
																									echo $_POST['dob'];
																								} ?>">
			</div>
			<div class="inp-1">
				<i class="fas fa fa-graduation-cap fa-lg"></i>
				<span id="class_load">
					<select name="level" required id="class_val" onChange="JavaScript:select_subject(this.value);" style="width:100%;">
						<option value="" hidden="yes">Select Batch</option>
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
				</span>
				<script>
					function select_subject(sub_val) {
						var xhttp = new XMLHttpRequest();
						xhttp.onreadystatechange = function() {
							if (this.readyState == 4 && this.status == 200) {
								document.getElementById("sub_load").innerHTML = this.responseText;
							}
						};
						xhttp.open("GET", "sub_load.php?cid=" + sub_val, true);
						xhttp.send();
					}
				</script>
			</div>
			<div class="inp-1">
				<!-- <i class="fas fa-unlock-alt fa-lg"></i> -->
				<div id="sub_load" class="text-light">
					<!-- Course Not Found	 -->
				</div>
			</div>
			<div class="inp-1 d-none">
				<i class="fas fa fa-globe fa-lg"></i>
				<select name="district" required>
					<option value="Ampara">Ampara</option>
					<option value="Anuradhapura">Anuradhapura</option>
					<option value="Badulla">Badulla</option>
					<option value="Batticaloa">Batticaloa</option>
					<option value="Colombo">Colombo</option>
					<option value="Galle">Galle</option>
					<option value="Gampaha">Gampaha</option>
					<option value="Hambantota">Hambantota</option>
					<option value="Jaffna">Jaffna</option>
					<option value="Kalutara">Kalutara</option>
					<option value="Kandy">Kandy</option>
					<option value="Kegalle">Kegalle</option>
					<option value="Kilinochchi">Kilinochchi</option>
					<option value="Kurunegala">Kurunegala</option>
					<option value="Mannar">Mannar</option>
					<option value="Matale">Matale</option>
					<option value="Matara">Matara</option>
					<option value="Monaragala">Monaragala</option>
					<option value="Mullaitivu">Mullaitivu</option>
					<option value="Nuwara-Eliya">Nuwara Eliya</option>
					<option value="Polonnaruwa">Polonnaruwa</option>
					<option value="Puttalam">Puttalam</option>
					<option value="Ratnapura">Ratnapura</option>
					<option value="Trincomalee">Trincomalee</option>
					<option value="Vavuniya">Vavuniya</option>
				</select>
			</div>
			<div class="inp-1 d-none">
				<i class="fas fa fa-user fa-lg"></i>
				<select name="gender" required>
					<option selected value="none">Not Selected</option>
					<option value="male">Male</option>
					<option value="female">Female</option>
				</select>
			</div>
			<div class="inp-1">
				<i class="far fa fa-map-marker fa-lg"></i>
				<input name="address" type="text" placeholder="Enter Address here">
			</div>
			<div class="inp-1">
				<i class="far fa fa-id-card fa-lg"></i>
				<input name="coupon" type="text" placeholder="You have Coupon Code">
			</div>
			<div class="inp-1">
				<?php
				$code_feed = "0123456789";
				$code_length = 5;  // Set this to be your desired code length
				$final_code = "";
				$feed_length = strlen($code_feed);

				for ($i = 0; $i < $code_length; $i++) {
					$feed_selector = rand(0, $feed_length - 1);
					$final_code .= substr($code_feed, $feed_selector, 1);
				}

				?>
				<i class="far fa fa-id-card fa-lg"></i>
				<input name="stnumber" required type="text" value="<?php echo $reg_prefix; ?>-<?php echo $final_code; ?>" readonly>
			</div>

			<div class="inp-1 d-none">
				<i class="fas fa fa-phone fa-lg"></i>
				<input name="pcontactnumber" type="text" placeholder="Enter Parent Phone Number" maxlength="10" minlength="10">
			</div>
			
			<div class="inp-2">
				<input type="checkbox" name="agree" id="agree_checkbox" value="yes" />
				<label for="inp--checkbox">By creating an account, you agree to the Terms & Canditions and
					Privacy Policy and allow my child to be enrolled onto the platform
				</label>
			</div>
			<!-- <input type="submit" class="custom-btn btn-13" value="Create Account" /> -->
			<button type="submit" name="register" class="custom-btn btn-13">Create Account</button>

			<a class="areu" href="login.php">Already have an account?</a>
		</form>
	</main>
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<!-- Bootstrap Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>

</html>