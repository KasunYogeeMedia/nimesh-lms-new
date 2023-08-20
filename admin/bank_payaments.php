<?php

if (!isset($_SESSION)) {
    session_start();
}

require_once 'includes.php';

include '../super_admin/dbconfig4.php';

require_once '../super_admin/conn.php';

if (isset($_GET['id'])) {

    $id = mysqli_real_escape_string($conn, $_GET['id']);
    $status = mysqli_real_escape_string($conn, $_GET['status']);

    if ($status == 1) {
        $to = "+94" . (int)$_GET['mobile'];
        $message_text = "We have approved your payment.Your classes and learning materials are unlocked now.";
        $message = urlencode($message_text);
        send_sms($to, $message_text);

        echo "<img src=''>";
    } else if ($status == 2) {
        $to = "+94" . (int)$_GET['mobile'];
        $message_text = "We regret to inform you that your payment is got rejected. Please contact 0773851246 for more details.";
        $message = urlencode($message_text);
        send_sms($to, $message_text);

        echo "<img src=''>";
    }

    mysqli_query($conn, "UPDATE lmspayment SET status='$status' WHERE pid='$id'");
    //echo "<script>window.location='bank_payments.php';</script>";

}

?>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Bank Payments | Online Learning Platforms | Dashboard</title>
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
        <div class="content-body bg-lblue">
            <!-- row -->
            <div class="container-fluid">

                <div class="row page-titles mx-0">
                    <div class="col-sm-6 p-md-0">
                        <div class="welcome-text">
                            <h4>Bank Payments</h4>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="home.php">Home</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0);">Pending Bank Payments</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0);">Pending Bank Payments</a></li>
                        </ol>
                    </div>
                </div>

                <div class="mb-3">
                    <a href="paid_bank_payaments.php" class="btn btn-success">Paid Payments</a>
                    <a href="reject_bank_payaments.php" class="btn btn-danger">Reject Payments</a>
                </div>

                <div class="row">

                    <div class="col-lg-12">
                        <div class="row tab-content">
                            <div id="list-view" class="tab-pane fade active show col-lg-12">
                                <div class="card border-0 bg-light">
                                    <div class="card-header">
                                        <h4 class="card-title">Pending Bank Payments</h4>
                                    </div>
                                    <div class="card-body">

                                        <div class="table-responsive">
                                            <div>
                                                <form class="form-horizontal" action="functions.php" method="post" name="upload_excel" enctype="multipart/form-data">
                                                    <div class="form-group">
                                                        <div class="col-md-12 col-md-offset-4" style="text-align:right;">
                                                            <input type="submit" name="Pending" class="btn btn-success" value="export to excel" />
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                            <table id="dataTable" class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>Action</th>
                                                        <th>Slip</th>
                                                        <th>Status</th>
                                                        <th>Student Name</th>
                                                        <th>Course/Batch</th>
                                                        <th>Class Fee</th>
                                                        <th>Pay Type</th>
                                                        <th>Pay Date</th>
                                                        <th>Next Pay Date</th>
                                                        <th>Coupen</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php
                                                    $count = 0;
                                                    $payment_qury = mysqli_query($conn, "SELECT * FROM lmspayment WHERE paymentMethod='Bank' and status='0' ORDER BY created_at ASC");
                                                    while ($payment_resalt = mysqli_fetch_array($payment_qury)) {
                                                        $count++;

                                                        $user_qury = mysqli_query($conn, "SELECT * FROM lmsregister WHERE reid='$payment_resalt[userID]'");
                                                        $user_resalt = mysqli_fetch_array($user_qury);
                                                    ?>
                                                        <tr>
                                                            <td><?php echo number_format($count, 0); ?></td>
                                                            <td>

                                                                <a href="bank_payaments.php?id=<?php echo $payment_resalt['pid']; ?>&status=1&mobile=<?php echo "0" . (int)$user_resalt['contactnumber']; ?>" title="Approval Payment" onClick="JavaScript:return confirm('Are your sure change this payment status?');" class="btn btn-success mb-1"><i class="fa fa-check"></i> Approval</a>

                                                                <a href="bank_payaments.php?id=<?php echo $payment_resalt['pid']; ?>&status=2&mobile=<?php echo "0" . (int)$user_resalt['contactnumber']; ?>" title="Unapproval Payment" onClick="JavaScript:return confirm('Are your sure change this payment status?');" class="btn btn-danger"><i class="la la-trash-o"></i> Reject</a>

                                                            </td>
                                                            <td>
                                                                <a href="<?php echo "$url/profile/uploadslip/" . $payment_resalt['fileName']; ?>" target="_blank" class="btn btn-primary">View Slip</a>
                                                            </td>
                                                            <td>
                                                                <?php if ($payment_resalt['status'] == 0) { ?>
                                                                    <span>Not Approval</span>
                                                                <?php } ?>
                                                                <?php if ($payment_resalt['status'] == 1) { ?>
                                                                    <span>Approval</span>
                                                                <?php } ?>
                                                            </td>
                                                            <td><?php echo $user_resalt['fullname']; ?><br><?php echo "0" . (int)$user_resalt['contactnumber']; ?></td>
                                                            <td><?php
                                                                $sub_qury = mysqli_query($conn, "SELECT * FROM lmssubject WHERE sid='$payment_resalt[pay_sub_id]'");
                                                                while ($sub_resalt = mysqli_fetch_array($sub_qury)) {
                                                                ?> <?php echo $sub_resalt['name']; ?>

                                                                    -

                                                                    <?php
                                                                    $cl_qury = mysqli_query($conn, "SELECT * FROM lmsclass WHERE cid='$sub_resalt[class_id]'");
                                                                    while ($cl_resalt = mysqli_fetch_array($cl_qury)) {
                                                                    ?> <?php echo $cl_resalt['name']; ?> <?php }
                                                                                                    } ?>
                                                            </td>
                                                            <td>
                                                                <span>Rs.<?php echo number_format($payment_resalt['amount'], 2); ?></span>

                                                                <input type="number" step="0.00" min="10" class="mt-1 classFeeInput" data-payment-id="<?php echo $payment_resalt['pid']; ?>">

                                                                <button class="mt-1 btn btn-primary submitClassFee" data-payment-id="<?php echo $payment_resalt['pid']; ?>">Update</button>
                                                            </td>
                                                            <td><?php echo $payment_resalt['pay_type']; ?></td>
                                                            <td><?php echo date_format(date_create($payment_resalt['created_at']), "M d, Y - h:i:s A"); ?></td>
                                                            <td>
                                                                <span><?php echo ($payment_resalt['next_paydate']); ?></span>
                                                                <input type="date" class="mt-1 nextPayDateInput" data-payment-id="<?php echo $payment_resalt['pid']; ?>">

                                                                <button class="mt-1 btn btn-primary submitNextPayDate" data-payment-id="<?php echo $payment_resalt['pid']; ?>">Update</button>
                                                            </td>
                                                            <td><?php echo $payment_resalt['coupen'] ?></td>
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
    <script>
        $(document).ready(function() {
            $(".submitNextPayDate").on("click", function() {
                var paymentID = $(this).data("payment-id");
                var nextPayDate = $(".nextPayDateInput[data-payment-id='" + paymentID + "']").val();

                $.post("update_payments.php", {
                    paymentID: paymentID,
                    nextPayDate: nextPayDate
                }, function(data) {
                    if (data === "Success") {
                        // Refresh the page
                        location.reload();
                    }
                });
            });

            $(".submitClassFee").on("click", function() {
                var paymentID = $(this).data("payment-id");
                var classFee = $(".classFeeInput[data-payment-id='" + paymentID + "']").val();

                $.post("update_payments.php", {
                    paymentID: paymentID,
                    classFee: classFee
                }, function(data) {
                    if (data === "Success") {
                        // Refresh the page
                        location.reload();
                    }
                });
            });
        });
    </script>


</body>

</html>