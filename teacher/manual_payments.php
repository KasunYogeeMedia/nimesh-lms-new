<?php

if (!isset($_SESSION)) {
    session_start();
}

require_once 'includes.php';

require_once("../super_admin/conn.php");

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

if (isset($_GET['pid']) && isset($_GET['status'])) {
    $pid = mysqli_real_escape_string($conn, $_GET['pid']);
    $status = mysqli_real_escape_string($conn, $_GET['status']);

    mysqli_query($conn, "UPDATE lmspayment SET status='$status' WHERE pid='$pid'");
    echo "<script>window.location='bank_payments_online.php?pid=$pid';</script>";
}

if (isset($_POST['all_archive'])) {
    mysqli_query($conn, "UPDATE lmspayment SET status='3' WHERE paymentMethod='Online'");
    echo "<script>window.location='bank_payments_online.php';</script>";
}
?>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Manual Payments | Teacher Panel | Online Learning Platforms </title>

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
                        <ul class="nav nav-pills mb-3">
                            <li class="nav-item">
                                <form method="post" class="m-3" autocomplete="off">
                                    <strong>Create New Payment</strong>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td><input type="text" name="userID" id="userID" required class="form-control" placeholder="Select Student" list="stu_list" onChange="JavaScrip:dis_load(this.value);" onKeyUp="JavaScrip:dis_load();" onBlur="JavaScrip:dis_load();"></td>
                                                <td><input type="tel" name="amount" pattern="\d*" required class="form-control" placeholder="Pay amount" onKeyUp="JavaScrip:dis_load(this.value);" onBlur="JavaScrip:dis_load();"></td>
                                                <td>
                                                    <select name="ex_val" id="" required class="form-control">
                                                        <option value="15">15 Day's</option>
                                                        <option value="30" selected>30 Day's</option>
                                                        <option value="60">2 Month's</option>
                                                        <option value="90">3 Month's</option>
                                                        <option value="180">6 Month's</option>
                                                        <option value="360">1 Year's</option>
                                                    </select>
                                                </td>
                                                <td><button name="pay_bt" type="submit" class="btn btn-info">Save Payment</button></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <datalist id="stu_list">
                                        <?php
                                        $select_stu = mysqli_query($conn, "SELECT * FROM lmsregister ORDER BY fullname");
                                        while ($stu_resalt = mysqli_fetch_array($select_stu)) {
                                        ?>
                                            <option value="<?php echo $stu_resalt['reid']; ?>"><?php echo $stu_resalt['fullname']; ?> - <?php echo "0" . (int)$stu_resalt['contactnumber']; ?></option>
                                        <?php
                                        }
                                        ?>
                                    </datalist>

                                </form>
                                <script>
                                    function dis_load() {
                                        var userID = document.getElementById('userID').value;
                                        var xhttp = new XMLHttpRequest();
                                        xhttp.onreadystatechange = function() {
                                            if (this.readyState == 4 && this.status == 200) {
                                                document.getElementById("details_dis").innerHTML = this.responseText;
                                            }
                                        };
                                        xhttp.open("GET", "ajax_details_dis.php?userID=" + userID, true);
                                        xhttp.send();
                                    }
                                </script>

                                <div id="details_dis" class="m-3"></div>
                            </li>
                        </ul>
                    </div>
                    <div class="col-lg-12">
                        <div class="row tab-content">
                            <div id="list-view" class="tab-pane fade active show col-lg-12">
                                <div class="card border-0 bg-light">
                                    <div class="card-header">
                                        <h4 class="card-title">All Manual Payments</h4>
                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table id="dataTable" class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>Action</th>
                                                        <th>Status</th>
                                                        <th>User</th>
                                                        <th>Amount</th>
                                                        <th>Date's</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php
                                                    $count = 0;
                                                    $payment_qury = mysqli_query($conn, "SELECT * FROM lmspayment WHERE paymentMethod='Manual' ORDER BY pid DESC");
                                                    while ($payment_resalt = mysqli_fetch_array($payment_qury)) {
                                                        $count++;

                                                        $user_qury = mysqli_query($conn, "SELECT * FROM lmsregister WHERE reid='$payment_resalt[userID]'");
                                                        $user_resalt = mysqli_fetch_array($user_qury);
                                                    ?>
                                                        <tr>
                                                            <td><?php echo number_format($count, 0); ?></td>
                                                            <td align="center">
                                                                <a href="manual_payments.php?remove=<?php echo $payment_resalt['pid']; ?>" class="btn btn-sm btn-danger" title="Approval Payment" onClick="JavaScript:return confirm('Are your sure remove this payment?');"><i class="fa fa-tralms"></i></a>
                                                                <a href="manual_lmsip.php?bill_name=<?php echo $user_resalt['fullname']; ?>&payment=<?php echo $payment_resalt['amount']; ?>" class="btn btn-sm btn-dark" title="Approval Payment" target="_blank"><i class="fa fa-print"></i></a>
                                                            </td>

                                                            <td>
                                                                <?php if ($payment_resalt['status'] == 0) { ?>
                                                                    <span style="padding: 5px; font-size: 10px; background-color: darkred; color: #FFFFFF; border-radius: 25px;">Not Approval</span>
                                                                <?php } ?>
                                                                <?php if ($payment_resalt['status'] == 1) { ?>
                                                                    <span style="padding: 5px; font-size: 10px; background-color: darkgreen; color: #FFFFFF; border-radius: 25px;">Approval</span>
                                                                <?php } ?>
                                                            </td>
                                                            <td><?php echo $user_resalt['fullname']; ?></td>
                                                            <td>
                                                                <span style="font-size: 12px; background-color: dodgerblue; padding: 5px; color: #FFFFFF; border-radius: 10px;">Pay <?php echo number_format($payment_resalt['amount'], 2); ?></span>
                                                            </td>
                                                            <td>
                                                                Pay: <?php echo date_format(date_create($payment_resalt['created_at']), "M d, Y - h:i:s A"); ?><br>
                                                                Exp.: <?php echo date("M d, Y - h:i:s A", $payment_resalt['expiredate']); ?>
                                                            </td>
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