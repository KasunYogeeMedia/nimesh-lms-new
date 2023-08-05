<?php

if (!isset($_SESSION)) {
    session_start();
}

require_once 'includes.php';

require_once("../super_admin/conn.php");

require_once("../super_admin/config.php");

require_once '../super_admin/dbconfig4.php';

if (isset($_SESSION['tid'])) {

    $user_qury = mysqli_query($conn, "SELECT * FROM lmstealmsr WHERE tid='$_SESSION[tid]'");

    $user_resalt = mysqli_fetch_array($user_qury);



    if ($user_resalt['image'] == "") {

        $image_path = "../profile/images/hd_dp.jpg";
    } else {

        $image_path = "../admin/images/teacher/" . $user_resalt['image'];
    }
}

if (!isset($_GET['type'])) {
    echo "<script>window.location='home.php';</script>";
}
?>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Bank Payments | Teacher Panel | Online Learning Platforms </title>

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
                            <h4>All <?php if (isset($_GET['type'])) {
                                        echo $_GET['type'];
                                    } ?> Payments</h4>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="home.php">Home</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0);"><?php if (isset($_GET['type'])) {
                                                                                                    echo $_GET['type'];
                                                                                                } ?> Payments</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0);">All <?php if (isset($_GET['type'])) {
                                                                                                        echo $_GET['type'];
                                                                                                    } ?> Payments</a></li>
                        </ol>
                    </div>
                </div>

                <div class="row">

                    <div class="col-lg-12">
                        <div class="row tab-content">
                            <div id="list-view" class="tab-pane fade active show col-lg-12">
                                <div class="card border-0 bg-light">
                                    <div class="card-header">
                                        <h4 class="card-title">All Bank Payments</h4>
                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table id="dataTable" class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>Slip</th>
                                                        <th>Status</th>
                                                        <th>Student</th>
                                                        <th>Batch/Course</th>
                                                        <th>Class Fee</th>
                                                        <th>Pay Date</th>
                                                        <th>Pay Month</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php
                                                    $count = 0;
                                                    $total = 0;
                                                    $list_qury = mysqli_query($conn, "SELECT yp.status,yr.contactnumber,yr.fullname,yc.name ycname,ys.name ysname,yp.amount,yp.accountnumber,yp.fileName,yp.bank,yp.branch,yp.created_at FROM lmspayment yp INNER JOIN lmsregister yr ON yp.userID=yr.reid INNER JOIN lmssubject ys ON yp.pay_sub_id=ys.sid INNER JOIN lmsclass yc ON ys.class_id=yc.cid WHERE yp.feeID='$_SESSION[tid]' and yp.paymentMethod='$_GET[type]' and yp.status = '1' ORDER BY yp.pid DESC");

                                                    while ($list_resalt = mysqli_fetch_assoc($list_qury)) {
                                                        $count++;
                                                        $total = $total + $list_resalt['amount'];

                                                    ?>

                                                        <td><?php echo $count; ?></td>
                                                        <td><a href="<?php echo "$url/profile/uploadslip/" . $list_resalt['fileName']; ?>" target="_blank" class="btn btn-sm btn-dark"><i class="fa fa-print"></i></a></td>
                                                        <td>
                                                            <?php if ($list_resalt['status'] == 0) { ?>
                                                                <span>Not Approval</span>
                                                            <?php } ?>
                                                            <?php if ($list_resalt['status'] == 1) { ?>
                                                                <span>Approval</span>
                                                            <?php } ?>
                                                        </td>
                                                        <td><?php echo $list_resalt['contactnumber']; ?><br><?php echo $list_resalt['fullname']; ?></td>
                                                        <td><?php echo $list_resalt['ycname']; ?><br><?php echo $list_resalt['ysname']; ?></td>
                                                        <td align="right"><?php echo number_format((float)$list_resalt['amount'], 2); ?></td>
                                                        <td><?php echo date_format(date_create($list_resalt['created_at']), "Y-m-d h:i:s A"); ?></td>
                                                        <td><span style="font-size:14px;"> <?php echo date_format(date_create($list_resalt['pay_month']), "F"); ?></span></td>
                                                        </tr>
                                                    <?php
                                                    }
                                                    ?>
                                                </tbody>
                                                <tfoot>
                                                    <tr class="table-active">
                                                        <td><?php echo $count; ?></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td align="right"><?php echo number_format((float)$total, 2); ?></td>
                                                        <td></td>

                                                        <td></td>
                                                    </tr>
                                                </tfoot>
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