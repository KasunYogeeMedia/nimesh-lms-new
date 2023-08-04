<?php
// Start the session first before any output
if (!isset($_SESSION)) {
    session_start();
}

if (!isset($_SESSION['tid']) || trim($_SESSION['tid']) === '') {
    header('Location: index.php');
    exit();
}

$session_id = $_SESSION['tid'];
/* $session_id = $_SESSION['username']; */
?>
