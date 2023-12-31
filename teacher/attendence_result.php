<?php
$url = $_SERVER['REQUEST_URI'];
$parts = parse_url($url);
parse_str($parts['query'], $query);
$att_res =  $query['att_res'];
if (!isset($_SESSION)) {
    session_start();
}

// var_dump($att_res);

// require_once '../super_admin/includes.php';

require_once '../super_admin/conn.php';

require_once '../super_admin/dbconfig4.php';

$count_att = mysqli_query($conn, "SELECT COUNT(*) FROM user_attandance WHERE lid = $att_res");
$row = mysqli_fetch_array($count_att);
$total = $row[0];


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
    mysqli_query($conn, "DELETE FROM lmsclass_schlmsle WHERE classid='$remove'");
    echo "<script>window.location='class_schedule.php';</script>";
}
?>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Attendance | Teacher Panel | Online Learning Platforms </title>

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
                            <h4>Total Attendance - <?php echo $total; ?></h4>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="home.php">Home</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0);">Students Attendance</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0);">All Students Attendance</a></li>
                        </ol>
                    </div>
                </div>

                <div class="row">

                    <div class="col-lg-12">
                        <div class="row tab-content">
                            <div id="list-view" class="tab-pane fade active show col-lg-12">
                                <div class="card border-0 bg-light">

                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table id="dataTable" class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>Reg Number</th>
                                                        <th>Student name</th>

                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php
                                                    $count = 0;
                                                    $list_qury = mysqli_query($conn, "SELECT * FROM `lmsregister` INNER JOIN user_attandance ON lmsregister.reid = user_attandance.userid WHERE lid=$att_res; ");

                                                    while ($list_resalt = mysqli_fetch_array($list_qury)) {
                                                        $count++;

                                                    ?>
                                                        <tr>
                                                            <td><?php echo number_format($count, 0); ?></td>
                                                            <td style="text-transform: capitalize;"><?php echo $list_resalt['stnumber']; ?></td>
                                                            <td style="text-transform: capitalize;"><?php echo $list_resalt['fullname']; ?></td>


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
                            <div id="grid-view" class="tab-pane fade col-lg-12">
                                <div class="row">
                                    <tbody>
                                        <?php
                                        $count = 0;
                                        $list_qury = mysqli_query($conn, "SELECT * FROM lmsclass_schlmsle INNER JOIN lmstealmsr ON lmsclass_schlmsle.tealmsr=lmstealmsr.tid where tid='" . $_SESSION['tid'] . "' ORDER BY classid DESC");

                                        while ($list_resalt = mysqli_fetch_array($list_qury)) {
                                            $count++;

                                            $level_qury = mysqli_query($conn, "SELECT * FROM lmsclass WHERE cid='$list_resalt[level]'");
                                            $level_resalt = mysqli_fetch_array($level_qury);

                                            $subject_qury = mysqli_query($conn, "SELECT * FROM lmsclass_schlmsle WHERE classid='$list_resalt[classid]'");
                                            $subject_resalt = mysqli_fetch_array($subject_qury);
                                        ?>
                                            <div class="col-lg-4 col-md-6 col-sm-6 col-12">
                                                <div class="card border-0 bg-light">
                                                    <div class="card-body">
                                                        <div class="text-center">
                                                            <div class="profile-photo">
                                                                <?php if ($subject_resalt['image'] == "") {
                                                                    $pro_img = "../profile/images/hd_dp.jpg";
                                                                } else {
                                                                    $pro_img = "../admin/images/class/" . $subject_resalt['image'];
                                                                } ?><img src="<?php echo $pro_img; ?>" class="pro_pick">
                                                            </div>
                                                            <h3 class="mt-4 mb-1"><strong><?php echo $list_resalt['lesson']; ?></strong></h3>
                                                            <p class="text-muted"><strong>Teacher : <?php echo $list_resalt['fullname']; ?></strong></p>
                                                            <hr>
                                                            <ul class="list-group mb-3 list-group-flush">
                                                                <li class="list-group-item px-0 d-flex justify-content-between">
                                                                    <span class="mb-0">Class Type : </span><strong><?php echo $list_resalt['classtype']; ?></strong>
                                                                </li>
                                                                <li class="list-group-item px-0 d-flex justify-content-between">
                                                                    <span class="mb-0">Password : </span><strong><?php echo $subject_resalt['cpassword']; ?></strong>
                                                                </li>
                                                                <li class="list-group-item px-0 d-flex justify-content-between">
                                                                    <span class="mb-0">Batch : </span><strong><?php echo $level_resalt['name']; ?></strong>
                                                                </li>

                                                                <li class="list-group-item px-0 d-flex justify-content-between">
                                                                    <span class="mb-0">Class : </span><strong><?php

                                                                                                                $id = $subject_resalt['subject'];

                                                                                                                $query = $DB_con->prepare('SELECT name FROM lmssubject WHERE sid=' . $id);

                                                                                                                $query->execute();

                                                                                                                $result = $query->fetch();

                                                                                                                echo $result['name'];

                                                                                                                ?></strong>
                                                                </li>

                                                                <li class="list-group-item px-0 d-flex justify-content-between">
                                                                    <span class="mb-0">Class Time : </span><strong><?php echo date_format(date_create($list_resalt['class_start_time']), "h:i:s A"); ?></strong>
                                                                </li>
                                                                <li class="list-group-item px-0 d-flex justify-content-between">
                                                                    <span class="mb-0">Class Publish Date : </span><strong><?php echo date_format(date_create($list_resalt['classdate']), "M d, Y"); ?></strong>
                                                                </li>
                                                                <li class="list-group-item px-0 d-flex justify-content-between">
                                                                    <span class="mb-0">Month :</span><strong><span style="font-size:14px;"> <?php echo date_format(date_create($list_resalt['add_date2']), "F"); ?></span></strong>
                                                                </li>

                                                                <li class="list-group-item px-0 d-flex justify-content-between">
                                                                    <span class="mb-0">Added Date : </span><strong><?php echo date_format(date_create($list_resalt['add_date']), "M d, Y - h:i:s A"); ?></strong>
                                                                </li>

                                                                <li class="list-group-item px-0 d-flex justify-content-between">
                                                                    <span class="mb-0">Status : </span><strong>
                                                                        <?php

                                                                        if ($list_resalt['classstatus'] == "0") {

                                                                            echo '<button class="btn btn-primary btn-sm" on>Unpublished</button>';
                                                                        } else if ($list_resalt['classstatus'] == "1") {

                                                                            echo '<button class="btn btn-success btn-sm">Published</button>';
                                                                        } else if ($list_resalt['classstatus'] == "2") {

                                                                            echo '<button class="btn btn-warning btn-sm">Done</button>';
                                                                        } else {

                                                                            echo '<button class="btn btn-danger btn-sm">Cancel</button>';
                                                                        }
                                                                        ?></strong>
                                                                </li>

                                                            </ul>
                                                            <a href="<?php echo $list_resalt['classlink']; ?>" target="_blank" class="btn btn-sm btn-secondary btn-rounded mt-3 px-4"><i class="fa fa-lg fa-video-camera"></i></a>
                                                            <a href="add_class_schedule.php?edit=<?php echo $list_resalt['classid']; ?>" class="btn btn-sm btn-primary btn-rounded mt-3 px-4"><i class="fa fa-lg fa-edit"></i></a>
                                                            <a href="class_schedule.php?remove=<?php echo $list_resalt['classid']; ?>" onClick="JavaScript:return confirm('Are your sure delete lesson?');" class="btn btn-sm btn-danger btn-rounded mt-3 px-4"><i class="fa fa-lg fa-trash"></i></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        <?php
                                        }
                                        ?>
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