<?php

if (!isset($_SESSION)) {
    session_start();
}

require_once 'includes.php';

require_once '../super_admin/conn.php';

require_once '../super_admin/dbconfig4.php';

?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Teacher Payments | Online Learning Platforms | Dashboard</title>
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
                            <h4>All Teacher Payments</h4>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="home.php">Home</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0);">Teacher Payments</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0);">All Teacher Payments</a></li>
                        </ol>
                    </div>
                </div>

                <div class="row">

                    <div class="col-lg-12">
                        <div class="row tab-content">
                            <div id="list-view" class="tab-pane fade active show col-lg-12">
                                <div class="card border-0 bg-light">
                                    <div class="card-header">
                                        <h4 class="card-title">All Teacher Payments</h4>
                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <div>
                                                <form class="form-horizontal" action="functions.php" method="post" name="upload_excel" enctype="multipart/form-data">
                                                    <div class="form-group">
                                                        <div class="col-md-12 col-md-offset-4" style="text-align:right;">
                                                            <input type="submit" name="Teacher_Payments" class="btn btn-success" value="export to excel" />
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                            <table id="dataTable" class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Name</th>
                                                        <th>Percentage</th>
                                                        <th>Total Income</th>
                                                        <th>Company Amount</th>
                                                        <th>Teacher Amount</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php
                                                    $tec_qury = mysqli_query($conn, "SELECT * FROM lmstealmsr ORDER BY fullname");
                                                    while ($tec_resalt = mysqli_fetch_array($tec_qury)) {

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
                                                        <tr>
                                                            <td><a href="add_new_teacher_payment.php?id=<?php echo $tec_resalt['tid']; ?>" style="color: darkred; cursor: pointer;"><button type="button" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i> Pay Payment</button></a></td>
                                                            <td><?php if ($tec_resalt['image'] == "") {
                                                                    $pro_img = "../profile/img/pro_pick.png";
                                                                } else {
                                                                    $pro_img = "images/teacher/" . $tec_resalt['image'];
                                                                } ?><img src="<?php echo $pro_img; ?>" class="pro_pick">
                                                                <?php echo $tec_resalt['fullname']; ?></td>
                                                            <td align="right"><?php echo $tec_resalt['Percentage'] . "%"; ?></td>
                                                            <td align="right"><?php echo number_format($a, 2) ?></td>
                                                            <td align="right"><?php echo number_format($d, 2) ?></td>
                                                            <td align="right"><?php echo number_format($c, 2) ?></td>
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

    <!--**********************************
        Scripts
    ***********************************-->
    <!-- Required vendors -->
    <script src="vendor/global/global.min.js"></script>
    <script src="js/deznav-init.js"></script>
    <script src="vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
    <script src="js/custom.min.js"></script>

    <!-- Datatable -->
    <script src="vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="js/plugins-init/datatables.init.js"></script>

    <!-- Svganimation scripts -->
    <script src="vendor/svganimation/vivus.min.js"></script>
    <script src="vendor/svganimation/svg.animation.js"></script>

</body>

</html>