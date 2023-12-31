<?php

if (!isset($_SESSION)) {
    session_start();
}

require_once 'includes.php';

require_once '../super_admin/dbconfig4.php';

?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Admin | Online Learning Platforms | Dashboard</title>
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

            <div class="row m-0">
                <div class="col-sm-12 col-md-9 col-lg-9 col-xl-9 col-xxl-9 pt-4">

                    <div class="row page-titles mx-0">
                        <div class="col-sm-6 p-md-0">
                            <div class="welcome-text">
                                <h4>All Admin</h4>
                            </div>
                        </div>
                        <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="home.php">Home</a></li>
                                <li class="breadcrumb-item active"><a href="javascript:void(0);">Admin</a></li>
                                <li class="breadcrumb-item active"><a href="javascript:void(0);">All Admin</a></li>
                            </ol>
                        </div>
                    </div>
                    <div class="row">

                        <div class="col-lg-12">
                            <div class="row tab-content">
                                <div id="list-view" class="tab-pane fade active show col-lg-12">
                                    <div class="card border-0 bg-light">
                                        <div class="card-header">
                                            <h4 class="card-title">All Admin </h4>
                                            <a href="add_admin.php" class="btn btn-square btn-secondary">+ Add Admin</a>
                                        </div>
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <table id="dataTable" class="table table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th>ID</th>
                                                            <th>Username</th>
                                                            <th>Email</th>
                                                            <th>Role</th>
                                                            <th>Menu List</th>
                                                            <th>Option</th>
                                                            <th>Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <?php

                                                        $stmt = $DB_con->prepare('SELECT * FROM lmsusers ORDER BY user_id');

                                                        $stmt->execute();

                                                        if ($stmt->rowCount() > 0) {

                                                            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {

                                                                extract($row);

                                                        ?>
                                                                <tr>
                                                                    <td><?php echo $row['user_id']; ?></td>
                                                                    <td><a href="javascript:void(0);"><strong><?php echo $row['user_name']; ?></strong></a></td>
                                                                    <td><a href="javascript:void(0);"><strong><?php echo $row['user_email']; ?></strong></a></td>
                                                                    <td><a href="javascript:void(0);"><strong><?php echo $row['admintype']; ?></strong></a></td>
                                                                    <td>
                                                                        <p><strong>Admin - <span class="badge badge-pill badge-secondary"><?php echo $row['admin']; ?></span><strong>
                                                                                    <p>
                                                                                    <p>Students - <span class="badge badge-pill badge-secondary"><?php echo $row['students']; ?></span><strong>
                                                                                            <p>
                                                                                            <p>Teachers - <span class="badge badge-pill badge-secondary"><?php echo $row['teachers']; ?></span><strong>
                                                                                                    <p>
                                                                                                    <p>Class - <span class="badge badge-pill badge-secondary"><?php echo $row['class']; ?></span><strong>
                                                                                                            <p>
                                                                                                            <p>Course - <span class="badge badge-pill badge-secondary"><?php echo $row['subject']; ?></span><strong>
                                                                                                                    <p>
                                                                                                                    <p>Lesson - <span class="badge badge-pill badge-secondary"><?php echo $row['lesson']; ?></span><strong>
                                                                                                                            <p>
                                                                                                                            <p>Payments - <span class="badge badge-pill badge-secondary"><?php echo $row['payments']; ?></span><strong>
                                                                                                                                    <p>
                                                                                                                                    <p>Programme Shedule - <span class="badge badge-pill badge-secondary"><?php echo $row['class_schedule']; ?></span><strong>
                                                                                                                                            <p>
                                                                                                                                            <p>Mail - <span class="badge badge-pill badge-secondary"><?php echo $row['mail']; ?></span>
                                                                                                                                        </strong></p>
                                                                    </td>
                                                                    <td>
                                                                        <?php

                                                                        if ($row['status'] == "0") {

                                                                            echo '<a class="badge badge-warning">Pending</a>';
                                                                        } else if ($row['status'] == "1") {

                                                                            echo '<a class="badge badge-success">Success</a>';
                                                                        }

                                                                        ?>
                                                                    </td>
                                                                    <td>
                                                                        <a href="edit_admin.php?adid=<?php echo $row["user_id"]; ?>" class="btn btn-sm btn-primary"><i class="la la-pencil"></i></a>
                                                                        <a href="delete_admin.php?adid=<?php echo $row["user_id"]; ?>" class="btn btn-sm btn-danger"><i class="la la-trash-o"></i></a>
                                                                    </td>
                                                                </tr>
                                                        <?php
                                                            }
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
                <div class="col-sm-12 col-md-3 col-lg-3 col-xl-3 col-xxl-3 bg-light rounded-left pt-4">
                    <?php
                    require_once 'right-sidebar.php';
                    ?>
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