<?php
require_once 'includes.php';

require_once '../super_admin/conn.php';

require_once '../super_admin/dbconfig4.php';


$userid = $_POST['userid'];
$certificate = $_POST['certificate'];

if ($certificate == 1) {
    $certificate = 0;
} else {
    $certificate = 1;
}
// Update the data in the database


if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "UPDATE certificate SET certificate_status = '$certificate' WHERE userId = '$userid'";
$get_data = "SELECT * FROM lmsregister WHERE reid = '$userid' LIMIT 1";

$result = mysqli_query($conn, $get_data);
if ($result) {
    // Fetch the record
    $row = mysqli_fetch_assoc($result);

    if ($row) {
        // The record was found
        // You can access the data using $row['column_name']
        $to = "+94" . (int)$row['contactnumber'];
        $message_text = "Dear Student,Congratulations ..!!Your certificate has been dispatched.You will receive the certificate by post within a week.Thank you.IPD";
        $message = urlencode($message_text);
        send_sms($to, $message_text);

    } else {

       
    }
} else {

   
}


$conn->query($sql);
$conn->close();
