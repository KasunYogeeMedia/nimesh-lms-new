<?php

if (!isset($_SESSION)) {
    session_start();
}

require_once 'includes.php';

include '../super_admin/dbconfig4.php';

require_once '../super_admin/conn.php';

if (isset($_POST['pay_bt'])) {

    date_default_timezone_set("Asia/Colombo");

    $expiredate = mysqli_real_escape_string($conn, $_POST['expiredate']);

    $userID = mysqli_real_escape_string($conn, $_POST['userID']);

    $amount = mysqli_real_escape_string($conn, $_POST['amount']);

    $pay_type = mysqli_real_escape_string($conn, $_POST['pay_type']);

    $current_time   = date("Y-m-d H:i:s");
    $feeID          = $_POST['feeID'][0];
    $pay_month      = $_POST['expiredate'] . "-01";

    foreach ($_POST['pay_sub_id'] as $value) {

        $pay_sub_id = $value;



        //-----------------------

        $sql = "INSERT INTO

        lmspayment (userID, feeID, pay_sub_id, amount, bank, paymentMethod, created_at, status, pay_type)

        VALUES ('$userID','$feeID','$pay_sub_id','$amount','Pay bank','Manual','$current_time','1','$pay_type')";

        if (mysqli_query($conn, $sql)) {

            $successMSG = "Manual Payment added successfull.";

            header("refresh:2;manual_payments.php"); // redirects image view page after 5 seconds.


        } else {
            $errMSG = "error while inserting....'.$sql.'";
        }
    }
}

if (isset($_GET['remove'])) {

    $pid = mysqli_real_escape_string($conn, $_GET['remove']);

    if (mysqli_query($conn, "DELETE FROM lmspayment WHERE pid='$pid'")) {

        echo "<script>window.location='manual_payments.php';</script>";
    }
}

?>



