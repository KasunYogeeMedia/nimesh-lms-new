<?php

//error_reporting(0);
//if (!isset($_SESSION)) {
	session_start();
//}



include '../super_admin/dbconfig4.php';

require_once'../super_admin/conn.php';

if(isset($_GET['pid'])){

	$pid=mysqli_real_escape_string($conn,$_GET['pid']);	

	mysqli_query($conn,"UPDATE lmspayment SET `status`=1 WHERE pid='$pid' LIMIT 1");	

    if ($_GET['inti_loca'] == "home"){ header("Location:home.php"); }
    if ($_GET['inti_loca'] == "bank_payment"){ header("Location:bank_payaments.php"); }

}
