<?php

if (!isset($_SESSION)) {
	session_start();
}
if (!isset($_SESSION['reid'])) {
	header('location:https://ongoing.website/websites/nimesh-lms-new/');
	exit();
}

$fullname = $_SESSION['fullname'];
$contactnumber = $_SESSION['contactnumber'];
