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
    $status = $_POST['status'];
    if (empty($name)) {
        $errMSG = "Please Enter Name.";
    } else if (empty($status)) {
        $errMSG = "Please Select Publilms Or Unpublilmsed.";
    }

    // if no error occured, continue ....

    if (!isset($errMSG)) {

        $stmt = $DB_con->prepare('INSERT INTO lmsclass(name,status) VALUES(:name,:status)');
        $stmt->bindParam(':name', $name);
        $stmt->bindParam(':status', $status);
        if ($stmt->execute()) {

            $successMSG = "Successfully! Add Your Batch....";

            header("refresh:2;grade.php"); // redirects image view page after 5 seconds.

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
    <title>Add Batch | Online Learning Platforms | Dashboard</title>
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
                            <h4>Add Batch</h4>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.php">Home</a></li>
                            <li class="breadcrumb-item"><a href="javascript:void(0);">Batch</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0);">Add Batch</a></li>
                        </ol>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <div class="card border-0 bg-light">
                            <div class="card-header">
                                <h4 class="card-title">Add Batch</h4>
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
                                                <label class="form-label">Batch</label>
                                                <input type="text" class="form-control" name="name" placeholder="Enter Batch" required>
                                            </div>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-sm-12">
                                            <div class="form-group">
                                                <label class="form-label">Status</label>
                                                <select class="form-control" name="status" required>
                                                    <option>Publish</option>
                                                    <option>Unpublish</option>
                                                </select>
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