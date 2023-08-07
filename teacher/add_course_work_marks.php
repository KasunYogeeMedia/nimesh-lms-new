<?php

if (!isset($_SESSION)) {
    session_start();
}

require_once 'includes.php';

require_once '../super_admin/conn.php';

require_once '../super_admin/config.php';

require_once '../super_admin/dbconfig4.php';

date_default_timezone_set("Asia/Colombo");
$current_time = date("Y-m-d H:i:s");

$GLOBALS['conn'] = $conn;
function check_resalt($exam_id, $user_id, $description)
{
    $q_qury = mysqli_query($GLOBALS['conn'], "SELECT * FROM course_work_marks p WHERE p.exam_id='$exam_id' AND p.user_id='$user_id' AND p.description='$description'");
    if (mysqli_num_rows($q_qury) > 0) {
        $q_resalt = mysqli_fetch_assoc($q_qury);
        $answerstatus = $q_resalt['answerstatus'];
    } else {
        $answerstatus = "";
    }
    return ($answerstatus);
}

if (isset($_GET['id'])) {
    $id = mysqli_real_escape_string($conn, $_GET['id']);
    $view_paper = mysqli_query($conn, "SELECT es.id,es.filename,r.fullname,r.contactnumber,ex.examname,r.reid,es.marks,es.remark
FROM course_work_submissions es LEFT JOIN lmsregister r ON es.user_id=r.reid
LEFT JOIN lmscourse_work ex ON es.exam_id=ex.exid
WHERE es.id='$id'");
    $view_resalt = mysqli_fetch_assoc($view_paper);

    $check_qury = mysqli_query($conn, "SELECT * FROM course_work_marks WHERE exam_id='$view_resalt[id]' AND user_id='$view_resalt[reid]'");
    if (!mysqli_num_rows($check_qury) > 0) {
        if (mysqli_query($conn, "UPDATE course_work_submissions SET marks='100',remark='',status='1' WHERE id='$id'")) {
        }
    }
} else {
    echo "Error! Something is wrong. Please go to the <a href='home.php'>main page.</a>";
    exit();
}

if (isset($_POST['submit_btn'])) {
    $id = mysqli_real_escape_string($conn, $_GET['id']);

    // if (mysqli_query($conn, "DELETE FROM course_work_marks WHERE exam_id='$view_resalt[id]' AND user_id='$view_resalt[reid]'")) {



    $remark = mysqli_real_escape_string($conn, $_POST['remark']);
    $marks = mysqli_real_escape_string($conn, $_POST['marks']);
    mysqli_query($conn, "UPDATE course_work_submissions SET marks='$marks',remark='$remark',status='1' WHERE id='$id'");
    header("location:course_work_submissions.php");
    // var_dump("UPDATE course_work_submissions SET marks='$marks',remark='$remark',status='1' WHERE id='$id'");
    // }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>View Answers and Add Marks | Online Learning Platforms | Dashboard</title>
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
            <div class="container-fluid bg-lblue">

                <div class="row page-titles mx-0">
                    <div class="col-sm-6 p-md-0">
                        <div class="welcome-text">
                            <h4>View Answers and Add Marks</h4>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.php">Home</a></li>
                            <li class="breadcrumb-item"><a href="javascript:void(0);">Class Tute</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0);">View Answers and Add Marks</a></li>
                        </ol>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-8">

                        <div class="card border-0 bg-light">
                            <div class="card-header">
                                <h4 class="card-title">View Answers Sheet</h4>
                            </div>
                            <div class="card-body">
                                <strong>Student Details</strong><br>

                                Name: <strong><?php echo $view_resalt['fullname']; ?></strong><br>
                                Contact: <strong><?php echo "0" . (int)$view_resalt['contactnumber']; ?></strong><br><br>

                                <?php
                                $image_count = 0;
                                foreach (json_decode($view_resalt['filename']) as $filename) {
                                    $image_count++;
                                ?>
                                    <p><?php echo "Image " . $image_count; ?></p>
                                    <img src="../profile/uploadImg/paper/<?php echo $filename; ?>" class="w-100 mb-4" style="border: 1px solid #CCCCCC;">
                                <?php
                                }
                                ?>


                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="card border-0 bg-light">
                            <div class="card-header">
                                <h4 class="card-title">Marks Paper</h4>
                                <hr>
                            </div>
                            <div class="card-body">

                                <form method="POST">
                                    <div class="row">
                                        <div class="col-12">
                                            <strong>Exam Details</strong><br>
                                            Name <strong><?php echo $view_resalt['examname']; ?></strong><br>

                                            Marks/Batch <span></span>
                                            <input type="text" name="marks" value="<?php echo $view_resalt['marks']; ?>"></br>




                                            Remark

                                            <textarea name=" remark" rows="4" class="form-control" id="remark"><?php echo $view_resalt['remark']; ?></textarea>

                                            <button name="submit_btn" type="submit" class="btn btn-success text-white mt-2">Submit</button>
                                        </div>
                                    </div>
                                </form>
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