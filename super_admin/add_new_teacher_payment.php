<?php

if (!isset($_SESSION)) {
    session_start();
}

require_once 'includes.php';

require_once '../super_admin/conn.php';

require_once '../super_admin/config.php';

require_once '../super_admin/dbconfig4.php';

date_default_timezone_set("Asia/Colombo");
$id = mysqli_real_escape_string($conn, $_GET['id']);

if (isset($_POST['pay_bt'])) {
    $lms_teacher_payment_history_time = date("Y-m-d H:i:s");
    $lms_teacher_payment_history_amount = mysqli_real_escape_string($conn, $_POST['lms_teacher_payment_history_amount']);
    $lms_teacher_payment_company_amount = mysqli_real_escape_string($conn, $_POST['lms_teacher_payment_company_amount']);
    mysqli_query($conn, "INSERT INTO lms_teacher_payment_history(lms_teacher_payment_history_tid, lms_teacher_payment_company_amount, lms_teacher_payment_history_amount, lms_teacher_payment_history_time) VALUES ('$id','$lms_teacher_payment_company_amount','$lms_teacher_payment_history_amount','$lms_teacher_payment_history_time')");
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Add Add Teacher Payment | Online Learning Platforms | Dashboard</title>
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
                            <h4>Add Add Teacher Payment</h4>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.php">Home</a></li>
                            <li class="breadcrumb-item"><a href="javascript:void(0);">Add Teacher Payment</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0);">Add Add Teacher Payment</a></li>
                        </ol>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <div class="card border-0 bg-light">
                            <div class="card-header">
                                <h4 class="card-title">Add Add Teacher Payment</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">

                                    <?php
                                    $tec_qury = mysqli_query($conn, "SELECT * FROM lmstealmsr WHERE tid='$id'");
                                    $tec_resalt = mysqli_fetch_array($tec_qury);

                                    $income_qury = mysqli_query($conn, "SELECT SUM(amount) as total_income FROM lmspayment WHERE feeID='$tec_resalt[tid]' and status='1'");
                                    $icome_resalt = mysqli_fetch_array($income_qury);

                                    $pay_qury = mysqli_query($conn, "SELECT SUM(lms_teacher_payment_history_amount) as total_pay FROM lms_teacher_payment_history WHERE lms_teacher_payment_history_tid='$tec_resalt[tid]'");
                                    $pay_resalt = mysqli_fetch_array($pay_qury);

                                    $pay_qury1 = mysqli_query($conn, "SELECT SUM(lms_teacher_payment_company_amount) as total_pay1 FROM lms_teacher_payment_history WHERE lms_teacher_payment_history_tid='$tec_resalt[tid]'");
                                    $pay_resalt1 = mysqli_fetch_array($pay_qury1);

                                    $a = $icome_resalt['total_income'] - ($pay_resalt['total_pay'] + $pay_resalt1['total_pay1']);

                                    $b = $a / 100 * $tec_resalt['Percentage'];

                                    $c = $a - $b;

                                    $d = $a - $c;

                                    ?>


                                    <form method="post">
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td>Company Rate<br><input type="text" name="lms_teacher_payment_company_amount" class="form-control" required value="<?php echo $d; ?>"></td>
                                                    <td></td>
                                                </tr>

                                                <tr>
                                                    <td>Payment<br><input type="text" name="lms_teacher_payment_history_amount" class="form-control" required value="<?php echo $c; ?>"></td>
                                                    <td><br><button type="submit" name="pay_bt" class="btn btn-success">Pay</button></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </form><br>

                                    <div class="table-responsive">
                                        <table id="dataTable" class="table table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Time</th>
                                                    <th>Amount</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php
                                                $payment_qury = mysqli_query($conn, "SELECT * FROM lms_teacher_payment_history WHERE lms_teacher_payment_history_tid='$id' ORDER BY lms_teacher_payment_history_id DESC");
                                                while ($payment_resalt = mysqli_fetch_array($payment_qury)) {
                                                ?>
                                                    <tr>
                                                        <td align="center"><a href="" style="color: darkred;"><i class="fa fa-trash fa-lg"></i></a></td>
                                                        <td><?php echo date_format(date_create($payment_resalt['lms_teacher_payment_history_time']), "M d, Y - h:i:s A"); ?></td>
                                                        <td><?php echo number_format($payment_resalt['lms_teacher_payment_history_amount'], 2); ?></td>
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

    <?php
    require_once 'footerjs.php';
    ?>


</body>

</html>