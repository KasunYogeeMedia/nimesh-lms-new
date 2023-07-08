<?php
require_once 'includes.php';

require_once '../super_admin/conn.php';

require_once '../super_admin/dbconfig4.php';

// Get the values from the AJAX request
$userid = $_POST['userid'];


// Insert the data into the database
// Modify this code according to your database structure and connection

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "INSERT INTO certificate (userId) VALUES ('$userid')";
$conn->query($sql);
$conn->close();
