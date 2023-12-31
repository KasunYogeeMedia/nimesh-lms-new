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
    <title>Settings | Online Learning Platforms | Dashboard</title>
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
                            <h4>Settings</h4>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="home.php">Home</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0);">Settings</a></li>
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
                                <form action="settings_save.php" method="POST" enctype="multipart/form-data">
                                    <div class="form-group">
                                        <label>Reg Name Prefix</label>
                                        <input type="text" name="rgname_prefix" class="form-control" placeholder="<?php echo $reg_prefix; ?>">
                                    </div>
                                    <div class="form-group">
                                        <label>Application Name</label>
                                        <input type="text" name="ap_name" class="form-control" placeholder="<?php echo $application_name; ?>">
                                    </div>
                                    <div class="form-group">
                                        <label>Main Logo</label>
                                    </div>
                                    <div class="form-group">
                                        <img src="./settings/logo/<?php echo $main_logo; ?>" class="img-responsive" alt="LMS">

                                    </div>
                                    <div class="form-group">
                                        <input type="file" name="main_logo" class="form-control" />
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