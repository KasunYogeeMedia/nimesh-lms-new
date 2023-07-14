<?php

require_once '../super_admin/dbconfig4.php';

if (isset($_GET['clid'])) {

	$stmt_delete = $DB_con->prepare('DELETE FROM lmsclass WHERE cid =:clid');
	$stmt_delete->bindParam(':clid', $_GET['clid']);
	$stmt_delete->execute();

	//header("Location: grade.php");
	echo "<script type='text/javascript'>
			window.location.href = 'grade.php';
			alert('Grade deleted successfully!');
		</script>";
}
