<?php
require_once 'admin/oard/dbconfig4.php';
include '../dashboard/conn.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $level = $_POST['level'];
    $stmt = $DB_con->prepare('SELECT * FROM lmssubject WHERE class = :level');
    $stmt->bindParam(':level', $level);
    $stmt->execute();

    if ($stmt->rowCount() > 0) {
        $names = array();

        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $names[] = $row['name'];
        }

        echo json_encode($names);
    }
}
?>
