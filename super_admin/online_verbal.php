<?php

if (!isset($_SESSION)) {
    session_start();
}

require_once 'includes.php';

require_once '../super_admin/conn.php';

require_once '../super_admin/dbconfig4.php';

if (isset($_GET['remove'])) {
    $remove = mysqli_real_escape_string($conn, $_GET['remove']);
    mysqli_query($conn, "DELETE FROM lmsverbal_exam WHERE classid='$remove'");

    // Display Bootstrap alert after deletion
    echo '
    <div class="alert alert-success" role="alert">
      Lesson deleted successfully.
    </div>
    ';

    echo "<script>window.location='online_verbal.php';</script>";
}
?>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Verbal Exam | Online Learning Platforms | Dashboard</title>
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

                                                        <th>Password</th>
                                                        <th>Teacher</th>
                                                        <th>Lesson</th>
                                                        <th>Batch</th>
                                                        <th>Course</th>

                                                        <th>Date</th>
                                                        <th>Start</th>
                                                        <th>End</th>
                                                        <th>Add Time</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php
                                                    $count = 0;
                                                    $list_qury = mysqli_query($conn, "SELECT * FROM lmsverbal_exam INNER JOIN lmstealmsr ON lmsverbal_exam.tealmsr=lmstealmsr.tid ORDER BY classid DESC");

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
                                                                <a href="#" onClick="return confirm('Are you sure you want to delete this lesson?');" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#deleteLessonModal<?php echo $list_resalt['classid']; ?>">
                                                                    <i class="fa fa-lg fa-trash"></i>
                                                                </a>

                                                                <!-- Modal -->
                                                                <div class="modal fade" id="deleteLessonModal<?php echo $list_resalt['classid']; ?>" tabindex="-1" aria-labelledby="deleteLessonModalLabel<?php echo $list_resalt['classid']; ?>" aria-hidden="true">
                                                                    <div class="modal-dialog">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <h5 class="modal-title" id="deleteLessonModalLabel<?php echo $list_resalt['classid']; ?>">Delete Lesson</h5>
                                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                                    <span aria-hidden="true">&times;</span>
                                                                                </button>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                Are you sure you want to delete this lesson?
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                                <a href="online_verbal.php?remove=<?php echo $list_resalt['classid']; ?>" class="btn btn-danger">Delete</a>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td><?php if ($subject_resalt['image'] == "") {
                                                                    $pro_img = "../profile/../admin/images/hd_dp.jpg";
                                                                } else {
                                                                    $pro_img = "../admin/images/class/" . $subject_resalt['image'];
                                                                } ?><img src="<?php echo $pro_img; ?>" class="pro_pick"></td>

                                                            <td>
                                                                <h5><?php echo $list_resalt['classtype']; ?></h5>
                                                            </td>
                                                            <td>
                                                                <h5 class="btn btn-parimary"><?php echo $subject_resalt['cpassword']; ?></h5>
                                                            </td>
                                                            <td style="text-transform: capitalize;"><?php echo $list_resalt['fullname']; ?></td>
                                                            <td style="text-transform: capitalize;"><?php echo $list_resalt['lesson']; ?></td>
                                                            <td style="text-transform: capitalize;"><?php echo $level_resalt['name']; ?></td>
                                                            <td style="text-transform: capitalize;">
                                                                <?php

                                                                $id = $subject_resalt['subject'];

                                                                require_once '../super_admin/dbconfig4.php';

                                                                $query = $DB_con->prepare('SELECT name FROM lmssubject WHERE sid=' . $id);

                                                                $query->execute();

                                                                $result = $query->fetch();

                                                                echo $result['name'];

                                                                ?>
                                                            </td>

                                                            <td><?php echo date_format(date_create($list_resalt['classdate']), "M d, Y"); ?></td>
                                                            <td><?php echo date_format(date_create($list_resalt['class_start_time']), "h:i:s A"); ?></td>
                                                            <td><?php echo date_format(date_create($list_resalt['class_end_time']), "h:i:s A"); ?></td>
                                                            <td><?php echo date_format(date_create($list_resalt['add_date2']), " h:i:s A"); ?></td>

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