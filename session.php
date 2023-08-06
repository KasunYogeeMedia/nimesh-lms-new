<?php

if (!isset($_SESSION)) {
	session_start();
}
if (!isset($_SESSION['reid'])) {
	header('location:https://ipdedulk.com/');
	exit();
}

$fullname = $_SESSION['fullname'];
$contactnumber = $_SESSION['contactnumber'];
