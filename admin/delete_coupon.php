<?php

require_once '../super_admin/dbconfig4.php';

if (isset($_GET['clid'])) {

    $stmt_delete = $DB_con->prepare('DELETE FROM lmscoupon WHERE id =:clid');
    $stmt_delete->bindParam(':clid', $_GET['clid']);
    $stmt_delete->execute();

    //header("Location: expense.php");
    echo "<script type='text/javascript'>window.location.href = 'coupon.php';</script>";
}
