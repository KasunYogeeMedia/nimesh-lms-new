<?php

if (!isset($_SESSION)) {
	session_start();
}
if (!isset($_SESSION['reid'])) {
	header('location:http://nimesh-lms-new.test/');
	exit();
}

$fullname = $_SESSION['fullname'];
$contactnumber = $_SESSION['contactnumber'];
