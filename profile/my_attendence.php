<?php

if (!isset($_SESSION)) {
    session_start();
}

require_once '../super_admin/dbconfig4.php';

require_once("../super_admin/config.php");

include '../super_admin/conn.php';

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
    <meta name="viewport" content="width=device-width, shrink-to-fit=9">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Past Months Class Videos | Online Learning Platforms | Student Panel</title>
    <?php
    require_once 'headercss.php';
    ?>
</head>

<body>



    <?php
    require_once 'sidebarmenu.php';
    ?>

    <!--**********************************
            Content body start
        ***********************************-->
    <div class="content-body bg-lblue">
        <div class="row m-0">
            <div class="col-sm-12 col-md-9 col-lg-9 col-xl-9 col-xxl-9 pt-4">
                <!-- row -->

                <div class="row page-titles mx-0">
                    <div class="col-sm-6 p-md-0">
                        <div class="welcome-text">
                            <h4>Students Attendence</h4>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="home.php">Home</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0);">Students Attendence</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0);">All Students Attendence</a></li>
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
                                                       
                                                        <th>Lesson</th>

                                                        
                                                        <th>Start</th>
                                                        <th>End</th>
                                                        <th>Student Presant Date</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php
                                                    $count = 0;
                                                    $list_qury = mysqli_query($conn, "SELECT lmsregister.*, user_attandance.*
                                                    FROM lmsregister
                                                    INNER JOIN user_attandance ON lmsregister.reid = user_attandance.userid
                                                    INNER JOIN lmsclass_schlmsle ON lmsclass_schlmsle.classid = user_attandance.lid
                                                    ORDER BY classid DESC");

                                                    while ($list_resalt = mysqli_fetch_array($list_qury)) {
                                                        $count++;


                                                    ?>
                                                        <tr>
                                                            <td><?php echo number_format($count, 0); ?></td>
                                                          
                                                            <td style="text-transform: capitalize;"><?php echo $list_resalt['lesson']; ?></td>
                                                    
                                                           
                                                            <td><?php echo date_format(date_create($list_resalt['class_start_time']), "h:i:s A"); ?></td>
                                                            <td><?php echo date_format(date_create($list_resalt['class_end_time']), "h:i:s A"); ?></td>
                                                            <td><?php echo date_format(date_create($list_resalt['date']), " h:i:s A"); ?></td>

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
            <div class="col-sm-12 col-md-3 col-lg-3 col-xl-3 col-xxl-3 bg-light rounded-left pt-4">
                <?php
                require_once 'right-sidebar.php';
                ?>
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