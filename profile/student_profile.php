<?php

session_start();

//$success_payment = $_SESSION['success'];


$a = time() + 60 * 60 * 24 * 30;

$exp_date = date("Y-m-d", $a);

require_once("../super_admin/config.php");

require_once '../super_admin/dbconfig4.php';

include '../super_admin/conn.php';

if (!isset($_SESSION['reid'])) {

	header('location:../login.php');

	die();
}

class imageUpload

{

	var $name = '';

	var $upload_path = '../uploads/images/';

	var $max_file_size = 5000000;



	function __construct($name)

	{

		$this->name = $name;
	}

	private function checkExt($ext)

	{

		if ($ext != "jpg" && $ext != "png" && $ext != "jpeg" && $ext != "gif") {

			return 0;
		} else {

			return 1;
		}
	}

	private function checkFileSize($size)

	{

		if ($size > $this->max_file_size) {

			return 0;
		} else {

			return 1;
		}
	}

	private function clearImageName($string, $separator = '-')

	{

		$accents_regex = '~&([a-z]{1,2})(?:acute|cedil|circ|grave|lig|orn|ring|slash|th|tilde|uml);~i';

		$special_cases = array('&' => 'and', "'" => '');

		$string = mb_strtolower(trim($string), 'UTF-8');

		$string = str_replace(array_keys($special_cases), array_values($special_cases), $string);

		$string = preg_replace($accents_regex, '$1', htmlentities($string, ENT_QUOTES, 'UTF-8'));

		$string = preg_replace("/[^a-z0-9]/u", "$separator", $string);

		$string = preg_replace("/[$separator]+/u", "$separator", $string);

		return $string;
	}

	function generateRandomString($length = 10)
	{
		$characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
		$charactersLength = strlen($characters);
		$randomString = '';
		for ($i = 0; $i < $length; $i++) {
			$randomString .= $characters[rand(0, $charactersLength - 1)];
		}
		return $randomString;
	}

	public function setUploadPath($path)

	{

		$this->upload_path = $path;
	}

	public function setMaxfileSize($size)

	{

		$this->max_file_size = $size;
	}

	public function upload()

	{

		$img = basename($_FILES[$this->name]["name"]);

		$ext = pathinfo($img, PATHINFO_EXTENSION);

		$name = pathinfo($img, PATHINFO_FILENAME);

		$size = $_FILES[$this->name]["size"];

		if (!$this->checkExt($ext) || !$this->checkFileSize($size) || !getimagesize($_FILES[$this->name]["tmp_name"])) {

			return 0;
		} else {

			//$img_name = random_string(50);

			$img_name = $this->generateRandomString();

			$img_name = $img_name . '.' . $ext;

			$img_path = $this->upload_path . $img_name;

			//echo $img_path;



			if (move_uploaded_file($_FILES[$this->name]["tmp_name"], $img_path)) {

				return $img_name;
			} else {

				return 0;
			}
		}
	}
}

$image_qury = mysqli_query($conn, "SELECT * FROM lmsregister WHERE reid='" . $_SESSION['reid'] . "'");

$image_resalt = mysqli_fetch_array($image_qury);

$edit_qury = mysqli_query($conn, "SELECT * FROM lmsregister WHERE reid='" . $_SESSION['reid'] . "'");
$edit_resalt = mysqli_fetch_array($edit_qury);


if ($image_resalt['image'] == "") {

	$dis_image_path = "images/hd_dp.jpg";
} else {

	$dis_image_path = "uploadslip/" . $image_resalt['image'];
}

$user_qury = mysqli_query($conn, "SELECT * FROM lmsregister WHERE reid='$_SESSION[reid]'");

$user_resalt = mysqli_fetch_array($user_qury);

