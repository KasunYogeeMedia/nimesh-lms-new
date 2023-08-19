<?php

require_once 'includes.php';

include '../super_admin/dbconfig4.php';

require_once '../super_admin/conn.php';

if(!empty($_POST["nextPayDate"])){
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $paymentID = $_POST["paymentID"];
    $nextPayDate = $_POST["nextPayDate"];

    // Update the next pay date in the database
    $updateQuery = "UPDATE lmspayment SET next_pay_date = '$nextPayDate' WHERE pid = '$paymentID'";
    if (mysqli_query($conn, $updateQuery)) {
        echo "Success";
    } else {
        echo "Error updating next pay date: " . mysqli_error($conn);
    }
}
    
}

if(!empty($_POST["classFee"])){

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $paymentID = $_POST["paymentID"];
    $classFee = $_POST["classFee"];

    // Update the class fee in the database
    $updateQuery = "UPDATE lmspayment SET class_fee = '$classFee' WHERE pid = '$paymentID'";
    if (mysqli_query($conn, $updateQuery)) {
        echo "Success";
    } else {
        echo "Error updating class fee: " . mysqli_error($conn);
    }
}

}

?>