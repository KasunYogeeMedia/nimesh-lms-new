<?php
ob_start();
if (!isset($_SESSION)) {
    session_start();
}

require_once 'includes.php';

?>
<?php
function generateCouponCode($length = 8)
{
    $characters = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $couponCode = '';

    // Generate random characters
    for ($i = 0; $i < $length; $i++) {
        $index = rand(0, strlen($characters) - 1);
        $couponCode .= $characters[$index];
    }

    return $couponCode;
}

// Example usage
$couponCode = generateCouponCode();

?>

<?php

require_once '../super_admin/dbconfig4.php';

$msg = '';

$msg5 = '';

if (isset($_POST['save'])) {
    $coupon_code = $_POST['coupon_code'];
    $batch = $_POST['batch'];
    $percentage = $_POST['percentage'];
    $valid_date = $_POST['valid_date'];
    if (empty($coupon_code)) {
        $errMSG = "Please Enter Coupon Code.";
    } else if (empty($batch)) {
        $errMSG = "Please Select Batch.";
    } else if (empty($percentage)) {
        $errMSG = "Please Enter Percentage.";
    } else if (empty($valid_date)) {
        $errMSG = "Please Select Date.";
    }

    // if no error occured, continue ....

    if (!isset($errMSG)) {

        $stmt = $DB_con->prepare('INSERT INTO lmscoupon(coupon_code,batch,percentage,valid_date) VALUES(:coupon_code,:batch,:percentage,:valid_date)');
        $stmt->bindParam(':coupon_code', $coupon_code);
        $stmt->bindParam(':batch', $batch);
        $stmt->bindParam(':percentage', $percentage);
        $stmt->bindParam(':valid_date', $valid_date);
        if ($stmt->execute()) {

            $successMSG = "Successfully! Add Your Coupon....";

            header("refresh:2;coupon.php"); // redirects image view page after 5 seconds.
            ob_end_flush();
        } else {

            $errMSG = "error while inserting....";
        }
    }
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Add Coupon | Online Learning Platforms | Dashboard</title>
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
                            <h4>Add Coupon</h4>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.php">Home</a></li>
                            <li class="breadcrumb-item"><a href="javascript:void(0);">Coupon</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0);">Add Coupon</a></li>
                        </ol>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <div class="card border-0 bg-light">
                            <div class="card-header">
                                <h4 class="card-title">Add Coupon</h4>
                            </div>
                            <div class="card-body">
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
                                <form method="POST" enctype="multlmsrt/form-data">
                                    <div class="row">
                                        <div class="col-lg-3 col-md-3 col-sm-12">
                                            <div class="form-group">
                                                <label class="form-label">Coupon</label>
                                                <input type="text" class="form-control" name="coupon_code" value="<?php echo $couponCode; ?>" required readonly>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-12">
                                            <div class="form-group">
                                                <label class="form-label">Batch</label>
                                                <select class="form-control" name="batch" required>
                                                    <?php

                                                    $stmt = $DB_con->prepare('SELECT * FROM lmsclass WHERE status="Publish" ORDER BY cid');

                                                    $stmt->execute();

                                                    if ($stmt->rowCount() > 0) {

                                                        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {

                                                            extract($row);

                                                    ?>
                                                            <option value="<?php echo $row['cid']; ?>"><?php echo $row['name']; ?></option>

                                                    <?php
                                                        }
                                                    }
                                                    ?>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="col-lg-3 col-md-3 col-sm-12">
                                            <div class="form-group">
                                                <label class="form-label">Percentage</label>
                                                <input type="number" step="0.01" min="0" class="form-control" name="percentage" placeholder="Enter Percentage" required>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-12">
                                            <div class="form-group">
                                                <label class="form-label">Valid Date</label>
                                                <input type="date" class="form-control" name="valid_date" placeholder="Enter Date" required>
                                            </div>
                                        </div>

                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                            <input type="submit" name="save" class="btn btn-primary" value="Generate Coupon">
                                            <a class="btn btn-danger" href="grade.php"><i class="fa fa-times"></i> Cancel</a>
                                        </div>
                                    </div>
                                </form>
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