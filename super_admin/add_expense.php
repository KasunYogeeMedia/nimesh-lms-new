<?php

if (!isset($_SESSION)) {
    session_start();
}

require_once 'includes.php';

?>

<?php

require_once '../super_admin/dbconfig4.php';

$msg = '';

$msg5 = '';

if (isset($_POST['save'])) {
    $name = $_POST['name'];
    $cost = $_POST['cost'];
    $date = $_POST['date'];
    if (empty($name)) {
        $errMSG = "Please Enter Title.";
    } else if (empty($date)) {
        $errMSG = "Please Enter Date.";
    } else if (empty($cost)) {
        $errMSG = "Please Enter Cost.";
    }

    // if no error occured, continue ....

    if (!isset($errMSG)) {

        $stmt = $DB_con->prepare('INSERT INTO lmsexpense(name,cost,date) VALUES(:name,:cost,:date)');
        $stmt->bindParam(':name', $name);
        $stmt->bindParam(':cost', $cost);
        $stmt->bindParam(':date', $date);
        if ($stmt->execute()) {

            $successMSG = "Successfully! Add Your Expense....";

            header("refresh:2;expense.php"); // redirects image view page after 5 seconds.

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
    <title>Add Expense | Online Learning Platforms | Dashboard</title>
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
                            <h4>Add Expense</h4>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.php">Home</a></li>
                            <li class="breadcrumb-item"><a href="javascript:void(0);">Expense</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0);">Add Expense</a></li>
                        </ol>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <div class="card border-0 bg-light">
                            <div class="card-header">
                                <h4 class="card-title">Add Expense</h4>
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
                                                <label class="form-label">Expense</label>
                                                <input type="text" class="form-control" name="name" placeholder="Enter Expense Title" required>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-12">
                                            <div class="form-group">
                                                <label class="form-label">Cost</label>
                                                <input type="number" step="0.01" min="0" class="form-control" name="cost" placeholder="Enter Cost" required>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-12">
                                            <div class="form-group">
                                                <label class="form-label">Date</label>
                                                <input type="date" class="form-control" name="date" placeholder="Enter Date" required>
                                            </div>
                                        </div>

                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                            <input type="submit" name="save" class="btn btn-primary" value="Save changes">
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