<?php

if (!isset($_SESSION)) {
    session_start();
}

require_once 'includes.php';

require_once '../super_admin/dbconfig4.php';

require_once("../super_admin/conn.php");
if (isset($_GET['exam'])) {
    $batch_id = $_GET['exam'];
}
if (isset($_SESSION['tid'])) {

    $user_qury = mysqli_query($conn, "SELECT * FROM lmstealmsr WHERE tid='$_SESSION[tid]'");

    $user_resalt = mysqli_fetch_array($user_qury);



    if ($user_resalt['image'] == "") {

        $image_path = "../profile/images/hd_dp.jpg";
    } else {

        $image_path = "../admin/images/teacher/" . $user_resalt['image'];
    }
} else {

    echo "<script>window.location='home.php';</script>";
}


if (isset($_GET['remove'])) {
    $remove = mysqli_real_escape_string($conn, $_GET['remove']);
    mysqli_query($conn, "DELETE FROM lmsverbal_exam WHERE classid='$remove'");
    echo "<script>window.location='class_schedule.php';</script>";
}
?>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Verbal Exam | Teacher Panel | Online Learning Platforms </title>

    <?php
    require_once 'headercss.php';
    ?>

</head>

<body>

    <!--**********************************
        Main wrapper start
    ***********************************-->
    <div id="main-wrapper">

        <?php
        // require_once 'navheader.php'; 
        ?>


        <!--**********************************
            Sidebar start
        ***********************************-->
        <div class="deznav">
            <div class="deznav-scroll">
                <?php

                require_once 'sidebarmenu.php';

                ?>
            </div>
        </div>
        <!--**********************************
            Sidebar end
        ***********************************-->

        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body bg-light">
            <!-- row -->
            <div class="container-fluid">

                <div class="row page-titles mx-0">
                    <div class="col-sm-6 p-md-0">
                        <div class="welcome-text">
                            <h4>All Verbal Exam</h4>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="home.php">Home</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0);">Verbal Exam</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0);">All Verbal Exam</a></li>
                        </ol>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <div class="row tab-content">
                            <div id="list-view" class="tab-pane fade active show col-lg-12">
                                <div class="card border-0 bg-light">
                                    <div class="card-header">
                                        <h4 class="card-title">All Verbal Exam Students</h4>

                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table id="dataTable" class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>Action</th>
                                                        <th>Cover</th>
                                                        <th>Student ID</th>
                                                        <th>Name</th>
                                                        <th>Marks</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php
                                                    $count = 0;
                                                    $list_qury = mysqli_query($conn, "SELECT * FROM lmsregister LEFT JOIN verbal_exam ON verbal_exam.userID = lmsregister.reid WHERE lmsregister.level = '" . $batch_id . "' ORDER BY lmsregister.reid DESC");

                                                    while ($list_resalt = mysqli_fetch_array($list_qury)) {
                                                        $count++;


                                                    ?>
                                                        <tr>
                                                            <td><?php echo number_format($count, 0); ?></td>
                                                            <td align="center">

                                                                <button type="button" class="btn btn-sm btn-secondary" data-toggle="modal" data-target="#myModal" data-user="<?php echo $list_resalt['reid']; ?>">
                                                                    <i class="fa fa-lg fa-pencil"></i>
                                                                </button>
                                                            </td>
                                                            <td><?php if ($list_resalt['image'] == "") {
                                                                    $pro_img = "../profile/images/hd_dp.jpg";
                                                                } else {
                                                                    $pro_img = "../admin/images/class/" . $list_resalt['image'];
                                                                } ?><img src="<?php echo $pro_img; ?>" class="pro_pick"></td>


                                                            <td style="text-transform: capitalize;"><?php echo $list_resalt['stnumber']; ?></td>
                                                            <td style="text-transform: capitalize;"><?php echo $list_resalt['fullname']; ?></td>
                                                            <td style="text-transform: capitalize;"><?php echo $list_resalt['marks']; ?></td>
                                                        </tr>
                                                    <?php
                                                    }
                                                    ?>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!--**********************************
            Content body end
        ***********************************-->
        <!-- Your modal HTML -->
        <div id="myModal" class="modal" tabindex="-1">
            <!-- Modal content -->
            <div class="modal-dialog">
                <div class="modal-content">
                    <form id="myForm" class="p-3" enctype="multipart/form-data">


                        <!-- Marks Entry -->
                        <div class="form-group">
                            <label for="marks">Marks:</label>
                            <input type="number" class="form-control" id="marks" name="marks" required>
                        </div>
                        <!-- Document Upload -->
                        <div class="form-group">
                            <label for="document">Document:</label>
                            <input type="file" class="form-control" id="document" name="document">
                        </div>
                        <!-- Hidden Input for User ID -->
                        <input type="hidden" id="userId" name="userId" value="">

                        <!-- Submit Button -->
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>
        </div>

        <!--**********************************
            Footer start
        ***********************************-->
        <div class="footer">
            <div class="copyright">
                <p>Copyright © Designed &amp; Developed by <a href="https://yogeemedia.com" target="_blank">Yogeemedia</a> 2021</p>
            </div>
        </div>
        <!--**********************************
            Footer end
        ***********************************-->

        <!--**********************************
           Support ticket button start
        ***********************************-->

        <!--**********************************
           Support ticket button end
        ***********************************-->


    </div>
    <!--**********************************
        Main wrapper end
    ***********************************-->

    <!--**********************************
        Scripts
    ***********************************-->
    <?php
    require_once 'footerjs.php';
    ?>
    <script>
        // JavaScript code
        document.addEventListener('DOMContentLoaded', function() {
            var modal = document.getElementById('myModal');
            var btns = document.querySelectorAll('[data-target="#myModal"]');
            var form = document.getElementById('myForm');
            var userIdInput = document.getElementById('userId');

            for (var i = 0; i < btns.length; i++) {
                btns[i].addEventListener('click', function() {
                    var userId = this.getAttribute('data-user');
                    userIdInput.value = userId;
                });
            }

            form.addEventListener('submit', function(e) {
                e.preventDefault();
                var formData = new FormData(form);
                var xhr = new XMLHttpRequest();
                xhr.open('POST', 'verbal_exam_save.php', true);
                xhr.onload = function() {
                    if (xhr.status === 200) {
                        // Form submission success
                        modal.style.display = 'none';
                        location.reload(); // Reload the page
                    } else {
                        // Form submission error
                        alert('Error submitting the form. Please try again.');
                    }
                };
                xhr.send(formData);
            });
        });
    </script>

</body>

</html>