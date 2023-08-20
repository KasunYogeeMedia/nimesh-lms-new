<?php
include '../super_admin/conn.php';


if($next_due == 0){ ?>

<div class="alert alert-danger alert-dismissible fade show" role="alert">
  <strong>Hi!</strong> Please make payment <a class="text-dark" href="student_profile.php#pay_sec">here.</a>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>

<?php } ?>

