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
    <title>Quiz Results | Online Learning Platforms | Dashboard</title>
    <?php
    require_once 'headercss.php';
    ?>
    <style type="text/css">
        .multi-select {
            height: 300px;
            border: 1px solid #DDD;
            overflow-y: scroll;
            padding: 5px;
        }

        .pro_pick {
            width: 120px;
            height: 120px;
            object-fit: cover;
            background-position: center;
            background-repeat: no-repeat;
            border-radius: 100%;
            cursor: pointer;
            border: 1px solid #DDD;
            padding: 5px;
            background: #EEE;
        }
    </style>
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
                            <h4>All Quiz Results</h4>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="home.php">Home</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0);">Quiz Results</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0);">All Quiz Results</a></li>
                        </ol>
                    </div>
                </div>

                <div class="row">

                    <div class="col-lg-12">
                        <div class="row tab-content">
                            <div id="list-view" class="tab-pane fade active show col-lg-12">
                                <div class="card border-0 bg-light">
                                    <div class="card-header">
                                        <h4 class="card-title">All Quiz Results</h4>
                                        <a href="new_exam.php" class="btn btn-square btn-secondary">+ Add Exams</a>
                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table id="dataTable" class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th></th>
                                                        <th>EXAM</th>
                                                        <th>SUBJECT</th>
                                                        <th>TIME DURATION</th>
                                                        <th>QUESTIONS PER PAPER</th>
                                                        <th>ADD TIME</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php
                                                    $join_str = "lms_exam_details INNER JOIN lmssubject ON lms_exam_details.lms_exam_subject=lmssubject.sid";
                                                    $exam_qury = mysqli_query($conn, "SELECT * FROM $join_str WHERE lms_exam_add_user='$_SESSION[tid]' ORDER BY lms_exam_id DESC");
                                                    while ($exam_resalt = mysqli_fetch_array($exam_qury)) {
                                                    ?>
                                                        <tr>
                                                            <td>
                                                                <a href="add_question.php?lms_exam_system_id=<?php echo $exam_resalt['lms_exam_system_id']; ?>" class="btn btn-sm btn-success btn-rounded mt-3 px-4" title="Add question"><i class="fa fa-question"></i></a>
                                                                <a href="new_exam.php?lms_exam_id=<?php echo $exam_resalt['lms_exam_id']; ?>" class="btn btn-sm btn-primary btn-rounded mt-3 px-4" title="Test Exam"><i class="fa fa-edit"></i></a>
                                                                <a href="exam.php?remove=<?php echo $exam_resalt['lms_exam_id']; ?>" class="btn btn-sm btn-danger btn-rounded mt-3 px-4" title="Test Exam" onClick="JavaScript:return confirm('Are your sure remove this exam?');"><i class="fa fa-tralms"></i></a>

                                                            </td>
                                                            <td><?php echo $exam_resalt['lms_exam_name']; ?></td>
                                                            <td><?php echo $exam_resalt['name']; ?></td>
                                                            <td><?php echo $exam_resalt['lms_exam_time_duration'] . "Min"; ?></td>
                                                            <td><?php echo $exam_resalt['lms_exam_question']; ?></td>
                                                            <td><?php echo $row['title']; ?></td>
                                                            <td><img src="../admin/images/lesson/cover/<?php echo $row['cover']; ?>" alt="" width="200" height="100"></td>
                                                            <td><iframe width="200" height="100" src="<?php echo $row['video']; ?>" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></td>
                                                            <td><?php echo date_format(date_create($exam_resalt['lms_exam_add_time']), "M d, Y - h:i:s A"); ?></td>
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


        <!--**********************************
            Footer start
        ***********************************-->
        <div class="footer">
            <div class="copyright">
                <p>Copyright © Designed &amp; Developed by <a href="#" target="_blank">Yogeemedia</a> 2021</p>
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
    <!-- Required vendors -->
    <script src="vendor/global/global.min.js"></script>
    <script src="js/deznav-init.js"></script>
    <script src="vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
    <script src="js/custom.min.js"></script>

    <!-- Datatable -->
    <script src="vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="js/plugins-init/datatables.init.js"></script>

    <!-- Svganimation scripts -->
    <script src="vendor/svganimation/vivus.min.js"></script>
    <script src="vendor/svganimation/svg.animation.js"></script>

</body>

</html>