if (isset($_POST['submit_bt'])) {

	date_default_timezone_set("Asia/Colombo");

	$change_name = time();

	$upload_path = "uploadslip/";

	$upload_file = $upload_path . basename($change_name . $_FILES["fileName"]["name"]);

	$upload_real = str_replace(" ", "_", $upload_file);


	$img = new imageUpload("fileName");
	$img->setUploadPath("uploadslip/");

	if (!$database_name = $img->upload()) {

		$error = "Please check again your file!";
	}

	$created_at = date("Y-m-d H:i:s");



	foreach ($_POST['select_payment'] as $select_payment) {

		//echo $select_payment;
		$pay_type = $_POST['paymonth'];
		$select_payment = explode(",", $select_payment); //teacher id,subject id, amount
		if ($_POST['paymonth'] == 'half') {
			$sql = "SELECT * FROM lmspayment WHERE pay_type ='half' AND userID=" . $_SESSION['reid'] . " ";
		} else {
			$sql = "SELECT * FROM lmspayment WHERE pay_type ='full' AND userID=" . $_SESSION['reid'] . " ";
		}


		$query = mysqli_query($conn, $sql);

		if (mysqli_fetch_array($query)) {

			$R = mysqli_fetch_array($query);

			if ($R['status'] == 1) {

				$error = "ඔබ දැනටමත් මෙම මාසය සදහා පන්ති ගාස්තු ගෙවා ඇත!!";
			} else {

				$error = "අපගේ පද්ධතියේ දත්ත අනුව ඔබ දැනටමත් මෙම මාසය සදහා පන්ති ගාස්තු ගෙවා ඇත. එය තහවුරු කල සැනින් ඔබට දැනුම් දෙනු ඇත";
			}
		}

		if (!isset($error)) {

			$sql = "INSERT INTO lmspayment (`fileName`, `userID`, `feeID`, `pay_sub_id`, `amount`, `accountnumber`, `bank`, `branch`, `paymentMethod`, `created_at`, `session_id`, `status`, `order_status`,`pay_type`)

				VALUES ('$database_name', '$_SESSION[reid]', '$select_payment[0]', '$select_payment[1]', '$select_payment[2]', '0', 'Pay Bank', 'Online Class', 'Bank', '$created_at', '0', '0', '0' , '" . $pay_type . "')";

			//echo $sql;exit;

			mysqli_query($conn, $sql);
		} else {

			header("location:student_profile.php?error='" . $error);
			die();
		}
	}

	echo "<script>window.location='student_profile.php?payed';</script>";
}


// if (isset($_POST['change_password'])) {

// 	$old_password = md5(mysqli_real_escape_string($con, $_POST['old_password']));
// 	$password = md5(mysqli_real_escape_string($con, $_POST['password']));
// 	$re_password = md5(mysqli_real_escape_string($con, $_POST['re_password']));


// 	if ($old_password == $edit_resalt['password']) {

// 		if ($password == $re_password) {
// 			mysqli_query($con, "UPDATE lmsregister SET password='$password' WHERE reid='$user_id'");
// 			echo "<script>window.location='logout.php';</script>";
// 		} else {
// 			//re pass not match
// 			echo "<script>window.location='student_profile.php?re_pass#pass_dis';</script>";
// 		}

// 	} else {
// 		//current password not match
// 		echo "<script>window.location='student_profile.php?current_pass#pass_dis';</script>";

// 	}
// }

?>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, shrink-to-fit=9">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>My Profile | Online Learning Platforms | Student Panel</title>
	<?php
	require_once 'headercss.php';
	?>
</head>

