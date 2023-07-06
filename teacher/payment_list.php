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

        $image_path = "../super_admin/images/teacher/" . $user_resalt['image'];
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
                        <ul class="nav nav-pills mb-3">
                            <!--<li class="nav-item"><a href="#list-view" data-toggle="tab" class="nav-link btn-primary mr-1 show active">List View</a></li>-->
                            <!--<li class="nav-item"><a href="#grid-view" data-toggle="tab" class="nav-link btn-primary">Grid View</a></li>-->
                        </ul>
                    </div>
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
                                                    $list_qury = mysqli_query($conn, "SELECT yp.status,yr.contactnumber,yr.fullname,yc.name ycname,ys.name ysname,yp.amount,yp.accountnumber,yp.fileName,yp.bank,yp.branch,yp.created_at,yp.expiredate,yp.pay_month FROM lmspayment yp INNER JOIN lmsregister yr ON yp.userID=yr.reid INNER JOIN lmssubject ys ON yp.pay_sub_id=ys.sid INNER JOIN lmsclass yc ON ys.class_id=yc.cid WHERE yp.feeID='$_SESSION[tid]' and yp.paymentMethod='$_GET[type]' and yp.status = '1' ORDER BY yp.pid DESC");

                                                    while ($list_resalt = mysqli_fetch_assoc($list_qury)) {
                                                        $count++;
                                                        $total = $total + $list_resalt['amount'];

                                                    ?>

                                                        <td><?php echo $count; ?></td>
                                                        <td><a href="<?php echo "$url/profile/uploadslip/" . $list_resalt['fileName']; ?>" target="_blank" class="btn btn-sm btn-dark"><i class="fa fa-print"></i></a></td>
                                                        <td>
                                                            <?php if ($list_resalt['status'] == 0) { ?>
                                                                <span class="badge badge-danger text-white">Not Approval</span>
                                                            <?php } ?>
                                                            <?php if ($list_resalt['status'] == 1) { ?>
                                                                <span class="badge badge-success text-white">Approval</span>
                                                            <?php } ?>
                                                        </td>
                                                        <td><?php echo $list_resalt['contactnumber']; ?><br><?php echo $list_resalt['fullname']; ?></td>
                                                        <td><?php echo $list_resalt['ycname']; ?><br><?php echo $list_resalt['ysname']; ?></td>
                                                        <td align="right"><?php echo number_format((float)$list_resalt['amount'], 2); ?></td>
                                                        <td><?php echo date_format(date_create($list_resalt['created_at']), "Y-m-d h:i:s A"); ?></td>
                                                        <td><span class="badge badge-secondary" style="font-size:14px;"> <?php echo date_format(date_create($list_resalt['pay_month']), "F"); ?></span></td>
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
                            <div id="grid-view" class="tab-pane fade col-lg-12">
                                <div class="row">
                                    <tbody>
                                        <?php
                                        $count = 0;
                                        $payment_qury = mysqli_query($conn, "SELECT * FROM lmspayment WHERE paymentMethod='Bank' ORDER BY status ASC");
                                        while ($payment_resalt = mysqli_fetch_array($payment_qury)) {
                                            $count++;

                                            $user_qury = mysqli_query($conn, "SELECT * FROM lmsregister WHERE reid='$payment_resalt[userID]'");
                                            $user_resalt = mysqli_fetch_array($user_qury);
                                        ?>
                                            <div class="col-lg-4 col-md-6 col-sm-6 col-12">
                                                <div class="card border-0 bg-light">
                                                    <div class="card-body">
                                                        <div class="text-center">
                                                            <div class="profile-photo">

                                                                <a href="<?php echo "https://guruniwasa.lk/profile/uploadslip/" . $payment_resalt['fileName']; ?>" target="_blank" class="badge badge-primary">View Slip</a>
                                                            </div>
                                                            <h3 class="mt-4 mb-1"><strong><?php echo $user_resalt['fullname']; ?></strong></h3>
                                                            <p class="text-muted"><strong>Course/Batch : <?php
                                                                                                            $sub_qury = mysqli_query($conn, "SELECT * FROM lmssubject WHERE sid='$payment_resalt[pay_sub_id]'");
                                                                                                            while ($sub_resalt = mysqli_fetch_array($sub_qury)) {
                                                                                                            ?> <?php echo $sub_resalt['name']; ?>

                                                                        -

                                                                        <?php
                                                                                                                $cl_qury = mysqli_query($conn, "SELECT * FROM lmsclass WHERE cid='$sub_resalt[class_id]'");
                                                                                                                while ($cl_resalt = mysqli_fetch_array($cl_qury)) {
                                                                        ?> <?php echo $cl_resalt['name']; ?> <?php }
                                                                                                            } ?>
                                                                </strong></p>
                                                            <hr>
                                                            <ul class="list-group mb-3 list-group-flush">
                                                                <li class="list-group-item px-0 d-flex justify-content-between">
                                                                    <span class="mb-0">Class Fee : </span><strong>Pay Rs.<?php echo number_format($payment_resalt['amount'], 2); ?></strong>
                                                                </li>
                                                                <li class="list-group-item px-0 d-flex justify-content-between">
                                                                    <span class="mb-0">Bank/Branch : </span><strong><?php echo $payment_resalt['bank']; ?></strong>
                                                                </li>
                                                                <li class="list-group-item px-0 d-flex justify-content-between">
                                                                    <span class="mb-0">Institute : </span><strong><?php echo $payment_resalt['branch']; ?></strong>
                                                                </li>
                                                                <li class="list-group-item px-0 d-flex justify-content-between">
                                                                    <span class="mb-0">Pay Date : </span><strong><?php echo date_format(date_create($payment_resalt['created_at']), "M d, Y - h:i:s A"); ?></strong>
                                                                </li>
                                                                <li class="list-group-item px-0 d-flex justify-content-between">
                                                                    <span class="mb-0">Status : </span><strong>
                                                                        <?php if ($payment_resalt['status'] == 0) { ?>
                                                                            <span class="badge badge-warning">Not Approval</span>
                                                                        <?php } ?>
                                                                        <?php if ($payment_resalt['status'] == 1) { ?>
                                                                            <span class="badge badge-success">Approval</span>
                                                                        <?php } ?></strong>
                                                                </li>

                                                            </ul>
                                                            <?php if ($payment_resalt['status'] == 0) { ?>
                                                                <a href="bank_payaments.php?id=<?php echo $payment_resalt['pid']; ?>&status=1&mobile=<?php echo "0" . (int)$user_resalt['contactnumber']; ?>" title="Approval Payment" onClick="JavaScript:return confirm('Are your sure change this payment status?');" class="badge badge-success btn-rounded mt-3 px-4"><i class="fa fa-check"></i> Approval</a>
                                                            <?php } ?>
                                                            <?php if ($payment_resalt['status'] == 1) { ?>
                                                                <a href="bank_payaments.php?id=<?php echo $payment_resalt['pid']; ?>&status=0" title="Unapproval Payment" onClick="JavaScript:return confirm('Are your sure change this payment status?');" class="badge badge-danger btn-rounded mt-3 px-4"><i class="la la-trash-o"></i> Reject</a>
                                                            <?php } ?>
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