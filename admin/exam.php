<?php

if (!isset($_SESSION)) {
    session_start();
}

require_once 'includes.php';

require_once '../super_admin/conn.php';

require_once '../super_admin/dbconfig4.php';

if (isset($_GET['remove'])) {
    $remove = mysqli_real_escape_string($conn, $_GET['remove']);
    if (mysqli_query($conn, "DELETE FROM lms_exam_details WHERE lms_exam_id='$remove'")) {
        echo "<script>window.location='exam.php?removed';</script>";
    }
}

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
        <div class="content-body bg-lblue">
            <!-- row -->
            <div class="container-fluid">

                <div class="row page-titles mx-0">
                    <div class="col-sm-6 p-md-0">
                        <div class="welcome-text">
                            <h4>All Exams</h4>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="home.php">Home</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0);">Exams</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0);">All Exams</a></li>
                        </ol>
                    </div>
                </div>

                <div class="row">

                    <div class="col-lg-12">
                        <div class="row tab-content">
                            <div id="list-view" class="tab-pane fade active show col-lg-12">
                                <div class="card border-0 bg-light">
                                    <div class="card-header">
                                        <h4 class="card-title">All Exams</h4>
                                        <a href="new_exam.php" class="btn btn-square btn-secondary">+ Add Exams</a>
                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table id="dataTable" class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>Action</th>
                                                        <th>EXAM</th>
                                                        <th>TEACHER</th>
                                                        <th>SUBJECT</th>
                                                        <th>TYPE</th>
                                                        <th>TIME DURATION</th>
                                                        <th>QUESTIONS PER PAPER</th>
                                                        <th>ADD TIME</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php
                                                    $join_str = "lms_exam_details INNER JOIN lmssubject ON lms_exam_details.lms_exam_subject=lmssubject.sid";
                                                    $exam_qury = mysqli_query($conn, "SELECT * FROM $join_str ORDER BY lms_exam_id DESC");
                                                    while ($exam_resalt = mysqli_fetch_array($exam_qury)) {
                                                    ?>
                                                        <tr>
                                                            <td style="white-space: normal;">
                                                                <a href="q_list.php?exam_id=<?php echo $exam_resalt['lms_exam_id']; ?>" class="btn btn-sm btn-success" title="Add question"><i class="fa fa-question"></i></a>
                                                                <a href="new_exam.php?lms_exam_id=<?php echo $exam_resalt['lms_exam_id']; ?>" class="btn btn-sm btn-primary" title="Test Exam"><i class="fa fa-edit"></i></a>
                                                                <a href="#" class="btn btn-sm btn-danger" title="Test Exam" onClick="return confirm('Are you sure you want to remove this exam?');" data-toggle="modal" data-target="#removeExamModal<?php echo $exam_resalt['lms_exam_id']; ?>">
                                                                    <i class="fa fa-trash-o"></i>
                                                                </a>

                                                                <!-- Modal -->
                                                                <div class="modal fade" id="removeExamModal<?php echo $exam_resalt['lms_exam_id']; ?>" tabindex="-1" aria-labelledby="removeExamModalLabel<?php echo $exam_resalt['lms_exam_id']; ?>" aria-hidden="true">
                                                                    <div class="modal-dialog">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <h5 class="modal-title" id="removeExamModalLabel<?php echo $exam_resalt['lms_exam_id']; ?>">Remove Exam</h5>
                                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                                    <span aria-hidden="true">&times;</span>
                                                                                </button>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                Are you sure you want to remove this exam?
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                                <a href="exam.php?remove=<?php echo $exam_resalt['lms_exam_id']; ?>" class="btn btn-danger">Remove</a>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </td>
                                                            <td><?php echo $exam_resalt['lms_exam_name']; ?></td>
                                                            <td><?php

                                                                $id = $exam_resalt['lms_exam_add_user'];

                                                                $query = $DB_con->prepare('SELECT fullname FROM lmstealmsr WHERE tid=' . $id);

                                                                $query->execute();

                                                                $result = $query->fetch();

                                                                echo $result['fullname'];

                                                                ?></td>
                                                            <td><?php echo $exam_resalt['name']; ?></td>
                                                            <td>
                                                                <?php

                                                                if ($exam_resalt['lms_exam_pay_type'] == "0") {

                                                                    echo '<button class="btn btn-primary btn-sm">Free</button>';
                                                                } else if ($exam_resalt['lms_exam_pay_type'] == "1") {

                                                                    echo '<button class="btn btn-success btn-sm">Payed</button>';
                                                                }

                                                                ?>
                                                            </td>
                                                            <td><?php echo $exam_resalt['lms_exam_time_duration'] . "Min"; ?></td>
                                                            <td><?php echo $exam_resalt['lms_exam_question']; ?></td>
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