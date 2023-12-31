<?php

if (!isset($_SESSION)) {
    session_start();
}

require_once 'includes.php';

require_once '../super_admin/conn.php';

require_once '../super_admin/dbconfig4.php';

if (isset($_GET['remove'])) {
    $remove = mysqli_real_escape_string($conn, $_GET['remove']);
    mysqli_query($conn, "DELETE FROM lmsclass_schlmsle WHERE classid='$remove'");
    echo "<script>window.location='class_schedule.php';</script>";
}
?>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Online Learning Platforms | Dashboard</title>
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
                            <h4>Payment Getway Settings</h4>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="home.php">Home</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0);">Payment Getway Settings</a></li>
                        </ol>
                    </div>
                </div>

                <div class="row">

                    <div class="col-lg-12">
                        <?php if (isset($_GET['added'])) { ?>

                            <div class="alert alert-success alert-dismissible alert-alt solid fade show">

                                <button type="button" class="close h-100" data-dismiss="alert" aria-label="Close"><span><i class="mdi mdi-close"></i></span></button>

                                <strong>Success!</strong> New Added Successfully.

                            </div>

                        <?php } ?>

                        <?php if (isset($_GET['update'])) { ?>

                            <div class="alert alert-success alert-dismissible alert-alt solid fade show">

                                <button type="button" class="close h-100" data-dismiss="alert" aria-label="Close"><span><i class="mdi mdi-close"></i></span></button>

                                <strong>Success!</strong> Updated Successfully,

                            </div>

                        <?php } ?>
                        <div class="row tab-content">
                            <div class="card-body">
                                <form action="getway_save.php" method="POST" enctype="multipart/form-data">
                                    <div class="form-group">
                                        <label>App ID</label>
                                        <input type="text" name="app_id" class="form-control" placeholder="<?php echo $app_id; ?>">
                                    </div>
                                    <div class="form-group">
                                        <label>Hash salt</label>
                                        <input type="text" name="hash_salt" class="form-control" placeholder="<?php echo $hash_salt; ?>">
                                    </div>
                                    <div class="form-group">
                                        <label>App Token</label>
                                        <input type="text" name="a_token" class="form-control" placeholder="<?php echo $a_token; ?>">
                                    </div>

                                    <input type="submit" class="btn btn-primary" name="submit" value="Submit">
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