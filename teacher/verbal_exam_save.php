<?php
require_once 'includes.php';
require_once '../super_admin/dbconfig4.php';
require_once("../super_admin/conn.php");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Retrieve form data
    $userId = $_POST['userId'];
    $marks = $_POST['marks'];
    
    // Check if the file is empty
    if ($_FILES['document']['size'] == 0) {
        // File is empty, perform an insert without the document path
        $checkQuery = "SELECT * FROM verbal_exam WHERE userId = $userId";
        $checkStmt = $conn->prepare($checkQuery);
        $checkStmt->execute();
        $checkResult = $checkStmt->get_result();

        if ($checkResult->num_rows > 0) {
            // Record exists, perform an update
            $updateQuery = "UPDATE verbal_exam SET marks = ?, document = ? WHERE userId = ?";
            $updateStmt = $conn->prepare($updateQuery);
            $updateStmt->bind_param("ssi", $marks, $targetFile, $userId);
            $updateStmt->execute();

            if ($updateStmt->affected_rows > 0) {
                // Update successful
                $updateStmt->close();
                $conn->close();

                // Return a response to the JavaScript code
                http_response_code(200);
                echo "Record updated successfully!";
            } else {
                // Update failed
                $updateStmt->close();
                $conn->close();

                // Return an error response to the JavaScript code
                http_response_code(500);
                echo "Error updating the record. Please try again.";
            }
        } else {
        $insertQuery = "INSERT INTO verbal_exam (userId, marks) VALUES (?, ?)";
        $insertStmt = $conn->prepare($insertQuery);
        $insertStmt->bind_param("is", $userId, $marks);
        $insertStmt->execute();

        if ($insertStmt->affected_rows > 0) {
            // Insert successful
            $insertStmt->close();
            $conn->close();

            // Return a response to the JavaScript code
            http_response_code(200);
            echo "Record inserted successfully!";
        } else {
            // Insert failed
            $insertStmt->close();
            $conn->close();

            // Return an error response to the JavaScript code
            http_response_code(500);
            echo "Error inserting the record. Please try again.";
        }
    }
    } else {
        // Process document upload
        $uploadDir = 'verbal_doc/'; // Directory to save uploaded documents
        $uploadedFile = $_FILES['document']['name'];
        $tempFile = $_FILES['document']['tmp_name'];
        $targetFile = $uploadDir . $uploadedFile;

        // Move uploaded file to the target directory
        if (move_uploaded_file($tempFile, $targetFile)) {
            // File upload success

            // Save the userId, marks, and document path to the database
            // ...
            
            // Check the connection
            if ($conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
            }

            // Check if a record exists for the userId
            $checkQuery = "SELECT * FROM verbal_exam WHERE userId = $userId";
            $checkStmt = $conn->prepare($checkQuery);
            $checkStmt->execute();
            $checkResult = $checkStmt->get_result();

            if ($checkResult->num_rows > 0) {
                // Record exists, perform an update
                $updateQuery = "UPDATE verbal_exam SET marks = ?, document = ? WHERE userId = ?";
                $updateStmt = $conn->prepare($updateQuery);
                $updateStmt->bind_param("ssi", $marks, $targetFile, $userId);
                $updateStmt->execute();

                if ($updateStmt->affected_rows > 0) {
                    // Update successful
                    $updateStmt->close();
                    $conn->close();

                    // Return a response to the JavaScript code
                    http_response_code(200);
                    echo "Record updated successfully!";
                } else {
                    // Update failed
                    $updateStmt->close();
                    $conn->close();

                    // Return an error response to the JavaScript code
                    http_response_code(500);
                    echo "Error updating the record. Please try again.";
                }
            } else {
                // Record does not exist, perform an insert
                $insertQuery = "INSERT INTO verbal_exam (userId, marks, document) VALUES (?, ?, ?)";
                $insertStmt = $conn->prepare($insertQuery);
                $insertStmt->bind_param("iss", $userId, $marks, $targetFile);
                $insertStmt->execute();

                if ($insertStmt->affected_rows > 0) {
                    // Insert successful
                    $insertStmt->close();
                    $conn->close();

                    // Return a response to the JavaScript code
                    http_response_code(200);
                    echo "Record inserted successfully!";
                } else {
                    // Insert failed
                    $insertStmt->close();
                    $conn->close();

                    // Return an error response to the JavaScript code
                    http_response_code(500);
                    echo "Error inserting the record. Please try again.";
                }
            }
        } else {
            // File upload failed
            http_response_code(500);
            echo "Error uploading the file.";
        }
    }
} else {
    // Invalid request method
    http_response_code(405);
    echo "Invalid request method.";
}
