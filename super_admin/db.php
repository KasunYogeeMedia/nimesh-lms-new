<?php

$server = "localhost";
$username = "ipdedu_nimesh_lms";
$pass = "r^3JU}teRuA]";
$db = "ipdedu_nimesh_lms";

//create connection 

$conn = mysqli_connect($server, $username, $pass, $db);
if ($conn->connect_error) {

	die("Connection Failed!" . $conn->connect_error);
}

$main_db = mysqli_query($conn, "SELECT * FROM lmsdb WHERE id=1");
$main_db_resalt = mysqli_fetch_array($main_db);
$dbname = $main_db_resalt['dbname'];
$udbname = $main_db_resalt['username'];
$dbpassword = $main_db_resalt['password'];


$setting = mysqli_query($conn, "SELECT * FROM settings WHERE id=1");
$setting_resalt = mysqli_fetch_array($setting);
$reg_prefix = $setting_resalt['reg_prefix'];
$application_name = $setting_resalt['application_name'];
$main_logo = $setting_resalt['main_logo'];

function send_sms($receiver_number, $messsage)
{
	$conn = mysqli_connect("localhost", "ipdedu_nimesh_lms", "r^3JU}teRuA]", "ipdedu_nimesh_lms");
	$sms = mysqli_query($conn, "SELECT * FROM lmssms WHERE id=1");
	$sms_resalt = mysqli_fetch_array($sms);
	$sender_id = $sms_resalt['sender_id'];
	

	$MSISDN = $receiver_number;
	$SRC = $sender_id;
	$MESSAGE = (urldecode($messsage));
	$AUTH = $sms_resalt['sa_token'];  //Replace your Access Token

	$msgdata = array("recipient" => $MSISDN, "sender_id" => $SRC, "message" => $MESSAGE);



	$curl = curl_init();

	//IF you are running in locally and if you don't have https/SSL. then uncomment bellow two lines
	curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 0);
	curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0);

	curl_setopt_array($curl, array(
		CURLOPT_URL => "https://sms.send.lk/api/v3/sms/send",
		CURLOPT_CUSTOMREQUEST => "POST",
		CURLOPT_POSTFIELDS => json_encode($msgdata),
		CURLOPT_HTTPHEADER => array(
			"accept: application/json",
			"authorization: Bearer $AUTH",
			"cache-control: no-cache",
			"content-type: application/x-www-form-urlencoded",
		),
	));

	ob_start(); // Start output buffering
    $response = curl_exec($curl);
    ob_end_clean(); // Clean and discard the buffered output

	//$err = curl_error($curl);

	curl_close($curl);

	// if ($err) {
	// 	echo "cURL Error #:" . $err;
	// } else {
	// 	echo $response;
	// }
}


$payment_getway = mysqli_query($conn, "SELECT * FROM lmsgetway WHERE id=1");
$getway_resalt = mysqli_fetch_array($payment_getway);
if(mysqli_num_rows($payment_getway) > 0){

	$app_id = $getway_resalt['app_id'];
	$hash_salt = $getway_resalt['hash_salt'];
	$a_token = $getway_resalt['a_token'];
}


$lmsurl = mysqli_query($conn, "SELECT * FROM lmsurl WHERE id=1");
$lmsurl_resalt = mysqli_fetch_array($lmsurl);
$url = $lmsurl_resalt['url'];

if (!isset($_SESSION)) {
	session_start();
}


if (isset($_SESSION['reid']) && !empty($_SESSION['reid'])) {
	$reid = $_SESSION['reid'];
	$current_user = mysqli_query($conn, "SELECT * FROM lmsregister WHERE reid = $reid LIMIT 1");
	if($current_user){
		$current_user_data = mysqli_fetch_array($current_user);
	}
	
	$current_user_sid = mysqli_query($conn, "SELECT * FROM lmssubject where class_id = $current_user_data[level] LIMIT 1");
	if($current_user_sid){
		$current_user_level = mysqli_fetch_array($current_user_sid);
	}
	
	$lmsck_payments = mysqli_query($conn, "SELECT * FROM lmspayment WHERE userID='$reid' and pay_sub_id='$current_user_level[sid]' and status='1'");
	$lmsck_sum = mysqli_query($conn,"SELECT SUM(amount) AS total_payment FROM lmspayment WHERE userID='$reid' AND pay_sub_id='$current_user_level[sid]' AND status='1'");															
	$total_payment = mysqli_fetch_assoc($lmsck_sum);


	if (mysqli_num_rows($lmsck_payments) > 0) {
		$user_lastpayments = mysqli_query($conn, "SELECT * FROM lmspayment WHERE status = 1 AND userID='$reid' AND pay_sub_id='$current_user_level[sid]' AND next_paydate > CURDATE() ORDER BY created_at DESC LIMIT 1"); 
		$user_lastpayment = mysqli_fetch_assoc($user_lastpayments);
		var_dump($user_lastpayment);
		if ((int)$total_payment['total_payment'] == (int)$current_user_level['price']) {

			$full_pay = 1;
			return $full_pay;
		} else {

            $full_pay = 2;
			return $full_pay;
		}

		}else{
			$full_pay = 0;
			return $full_pay;
		}

	

}
