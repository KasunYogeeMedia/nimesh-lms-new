<?php

if (!isset($_SESSION)) {
    session_start();
}

require_once 'includes.php';

require_once '../super_admin/conn.php';

require_once '../super_admin/dbconfig4.php';

?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Exams | Online Learning Platforms | Dashboard</title>
    <?php
    require_once 'headercss.php';
    ?>

</head>

<body>

    <!--**********************************
        Main wrapper start
    ***********************************-->
    <div id="main-wrapper">



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
        <div class="content-body bg-lblue">
            <!-- row -->
            <div class="container-fluid">

                <div class="row page-titles mx-0">
                    <div class="col-sm-6 p-md-0">
                        <div class="welcome-text">
                            <h4>All Exam Types</h4>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="home.php">Home</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0);">Exam Types</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0);">All</a></li>
                        </ol>
                    </div>
                </div>

                <div class="row">
                <div class="col-sm-12 col-md-12 col-lg-4">
                        <div class="card">
                        <div class="card-body text-center">
                                <h6 class="fw-bold mb-4">MCQ Exams</h6>
                                <div class="row bg-dark bg-opacity-10 m-2 py-4 px-2 rounded">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <a href="exam.php" class="btn btn-light w-100">Exam Details</a>
                                    </div>
                                    <div class="col-sm-6">
                                    <a href="exam_results.php" class="btn btn-dark w-100">Exam Results</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>  
                    <div class="col-sm-12 col-md-12 col-lg-4">
                        <div class="card">
                        <div class="card-body text-center">
                                <h6 class="fw-bold mb-4">Online Paper Exams</h6>
                                <div class="row bg-dark bg-opacity-10 m-2 py-4 px-2 rounded">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <a href="online_exams.php" class="btn btn-light w-100">Add Online Exams</a>
                                    </div>
                                    <div class="col-sm-6">
                                    <a href="submissions.php" class="btn btn-dark w-100">Student Submitted</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-12 col-lg-4">
                        <div class="card">
                        <div class="card-body text-center">
                                <h6 class="fw-bold mb-4">Online Verbal Exams</h6>
                                <div class="row bg-dark bg-opacity-10 m-2 py-4 px-2 rounded justify-content-center">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <a href="exam.php" class="btn btn-light w-100">Exam Details</a>
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

        <?php
        require_once 'footer.php';
        ?>

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

    <?php
    require_once 'footerjs.php';
    ?>

</body>

</html>