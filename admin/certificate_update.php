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
$conn->query($sql);
$conn->close();