<body>

	<?php
	// require_once 'header.php';
	?>

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

				<!-- content start -->
				<div class="alert-sec">

					<?php if (isset($_GET['success'])) { ?>

						<div class="alert alert-success" role="alert">
							<i class="fa fa-check-circle"></i> Card Payment මගින් ඔබ සාර්ථකව පන්ති ගාස්තු ගෙවා ඇත !!
						</div>

					<?php } else if (isset($fail)) { ?>
						<div class="alert alert-danger" role="alert">
							<i class="fa fa-times-circle"></i> Card Payment Fail !!
						</div>

					<?php }
					unset($_SESSION["success"]);
					unset($_SESSION["fail"]);
					?>

					<?php if (isset($_GET['payed'])) { ?>

						<div class="alert alert-success" role="alert">

							<i class="fa fa-check-circle"></i> ඔබගේ බැංකු රිසිට්පත ඔබ සාර්ථකව UPLOAD කරන ලදී.එය අනුමත වූ විට ඔබට SMS එකක් මගින් දැනුම් දෙනු ඇත !!

						</div>

					<?php } ?>

					<?php if (isset($_GET['error'])) { ?>

						<div class="alert alert-danger" role="alert">

							<i class="fa fa-times-circle"></i> <?php echo htmlspecialchars($_GET['error']); ?>

						</div>

					<?php } ?>

				</div>

				<div class="wel_sec bg-primary mb-3">
					<div class="row">
						<div class="col-sm-6 col-md-6 col-lg-6 col-xl-5 my-auto">

							<?php

							$reid = $_SESSION['reid'];

							$stmt = $DB_con->prepare('SELECT * FROM lmsregister where reid="' . $reid . '"');

							$stmt->execute();

							if ($stmt->rowCount() > 0) {

								while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {

									extract($row);

									$reg_id = $row["contactnumber"];

							?>
									<div class="left_sec py-4 px-5">
										<h2 class="text-light fw-bold">Welcome Back, <?php echo $row['fullname']; ?></h2>
										<p class="text-light mt-3 desc">You’ve learned 70% of your goal this week!
											Keep it up and improve your progress.</p>
									</div>
							<?php

								}
							}

							?>
						</div>
						<div class="col-md-1 col-lg-2 col-xl-3 d-none d-xl-inline"></div>
						<div class="col-sm-6 col-md-5 col-lg-4 col-xl-3 my-auto">
							<div class="left_sec text-center">
								<img class="w-100 right_img" src="../assets/img/Humaaans_Space.png" alt="">
							</div>
						</div>
					</div>
				</div>

				<!-- profile section start -->
				<div class="profile mb-3">
					<div class="card border-0 bg-light py-3">
						<div class="card-body">
							<p class="h6 mb-3 fw-bold">Edit My Profile</p>
							<?php

							$reid = $_SESSION['reid'];

							$stmt = $DB_con->prepare('SELECT * FROM lmsregister where reid="' . $reid . '"');

							$stmt->execute();

							if ($stmt->rowCount() > 0) {

								while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {

									extract($row);

									$reg_id = $row["contactnumber"];

							?>
									<div class="row">
										<div class="col-3">
											<?php if ($row['image'] == "") {
												$pro_img = "images/hd_dp.jpg";
											} else {
												$pro_img = "uploadImg/" . $row['image'];
											} ?>
											<div class="profile-img">
												<img src="<?php echo $pro_img; ?>" alt="" class="d-block mx-auto w-50 h-auto">
											</div>

										</div>
										<div class="col-9">
											<div class="about">
												<div class="row">
													<div class="col about-title fw-bold">About Me:</div>
												</div>
												<div class="row">
													<div class="col about-description">Hi I'm <?php echo $row['fullname']; ?>, has been the
														industry's standard dummy text ever since the 1500s, when an unknown printer took a
														galley of type.</div>
												</div>
												<div class="row">
													<div class="col-2 about-title pt-3 fw-bold">Full Name:</div>
													<div class="col-10 pt-3"><?php echo $row['fullname']; ?></div>
												</div>
												<div class="row">
													<div class="col-2 about-title pt-3 fw-bold">Mobile:</div>
													<div class="col-10 pt-3">+94 <?php echo $row['contactnumber']; ?></div>
												</div>
												<div class="row">
													<div class="col-2 about-title pt-3 fw-bold">Email:</div>
													<div class="col-10 pt-3"><?php echo $row['email']; ?></div>
												</div>
												<div class="row">
													<div class="col-2 about-title pt-3 fw-bold">Location:</div>
													<div class="col-10 pt-3"><?php echo $row['town']; ?></div>
												</div>
											</div>
										</div>
									</div>

							<?php

								}
							}

							?>
						</div>
					</div>
				</div>
				<!-- profile section end -->
				<!-- Password section -->
				<!-- <div class="profile mb-3">
					<div class="card border-0 bg-light py-3">
						<div class="card-body">
							<p class="h6 mb-3 fw-bold">Update Your Password</p>
							<form method="post">
								<div class="row">
									<div class="col-sm-6">
										<div class="px-3 py-2">
											<label class="form-label">Old Password</label>
											<input type="password" class="form-control" name="old_password" required>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="px-3 py-2">
											<label class="form-label">New Password</label>
											<input type="password" class="form-control" name="password" required>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="px-3 py-2">
											<label class="form-label">Confirm Password</label>
											<input type="password" class="form-control" name="re_password" required>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="px-3 py-2">
											<label class="form-label">Email</label>
											<input type="Email" class="form-control" name="email" required>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="px-3 py-2">
											<input type="submit" name="change_password" class="btn btn-primary btn-block" value="Change Password">
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div> -->
				<!-- Password section -->


				<!-- Old sec -->
				<div class="section-border">
					<h2 class="section-border-heading">Classes</h2>
					<div class="row">
						<div class="col-xl-6 col-lg-6 col-md-6 col-xxl-4 dash_card">
							<div class="card_dash h-100">
								<div class="card_dash_left">
									<h2 class="text-dark">Free Workshop</h2>
								</div>
								<div class="card_dash_right">
									<i class="fa fa-leanpub fa-3x text-dark"></i>
								</div>
								<a href="free_class.php" class="btn btn-success dash_card_a">View More</a>
							</div>
						</div>
						<div class="col-xl-6 col-lg-6 col-md-6 col-xxl-4 dash_card">
							<div class="card_dash h-100">
								<div class="card_dash_left">
									<h2 class="text-dark">Paid Live Classes</h2>
								</div>
								<div class="card_dash_right">
									<i class="fa fa-book fa-3x text-dark"></i>
								</div>
								<a href="online_class.php" class="btn btn-success dash_card_a">View More</a>
							</div>
						</div>
						<div class="col-xl-6 col-lg-6 col-md-6 col-xxl-4 dash_card">
							<div class="card_dash h-100">
								<div class="card_dash_left">
									<h2 class="text-dark">Verbal Exams<h2>
								</div>
								<div class="card_dash_right">
									<i class="fa fa-file-text fa-3x text-dark"></i>
								</div>
								<a href="online_verbal_exam.php" class="btn btn-success dash_card_a">View More</a>
							</div>
						</div>
						<!-- <div class="col-xl-6 col-lg-6 col-md-6 col-xxl-4 dash_card">
							<div class="card_dash h-100">
								<div class="card_dash_left">
									<h2 class="text-dark">Download Free Class Tutes</h2>
								</div>
								<div class="card_dash_right">
									<i class="fa fa-user fa-3x text-dark"></i>
								</div>
								<a href="free_class_tutes.php" class="btn btn-success dash_card_a">View More</a>
							</div>
						</div> -->
						<!-- <div class="col-xl-6 col-lg-6 col-md-6 col-xxl-4 dash_card">
							<div class="card_dash h-100">
								<div class="card_dash_left">
									<h2 class="text-dark">Free Exams</h2>
								</div>
								<div class="card_dash_right">
									<i class="fa fa-user fa-3x text-dark"></i>
								</div>
								<a href="exam_list.php?type=0" class="btn btn-success dash_card_a">View More</a>
							</div>
						</div> -->
					</div>
				</div>
				<!-- <div class="section-border">
					<h2 class="section-border-heading">Paid Classes</h2>
					<div class="row">
						
						<div class="col-xl-6 col-lg-6 col-md-6 col-xxl-4 dash_card">
							<div class="card_dash h-100">
								<div class="card_dash_left">
									<h2 class="text-dark">Download Paid Class Tutes</h2>
								</div>
								<div class="card_dash_right">
									<i class="fa fa-user fa-3x text-dark"></i>
								</div>
								<a href="online_class_tutes.php" class="btn btn-success dash_card_a">View More</a>
							</div>
						</div>
						<div class="col-xl-6 col-lg-6 col-md-6 col-xxl-4 dash_card">
							<div class="card_dash h-100">
								<div class="card_dash_left">
									<h2 class="text-dark">Paid Paper Classes</h2>
								</div>
								<div class="card_dash_right">
									<i class="fa fa-user fa-3x text-dark"></i>
								</div>
								<a href="paper_class.php" class="btn btn-success dash_card_a">View More</a>
							</div>
						</div>
						<div class="col-xl-6 col-lg-6 col-md-6 col-xxl-4 dash_card">
							<div class="card_dash h-100">
								<div class="card_dash_left">
									<h2 class="text-dark">Download Paid Paper Class Tutes</h2>
								</div>
								<div class="card_dash_right">
									<i class="fa fa-user fa-3x text-dark"></i>
								</div>
								<a href="paper_class_tutes.php" class="btn btn-success dash_card_a">View More</a>
							</div>
						</div>
						<div class="col-xl-6 col-lg-6 col-md-6 col-xxl-4 dash_card">
							<div class="card_dash h-100">
								<div class="card_dash_left">
									<h2 class="text-dark">Paid Exams<h2>
								</div>
								<div class="card_dash_right">
									<i class="fa fa-user fa-3x text-dark"></i>
								</div>
								<a href="exam_list.php?type=1" class="btn btn-success dash_card_a">View More</a>
							</div>
						</div>
					</div>
				</div> -->
				<!-- <div class="section-border">
					<h2 class="section-border-heading">Lesson Recordings/Videos</h2>
					<div class="row">
						<div class="col-xl-6 col-lg-6 col-md-6 col-xxl-4 dash_card">
							<div class="card_dash h-100">
								<div class="card_dash_left">
									<h2 class="text-dark">This Month's Recordings</h2>
								</div>
								<div class="card_dash_right">
									<i class="fa fa-user fa-3x text-dark"></i>
								</div>
								<a href="paid_lesson.php" class="btn btn-success dash_card_a">View More</a>
							</div>
						</div>
						<div class="col-xl-6 col-lg-6 col-md-6 col-xxl-4 dash_card">
							<div class="card_dash h-100">
								<div class="card_dash_left">
									<h2 class="text-dark">All Previous Recordings</h2>
								</div>
								<div class="card_dash_right">
									<i class="fa fa-user fa-3x text-dark"></i>
								</div>
								<a href="old_video_lessons.php" class="btn btn-success dash_card_a">View More</a>
							</div>
						</div>
						<div class="col-xl-6 col-lg-6 col-md-6 col-xxl-4 dash_card">
							<div class="card_dash h-100">
								<div class="card_dash_left">
									<h2 class="text-dark">Free Recorded Classes</h2>
								</div>
								<div class="card_dash_right">
									<i class="fa fa-user fa-3x text-dark"></i>
								</div>
								<a href="free_lesson.php" class="btn btn-success dash_card_a">View More</a>
							</div>
						</div>
					</div>
				</div> -->
				<div class="section-border">
					<h2 class="section-border-heading">Profile & Payments</h2>
					<div class="row">
						<div class="col-xl-6 col-lg-6 col-md-6 col-xxl-4 dash_card">
							<div class="card_dash h-100">
								<div class="card_dash_left">
									<h2 class="text-dark">Your Profile</h2>
								</div>
								<div class="card_dash_right">
									<i class="fa fa-user fa-3x text-dark"></i>
								</div>
								<a href="edit_profile.php" class="btn btn-success dash_card_a">View More</a>
							</div>
						</div>
						<div class="col-xl-6 col-lg-6 col-md-6 col-xxl-4 dash_card">
							<div class="card_dash h-100">
								<div class="card_dash_left">
									<h2 class="text-dark">Bank Payments History</h2>
								</div>
								<div class="card_dash_right">
									<i class="fa fa-university fa-3x text-dark"></i>
								</div>
								<a href="bank_payment.php" class="btn btn-success dash_card_a">View More</a>
							</div>
						</div>
						<div class="col-xl-6 col-lg-6 col-md-6 col-xxl-4 dash_card">
							<div class="card_dash h-100">
								<div class="card_dash_left">
									<h2 class="text-dark">Card Payments History</h2>
								</div>
								<div class="card_dash_right">
									<i class="fa fa-credit-card-alt fa-3x text-dark"></i>
								</div>
								<a href="card_payment.php" class="btn btn-success dash_card_a">View More</a>
							</div>
						</div>
						<div class="col-xl-6 col-lg-6 col-md-6 col-xxl-4 dash_card">
							<div class="card_dash h-100">
								<div class="card_dash_left">
									<h2 class="text-dark">Manual Payments History</h2>
								</div>
								<div class="card_dash_right">
									<i class="fa fa-money fa-3x text-dark"></i>
								</div>
								<a href="manual_payment.php" class="btn btn-success dash_card_a">View More</a>
							</div>
						</div>
					</div>
				</div>
				<!-- <div class="section-border">
					<h2 class="section-border-heading">Feedback</h2>
					<div class="row">
						<div class="col-xl-6 col-lg-6 col-md-6 col-xxl-4 dash_card">
							<div class="card_dash h-100">
								<div class="card_dash_left">
									<h2 class="text-dark">Rate Your Learning Experience</h2>
								</div>
								<div class="card_dash_right">
									<i class="fa fa-user fa-3x text-dark"></i>
								</div>
								<a href="reviews.php" class="btn btn-success dash_card_a">View More</a>
							</div>
						</div>
					</div>
				</div> -->
				<div class="card_dash">
					<a href="edit_profile.php" class="btn btn-success btn-block">Select and Update Your Course/Courses</a>
				</div>
				<div class="section3126">
					<div class="row">
						<div class="col-md-6">
							<?php

							$reid = $_SESSION['reid'];

							$stmt = $DB_con->prepare('SELECT * FROM lmsregister where reid="' . $reid . '"');

							$stmt->execute();

							if ($stmt->rowCount() > 0) {

								while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {

									extract($row);

									$reg_id = $row["contactnumber"];

							?>
									<div class="right_side">
										<div class="fcrse_2 mb-30">
											<div class="tutor_img">
												<?php if ($row['image'] == "") {
													$pro_img = "images/hd_dp.jpg";
												} else {
													$pro_img = "uploadImg/" . $row['image'];
												} ?><img src="<?php echo $pro_img; ?>" id="dis_image" style="width: 200px; height: 200px; border: 1px solid #EEE; border-radius: 100%; cursor: pointer; object-fit: cover; background-position: center;">
											</div>
											<div class="tutor_content_dt">
												<div class="tutor150"> <a href="#" class="tutor_name">Hi,<?php echo $row['fullname']; ?></a>
													<div class="mef78" title="Verify"> <i class="uil uil-check-circle"></i> </div>
												</div>
												<div class="tutor_cate">District : <?php echo $row['address']; ?> </div>
												<hr>
												<div class="tutor_cate">Your Username : <?php echo "0" . (int)$row['contactnumber']; ?> </div> <a href="edit_profile.php" class="btn btn-primary">Go To Your Profile</a>
											</div>
										</div>
									</div>
							<?php

								}
							}

							?>
						</div>
						<div class="col-md-6">
							<div class="value_props">
								<h3>My Details</h3>
								<h4></h4>
								<table class="table table-bordered tabl-div bg-light">

									<tbody>
										<?php

										$reid = $_SESSION['reid'];

										$stmt = $DB_con->prepare('SELECT * FROM lmsregister where reid="' . $reid . '"');

										$stmt->execute();

										if ($stmt->rowCount() > 0) {

											while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {

												extract($row);

												$reg_id = $row["contactnumber"];

										?>
												<tr>
													<td style="font-weight:bold;font-family:emoji;border: 4px solid #031133;color:#000000;">
														<p class="bg-light">Name</p>
													</td>
													<td style="font-weight:bold;font-family:emoji;border: 4px solid #031133;color:#000000;">
														<p class="bg-light"><?php echo $row['fullname']; ?></p>
													</td>
												</tr>
												<tr>

													<td style="font-weight:bold;font-family:emoji;border: 4px solid #031133;color:#000000;">
														<p class="bg-light">Student Reg Number</p>
													</td>
													<td style="font-weight:bold;font-family:emoji;border: 4px solid #031133;color:#000000;">
														<p class="bg-light"><?php echo $row['stnumber']; ?></p>
													</td>
												</tr>
												<tr>

													<td style="font-weight:bold;font-family:emoji;border: 4px solid #031133;color:#000000;">
														<p class="bg-light">Contact</p>
													</td>
													<td style="font-weight:bold;font-family:emoji;border: 4px solid #031133;color:#000000;">
														<p class="bg-light"><?php echo "0" . (int)$row['contactnumber']; ?> <i class="text-danger">(User Name)</i></p>
													</td>
												</tr>
												<tr>

													<td style="font-weight:bold;font-family:emoji;border: 4px solid #031133;color:#000000;">
														<p class="bg-light">District </p>
													</td>
													<td style="font-weight:bold;font-family:emoji;border: 4px solid #031133;color:#000000;">
														<p class="bg-light"><?php echo $row['address']; ?></p>
													</td>
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
					<div class="row">
						<div class="col-lg-6 new-sce-1">
							<div class="value_props">
								<h3 class="text-dark">පන්ති සඳහා ගෙවීම් කටයුතු සිදුකල යුතු ආකාරය
								</h3>
								<div class="value_content">
									<p>ඔබ යම් කිසි පන්තියක් සඳහා සම්බන්ධ වන්නේ නම් පන්තියට අදාල ගාස්තුව ආයතනයට පැමිණ හෝ පහත ගිණුම් අංකයට ගෙවා ලබා ගන්නා ලද ගෙවීම් පත්‍රිකාව හෝ screen shot එක පහත විස්තර සම්පූර්ණ කර මෙම වෙබ් අඩවියට Upload කළ යුතු ය. (යම් හෙයකින් ගෙවීම් පත්‍රිකාව නොලැබුණහොත් හෝ අස්ථාන ගත වුවහොත් පැය 24 ක් ඇතුලත කාර්යාලයට දැනුම් දී එම ගැටලුව විසදා ගන්න)</p>
									<p>පන්ති ගාස්තු ගෙවූ විට ඔබට පන්ති සමග zoom ඔස්සේ සජීවීව සම්බන්ධ වීමට, පසුගිය පන්ති වල වීඩියෝ නැරඹීමට , tute ලබා ගැනීමට සහ ප්‍රශ්න පත්‍ර ලබා ගැනීමට හැකියාව ලැබෙනු ඇත. ( මුදල් ගෙවූ විගසම මේ සියල්ල නොලැබේ. මුදල් ගෙවා රිසිට් පත upload කර පැය 24 ක් ඇතුලත ඔබගේ ගිණුමට ඉහත පහසුකම් ලැබෙනු ඇත.)</p>
									<p>Visa , master , Amex card වලින්ද පන්ති ගාස්තු ගෙවිය හැක. ඒ සදහා මෙහි ඇති card payment click කරන්න</p>
									<p>සාමාන්‍ය පන්ති ගාස්තු නොගෙවන , පන්ති ගාස්තු සදහා සහන ශිෂ්‍යත්ව ලැබූ සිසුන් බැංකු ගෙවීම් පත්‍රිකාව මෙම වෙබ් අඩවියට upload කිරීමෙන් වලකින්න.</p>

								</div>
							</div>
						</div>
						<div class="col-lg-6 new-sce-1">
							<div class="value_props">
								<h3 class="text-dark">ගෙවීම් කළ හැකි ගිණුම් අංකය</h3>
								<div class="value_content">
									<p>බැංකුව : <strong>HNB</strong>
										<br> ගිණුම් අංකය : 123456789
										<br> ශාඛාව : <strong>Branch</strong>
										<br> ගිණුමේ නම : Account Name
									</p>
								</div>


							</div>
						</div>

						<div class="col-lg-6 new-sce-1">
							<div class="value_props">
								<h3 class="text-dark">විෂයක් තෝරා ගන්නා ආකාරය</h3>
								<br>
								<p class="text-dark">ගුරුවරයා තෝරා ගැනීමට ඔබට නොපෙන්වයි හෝ ඔබට අදාල නොවන විෂයන් පෙන්වන්නේ නම් Your Profile ගොස් වෙන ශ්‍රේණියක් select කර නැවත ඔබට අදාල ශ්‍රේණිය select කරන්න. පසුව ලැබෙන ලැයිස්තුවෙන් ඔබට සම්බන්ධ විය යුතු විෂයන් සහ ගුරුවරුන් තෝරා ගත හැක. එසේ තෝරාගෙන update profile click කරන්න.</p>
								<form method="post" enctype="multipart/form-data">
									<table class="table table-bordered tabl-div">
										<?php

										$selected_subjects  = array();

										$query1 = mysqli_query($conn, "SELECT * FROM lmsreq_subject WHERE sub_req_reg_no =" . $reg_id);

										while ($result = mysqli_fetch_assoc($query1)) {

											$sub_id = $result['sub_req_sub_id'];

											array_push($selected_subjects, $sub_id);
										}

										// $tea_qury = mysqli_query($conn, "SELECT tid,systemid,fullname FROM lmstealmsr ORDER BY fullname");

										// while ($tea_resalt = mysqli_fetch_assoc($tea_qury)) {

										?>

										<thead>
											<!-- <tr style="background-color: #8b8c90;">
													<td colspan="6" style="color: #ffffff;border:4px solid #8b8c90;"><?php echo $tea_resalt['fullname']; ?></td>

												</tr> -->
										</thead>
										<tbody>
											<?php

											$tec_sub_qury = mysqli_query($conn, "SELECT * FROM lmssubject  WHERE class_id = $current_user_data[level]  ORDER BY sid");

											while ($tec_sub_resalt = mysqli_fetch_assoc($tec_sub_qury)) {

												//check paid subject

												$check_paid_full = mysqli_query($conn, "SELECT * FROM lmspayment WHERE pay_sub_id='$current_user_data[level]' and userID='$_SESSION[reid]' and status='1' and pay_type='full'");
												$check_paid_half = mysqli_query($conn, "SELECT * FROM lmspayment WHERE pay_sub_id='$current_user_data[level]' and userID='$_SESSION[reid]' and status='1' and pay_type='half'");
												if ($check_paid_full) {
													$paid_resalt_full = mysqli_fetch_array($check_paid_full);
												}
												if ($check_paid_half) {
													$paid_resalt_half = mysqli_fetch_array($check_paid_half);
												}



												if (in_array($tec_sub_resalt['sid'], $selected_subjects)) {

											?>
													<tr>
														<td><input style="font-weight:bold;margin: 10px;color:#000000;" class="subject_select" type="checkbox" name="select_payment[]" value="<?php echo $tea_resalt['tid'] . "," . $tec_sub_resalt['sid'] . "," . $tec_sub_resalt['price']; ?>" data-subject-fee="<?php echo $tec_sub_resalt['price']; ?>" data-subject-id="<?php echo $tec_sub_resalt['sid']; ?>"></td>
														<td style="font-weight:bold;margin: 10px;color:#000000;">Full Payment</td>
														<td style="font-weight:bold;margin: 10px;color:#000000;"><?php echo $tec_sub_resalt['name']; ?></td>

														<td style="font-weight:bold;margin: 10px;color:#000000;"><?php echo number_format((float)$tec_sub_resalt['price'], 2); ?></td>
														<!--kasun 2021.12.01 change color to black from white-->
													</tr>
													<tr>
														<td><input style="font-weight:bold;margin: 10px;color:#000000;" class="subject_select" type="checkbox" name="select_payment[]" value="<?php echo $tea_resalt['tid'] . "," . $tec_sub_resalt['sid'] . "," . $tec_sub_resalt['price'] / 2; ?>" data-subject-fee="<?php echo $tec_sub_resalt['price'] / 2; ?>" data-subject-id="<?php echo $tec_sub_resalt['sid']; ?>"></td>
														<td style="font-weight:bold;margin: 10px;color:#000000;">Half Payment</td>
														<td style="font-weight:bold;margin: 10px;color:#000000;"><?php echo $tec_sub_resalt['name']; ?></td>

														<td style="font-weight:bold;margin: 10px;color:#000000;"><?php echo number_format((float)($tec_sub_resalt['price'] / 2), 2); ?></td>
														<!--kasun 2021.12.01 change color to black from white-->
													</tr>
											<?php

												}
											}
											// }

											?>
										</tbody>
									</table>
							</div>
						</div>
						<div class="col-lg-6 new-sce-1 paymet-det">
							<div class="value_props">
								<h3 class="text-dark">Card Payment</h3>
								<?php
								$today_time = date("Y-m-d");
								$payment_qury = mysqli_query($conn, "SELECT * FROM lmspayment WHERE paymentMethod='Card' and userID='$_SESSION[reid]' and status='1' ORDER BY pid DESC");
								while ($payment_resalt = mysqli_fetch_array($payment_qury)) {
								?>
									<span style="font-size:14px;color:#000000;">Paid Month : <i class="fa fa-check-circle"></i> <?php echo date_format(date_create($payment_resalt['pay_month']), "F"); ?></span>
								<?php
								}
								?>
								<h4>Select Month</h4>

								<br>
								<label for="fileName1"><img src="images/card payment.png" id="yourImgTag1" style="width:20%;cursor: pointer;" /></label>
								<ul>
									<li>
										<button type="submit" name="submit_bt" id="pay-by-card" class="btn btn-success btn-block" disabled="true" style="font-weight:bold;font-size:14px;">කාඩ් එකෙන් ගෙවන්න | Rs. <span class="payment_ammount">0.00</span></button>
									</li>
								</ul>
							</div>
							<hr style="border:2px solid #28a745">
							<div class="value_props">
								<h3 class="text-dark">Bank Payment</h3>
								<hr style="border:2px solid #8b8c90">
								<?php
								$today_time = date("Y-m-d");
								$payment_qury = mysqli_query($conn, "SELECT * FROM lmspayment WHERE paymentMethod='Bank' and userID='$_SESSION[reid]' and status='1' ORDER BY pid DESC");
								while ($payment_resalt = mysqli_fetch_array($payment_qury)) {
								?>

								<?php
								}
								?>
								<h4>Select Month</h4>

								<br>

								<label class="control-label text-dark" for="basicinput">සාමාන්‍ය පන්ති ගාස්තු ගෙවූ දරුවන් පමණක් බැංකු රිසිට් පත මෙතනින් upload කරන්න. පන්ති ගාස්තු සදහා සහන (Discounts/Offers) ලැබූ සිසුන් එම bank receipt පත 0123456789 අංකයට නම , LMS NAME එකෙහි register වූ දුරකතන අංකය , විෂය සහ ගුරුවරයා , ඒ ඒ විෂයට ගෙවූ ගාස්තුව වෙන වෙනම සදහන් කර WhatsApp කරන්න.සාමාන්‍ය පන්ති ගාස්තු ගෙවන දරුවන් සම්බන්ධ වන විෂයන් ඉදිරියේ හරි ලකුණු යොදා (click on the relevant tick box) මෙහි bank receipt පතෙහි photo එකක් හෝ screenshot එකක් upload කරන්න. (Pdf file upload කල නොහැක)</label>
								<label for="fileName"><img src="images/payslip.png" id="yourImgTag" style="width:40%;cursor: pointer;" /></label>

								<input type="file" name="fileName" id="fileName" value="" class="form-control" required onChange="JavaScript:dis_name(this.value);">
								<br>
								<ul>
									<li>
										<input type="text" name="amount" id="payment_ammount" hidden>
										<input type="text" name="paymonth" value="half" hidden>
										<button type="submit" name="submit_bt" id="bank-pay-button" class="btn btn-primary btn-block" disabled="true" style="font-weight:bold;font-size:14px;">බැංකු රිසිට්පතෙන් ගෙවන්න | Rs. <span class="payment_ammount">0.00</span></button>
									</li>
								</ul>
								<script>
									function dis_name(file_name) {

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
					</div>
					</form>
				</div>
				<!-- content start -->
			</div>
			<div id="rgsb" class="rg-sb col-sm-6 col-md-5 col-lg-3 col-xl-3 col-xxl-3 bg-light rounded-left pt-4">
				<?php
				require_once 'right-sidebar.php';
				?>
			</div>
			<!-- Body End -->
		</div>
		<?php
		require_once 'footer.php';
		?>
	</div>
	<?php
	require_once 'footerjs.php';
	?>

	<script type="text/javascript">
		var total = 0;

		$(".subject_select").click(function(argument) {

			var fee = $(this).data("subject-fee");

			if ($(this).prop("checked") == true) {

				total += fee;

			} else {

				total -= fee;

			}

			$(".payment_ammount").html(total);

			$("#payment_ammount").val(total);

			$("#online_pay").val(total);


			if (total == 0) {

				$("#pay-by-card").attr("disabled", "true");

				$("#bank-pay-button").attr("disabled", "true");

			} else {

				$("#pay-by-card").removeAttr("disabled");

				$("#bank-pay-button").removeAttr("disabled");

			}
		})

		$("#pay-by-card").click(function(e) {


			if ($("#select_month").val() == '') {
				alert("Please select the payment month!");
				return 0;
			}
			e.preventDefault();
			var value = $(".subject_select").serialize();
			var month = $("#select_month").val();
			var currString = "<?php echo $url ?>";
			// window.open("https://guruniwasainstitute.lk/lms/profile/online_pay.php?" + value + "&month=" + month , '_blank');
			window.location.href = currString + "/profile/online_pay.php?" + value + "&month=" + month;


		})


		window.addEventListener("pageshow", function(event) {
			var historyTraversal = event.persisted ||
				(typeof window.performance != "undefined" &&
					window.performance.navigation.type === 2);
			if (historyTraversal) {
				// Handle page restore.
				window.location.reload();
			}
		});
	</script>

</body>

</html>