<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="utf-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width=device-width,initial-scale=1">

    <title>Manual Payments | Online Learning Platforms | Dashboard</title>



    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />



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

            Nav header start

        ***********************************-->

        <!-- <div class="nav-header">

            <a href="index.php" class="brand-logo">

                <img class="logo-abbr" src="images/logo-white.png" alt="">

                <img class="logo-compact" src="images/logo-text-white.png" alt="">

                <img class="brand-title" src="images/logo-text-white.png" alt="">

            </a>



            <div class="nav-control">

                <div class="hamburger">

                    <span class="line"></span><span class="line"></span><span class="line"></span>

                </div>

            </div>

        </div> -->

        <!--**********************************

            Nav header end

        ***********************************-->



        <!--**********************************

            Header start

        ***********************************-->

        <!-- <div class="header">

            <div class="header-content">

                <nav class="navbar navbar-expand">

                    <div class="collapse navbar-collapse justify-content-between">

                        <div class="header-left">



                        </div>



                        <ul class="navbar-nav header-right">

                            <li class="nav-item dropdown header-profile">

                                <a class="nav-link" href="#" role="button" data-toggle="dropdown">

                                    <img src="images/profile/pic1.jpg" width="20" alt="" />

                                </a>

                                <div class="dropdown-menu dropdown-menu-right">

                                    <a href="admin.php" class="dropdown-item ai-icon">

                                        <svg id="icon-user1" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user">
                                            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                            <circle cx="12" cy="7" r="4"></circle>
                                        </svg>

                                        <span class="ml-2"><?php echo $user_name; ?></span>

                                    </a>

                                    <a href="logout.php" class="dropdown-item ai-icon">

                                        <svg id="icon-logout" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-log-out">
                                            <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path>
                                            <polyline points="16 17 21 12 16 7"></polyline>
                                            <line x1="21" y1="12" x2="9" y2="12"></line>
                                        </svg>

                                        <span class="ml-2">Logout </span>

                                    </a>

                                </div>

                            </li>

                        </ul>

                    </div>

                </nav>

            </div>

        </div> -->

        <!--**********************************

            Header end ti-comment-alt

        ***********************************-->



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

                            <h4>All Manual Payments</h4>

                        </div>

                    </div>

                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">

                        <ol class="breadcrumb">

                            <li class="breadcrumb-item"><a href="home.php">Home</a></li>

                            <li class="breadcrumb-item active"><a href="javascript:void(0);">Manual Payments</a></li>

                            <li class="breadcrumb-item active"><a href="javascript:void(0);">All Manual Payments</a></li>

                        </ol>

                    </div>

                </div>



                <div class="row">

                    

                    <div class="col-lg-12">

                        <div class="row tab-content">

                            <div id="list-view" class="tab-pane fade active show col-lg-12">

                                <div class="card border-0 bg-light">

                                    <div class="card-header">

                                        <h4 class="card-title">All Manual Payments</h4>

                                    </div>

                                    <div class="card-body">
                                        <div>
                                            <form class="form-horizontal" action="functions.php" method="post" name="upload_excel" enctype="multipart/form-data">
                                                <div class="form-group">
                                                    <div class="col-md-12 col-md-offset-4" style="text-align:right;">
                                                        <input type="submit" name="Manual" class="btn btn-success" value="export to excel" />
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                        <?php

                                        if (isset($errMSG)) {

                                        ?>

                                            <div class="alert alert-danger alert-dismissible alert-alt solid fade show">
                                                <button type="button" class="close h-100" data-dismiss="alert" aria-label="Close"><span><i class="mdi mdi-close"></i></span></button>
                                                <strong>Error!</strong> <?php echo $errMSG; ?>
                                            </div>

                                        <?php

                                        } else if (isset($successMSG)) {

                                        ?>

                                            <div class="alert alert-success alert-dismissible alert-alt solid fade show">
                                                <button type="button" class="close h-100" data-dismiss="alert" aria-label="Close"><span><i class="mdi mdi-close"></i></span></button>
                                                <strong>Success!</strong> <?php echo $successMSG; ?>.
                                            </div>

                                        <?php

                                        }

                                        ?>

                                        <div class="table-responsive">

                                            <table id="dataTable" class="table table-bordered">

                                                <thead>

                                                    <tr>

                                                        <th>#</th>

                                                        <th>Action</th>

                                                        <th>Status</th>

                                                        <th>Student Name</th>

                                                        <th>Class Fee</th>

                                                        <th>Valid Date - Paid Month</th>

                                                        <th>Pay Date</th>


                                                    </tr>

                                                </thead>

                                                <tbody>

                                                    <?php

                                                    $count = 0;

                                                    $payment_qury = mysqli_query($conn, "SELECT yp.pay_type,yp.pid,yp.status,yr.fullname,yp.amount,yp.created_at,yt.fullname ytfullname,ys.name

FROM lmspayment yp LEFT JOIN lmsregister yr ON yp.userID=yr.reid

INNER JOIN lmstealmsr yt ON yp.feeID=yt.tid

INNER JOIN lmssubject ys ON yp.pay_sub_id=ys.sid

WHERE yp.paymentMethod='Manual'

ORDER BY yp.pid DESC");

                                                    while ($payment_resalt = mysqli_fetch_array($payment_qury)) {

                                                        $count++;

                                                    ?>

                                                        <tr>

                                                            <td><?php echo number_format($count, 0); ?></td>

                                                            <td align="center">

                                                                <a href="manual_payments.php?remove=<?php echo $payment_resalt['pid']; ?>" class="btn btn-sm btn-danger" title="Remove Payment" data-bs-toggle="modal" data-bs-target="#confirmDelete"><i class="fa fa-trash"></i></a>

                                                                <!-- Confirmation Modal -->
                                                                <div class="modal fade" id="confirmDelete" tabindex="-1" aria-labelledby="confirmDeleteLabel" aria-hidden="true">
                                                                    <div class="modal-dialog">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <h5 class="modal-title" id="confirmDeleteLabel">Confirmation</h5>
                                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                Are you sure you want to remove this payment?
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                                                <a href="manual_payments.php?remove=<?php echo $payment_resalt['pid']; ?>" class="btn btn-danger">Delete</a>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>


                                                            </td>



                                                            <td>

                                                                <?php if ($payment_resalt['status'] == 0) { ?>

                                                                    <span style="padding: 5px; font-size: 10px; background-color: darkred; color: #FFFFFF; border-radius: 25px;">Not Approval</span>

                                                                <?php } ?>

                                                                <?php if ($payment_resalt['status'] == 1) { ?>

                                                                    <span style="padding: 5px; font-size: 10px; background-color: darkgreen; color: #FFFFFF; border-radius: 25px;">Approval</span>

                                                                <?php } ?>

                                                            </td>

                                                            <td><?php echo $payment_resalt['fullname']; ?><br><?php echo $payment_resalt['ytfullname']; ?><br><?php echo $payment_resalt['name']; ?></td>

                                                            <td>

                                                                <span style="font-size: 12px; background-color: dodgerblue; padding: 5px; color: #FFFFFF; border-radius: 10px; white-space: nowrap">Pay <?php echo number_format((float)$payment_resalt['amount'], 2); ?></span>

                                                            </td>
                                                            <td><?php echo $payment_resalt['pay_type']; ?></td>
                                                            <td><?php echo date_format(date_create($payment_resalt['created_at']), "M d, Y | h:i:s A"); ?></td>
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

    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

    <script type="text/javascript">
        // In your Javascript (external .js resource or <script> tag)

        $(document).ready(function() {

            $('#feeID').select2({

                placeholder: "Select Teacher",

                allowClear: true

            });

            $('#pay_sub_id').select2({

                placeholder: "Select Course",

                allowClear: true

            });

            $('#userID').select2({

                placeholder: "Select Student",

                allowClear: true

            });


        });
    </script>





</body>

</html>