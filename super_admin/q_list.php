<?php

if (!isset($_SESSION)) {
    session_start();
}

require_once 'includes.php';
require_once '../super_admin/conn.php';
require_once '../super_admin/config.php';
require_once '../super_admin/dbconfig4.php';

if (isset($_GET['remove'])) {
    $id = mysqli_real_escape_string($conn, $_GET['remove']);
    $exam_id = mysqli_real_escape_string($conn, $_GET['exam_id']);
    if (mysqli_query($conn, "DELETE FROM lms_mcq_questions WHERE id='$id'")) {
        header("location:q_list.php?exam_id=$exam_id");
    }
}

$exam_id = mysqli_real_escape_string($conn, $_GET['exam_id']);
$q_qury = mysqli_query($conn, "SELECT * FROM lms_exam_details WHERE lms_exam_id='$exam_id'");
$q_resalt = mysqli_fetch_assoc($q_qury);

$mcq_qury = mysqli_query($conn, "SELECT COUNT(*) total_mcq FROM lms_mcq_questions WHERE exam_id='$exam_id'");
$mcq_resalt = mysqli_fetch_assoc($mcq_qury);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Add Question | Online Learning Platforms | Dashboard</title>
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
                            <h4>Questions List</h4>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.php">Home</a></li>
                            <li class="breadcrumb-item"><a href="javascript:void(0);">Questions List</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0);">Questions List</a></li>
                        </ol>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <div class="card border-0 bg-light">
                            <div class="card-header">
                                <h4 class="card-title">Questions List</h4>
                                <?php if ($q_resalt['lms_exam_question'] <= $mcq_resalt['total_mcq']) {
                                } else { ?><a href="add_question_new.php?exam_id=<?php echo $_GET['exam_id']; ?>" class="btn btn-dark">New questions</a><?php } ?>
                            </div>
                            <div class="card-body">

                                <?php if (isset($_GET['added_success'])) { ?><div class="alert alert-success alert-dismissible alert-alt solid fade show"><strong>Success!</strong> New Question Added Successfully.</div><?php } ?>
                                <?php if (isset($_GET['question_empty'])) { ?><div class="alert alert-danger alert-dismissible alert-alt solid fade show"><strong>Fail!</strong> Please enter your question.</div><?php } ?>

                                Questions: <?php echo $q_resalt['lms_exam_question']; ?>/<?php echo $mcq_resalt['total_mcq']; ?>

                                <?php if ($q_resalt['lms_exam_question'] <= $mcq_resalt['total_mcq']) { ?><br><em class="text-success">All questions are completed for the exam.</em><?php } else { ?><br><em class="text-danger">All questions are not completed for the exam.</em><?php } ?>

                                <table class="table">
                                    <tbody>
                                        <tr>
                                            <td>#No</td>
                                            <td>Action</td>
                                            <td>Questions</td>
                                        </tr>

                                        <?php
                                        $q_count = 0;
                                        $q_list_qury = mysqli_query($conn, "SELECT * FROM lms_mcq_questions WHERE exam_id='$_GET[exam_id]' ORDER BY exam_id");
                                        while ($q_list_resalt = mysqli_fetch_assoc($q_list_qury)) {
                                            $q_count++;
                                        ?>
                                            <tr>
                                                <td><?php echo $q_count; ?></td>
                                                <td style="white-space: normal;">
                                                    <a href="add_question_new.php?id=<?php echo $q_list_resalt['id']; ?>&exam_id=<?php echo $_GET['exam_id']; ?>" class="btn btn-dark btn-sm"><i class="fa fa-edit"></i></a>
                                                    <a href="q_list.php?remove=<?php echo $q_list_resalt['id']; ?>&exam_id=<?php echo $_GET['exam_id']; ?>" class="btn btn-danger btn-sm" onClick="return confirm('Are you sure to remove this question?');"><i class="fa fa-trash"></i></a>
                                                </td>
                                                <td><?php echo $q_list_resalt['question']; ?></td>
                                            </tr>
                                        <?php } ?>
                                    </tbody>
                                </table>


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

    <script src="https://cdn.ckeditor.com/4.16.1/standard/ckeditor.js"></script>

</body>

</html>