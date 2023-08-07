<?php

if (!isset($_SESSION)) {
    session_start();
}

require_once 'includes.php';

require_once '../super_admin/dbconfig4.php';

require_once("../super_admin/conn.php");

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
    echo "<script>window.location='verbal.php';</script>";
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
                                        <h4 class="card-title">All Verbal Exam </h4>
                                        <a href="add_online_verbal_exams.php" class="btn btn-square btn-secondary">+ Add Verbal Exam</a>
                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table id="dataTable" class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>Action</th>
                                                        <th>Cover</th>
                                                        <th>Status</th>
                                                        <th>Class Type</th>
                                                        <th>Teacher</th>
                                                        <th>Lesson</th>
                                                        <th>Batch</th>
                                                        <th>Course</th>
                                                        <th>Month</th>
                                                        <th>Date</th>
                                                        <th>Start</th>
                                                        <th>End</th>
                                                        <th>Add Time</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php
                                                    $count = 0;
                                                    $list_qury = mysqli_query($conn, "SELECT * FROM lmsverbal_exam INNER JOIN lmstealmsr ON lmsverbal_exam.tealmsr=lmstealmsr.tid where tid='" . $_SESSION['tid'] . "' ORDER BY classid DESC");

                                                    while ($list_resalt = mysqli_fetch_array($list_qury)) {
                                                        $count++;

                                                        $level_qury = mysqli_query($conn, "SELECT * FROM lmsclass WHERE cid='$list_resalt[level]'");
                                                        $level_resalt = mysqli_fetch_array($level_qury);

                                                        $subject_qury = mysqli_query($conn, "SELECT * FROM lmsverbal_exam WHERE classid='$list_resalt[classid]'");
                                                        $subject_resalt = mysqli_fetch_array($subject_qury);
                                                    ?>
                                                        <tr>
                                                            <td><?php echo number_format($count, 0); ?></td>
                                                            <td align="center">
                                                                <a href="<?php echo $list_resalt['classlink']; ?>" target="_blank" class="btn btn-sm btn-secondary mb-1"><i class="fa fa-lg fa-video-camera"></i></a>
                                                                <a href="add_online_verbal_exams.php?edit=<?php echo $list_resalt['classid']; ?>" class="btn btn-sm btn-primary mb-1"><i class="fa fa-lg fa-edit"></i></a>
                                                                <!-- Button trigger modal -->
                                                                <a href="#" class="btn btn-sm btn-danger mb-1" data-bs-toggle="modal" data-bs-target="#deleteConfirmationModal<?php echo $list_resalt['classid']; ?>">
                                                                    <i class="fa fa-lg fa-trash"></i>
                                                                </a>

                                                                <!-- Modal -->
                                                                <div class="modal fade" id="deleteConfirmationModal<?php echo $list_resalt['classid']; ?>" tabindex="-1" aria-labelledby="deleteConfirmationModalLabel" aria-hidden="true">
                                                                    <div class="modal-dialog">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <h5 class="modal-title" id="deleteConfirmationModalLabel">Delete Lesson</h5>
                                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                <p>Are you sure you want to delete this lesson?</p>
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                                                <a href="verbal.php?remove=<?php echo $list_resalt['classid']; ?>" class="btn btn-danger">Delete</a>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <a href="verbal_exam.php?exam=<?php echo $list_resalt['level']; ?>" target="_blank" class="btn btn-sm btn-secondary"><i class="fa fa-lg fa-pencil "></i></a>
                                                            </td>
                                                            <td><?php if ($subject_resalt['image'] == "") {
                                                                    $pro_img = "../profile/images/hd_dp.jpg";
                                                                } else {
                                                                    $pro_img = "../admin/images/class/" . $subject_resalt['image'];
                                                                } ?><img src="<?php echo $pro_img; ?>" class="pro_pick"></td>
                                                            <td><?php

                                                                if ($list_resalt['classstatus'] == "0") {

                                                                    echo '<button class="btn btn-primary btn-sm" on>Unpublished</button>';
                                                                } else if ($list_resalt['classstatus'] == "1") {

                                                                    echo '<button class="btn btn-success btn-sm">Published</button>';
                                                                } else if ($list_resalt['classstatus'] == "2") {

                                                                    echo '<button class="btn btn-warning btn-sm">Done</button>';
                                                                } else {

                                                                    echo '<button class="btn btn-danger btn-sm">Cancel</button>';
                                                                }
                                                                ?></td>
                                                            <td>
                                                                <h5><?php echo $list_resalt['classtype']; ?></h5>
                                                            </td>
                                                            <td style="text-transform: capitalize;"><?php echo $list_resalt['fullname']; ?></td>
                                                            <td style="text-transform: capitalize;"><?php echo $list_resalt['lesson']; ?></td>
                                                            <td style="text-transform: capitalize;"><?php echo $level_resalt['name']; ?></td>
                                                            <td style="text-transform: capitalize;">
                                                                <?php

                                                                $id = $subject_resalt['subject'];

                                                                $query = $DB_con->prepare('SELECT name FROM lmssubject WHERE sid=' . $id);

                                                                $query->execute();

                                                                $result = $query->fetch();

                                                                echo $result['name'];

                                                                ?>
                                                            </td>
                                                            <td><span style="font-size:14px;"> <?php echo date_format(date_create($list_resalt['add_date2']), "F"); ?></span></td>
                                                            <td><?php echo date_format(date_create($list_resalt['classdate']), "M d, Y"); ?></td>
                                                            <td><?php echo date_format(date_create($list_resalt['class_start_time']), "h:i:s A"); ?></td>
                                                            <td><?php echo date_format(date_create($list_resalt['class_end_time']), "h:i:s A"); ?></td>
                                                            <td><?php echo date_format(date_create($list_resalt['add_date2']), "h:i:s A"); ?></td>

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


</body>

</html>