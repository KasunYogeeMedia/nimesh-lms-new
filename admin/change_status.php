<?php
if (!isset($_SESSION)) {
    session_start();
}

require_once 'includes.php';

include '../super_admin/conn.php';

require_once '../super_admin/dbconfig4.php';


$id = $_POST['id'];

if ($conn->connect_error) {
    $response = array('status' => 'error', 'message' => 'Database connection error: ' . $conn->connect_error);
    echo json_encode($response);
    exit();
}

// Prepare and execute the SQL query
$stmt = $conn->prepare("UPDATE lmsregister SET status = CASE WHEN status = 0 THEN 1 WHEN status = 1 THEN 0 END WHERE reid = ?");
$stmt->bind_param("s", $id);
$stmt->execute();

// Check for query execution errors
if ($stmt->error) {
    $response = array('status' => 'error', 'message' => 'Query execution error: ' . $stmt->error);
    echo json_encode($response);
    exit();
}

// Get the updated status value
$updatedStatus = ($stmt->affected_rows > 0) ? ($stmt->affected_rows == 1 ? 1 : 0) : false;

// Return a response indicating the status change
if ($updatedStatus !== false) {
    $response = array('status' => 'success', 'message' => 'Database status changed successfully for ID: ' . $id, 'newStatus' => $updatedStatus);
    echo json_encode($response);
} else {
    $response = array('status' => 'error', 'message' => 'No changes were made to the database for ID: ' . $id);
    echo json_encode($response);
}
