<?php
require_once 'admin/conn.php';
session_start();
session_unset();
session_destroy();
setcookie("reid","", time()-60, "/");
header('location:/');
die();