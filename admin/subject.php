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
    <title>Course | Online Learning Platforms | Dashboard</title>
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
                            <h4>All Course</h4>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="home.php">Home</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0);">Course</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0);">All Course</a></li>
                        </ol>
                    </div>
                </div>

                <div class="row">

                    <div class="col-lg-12">
                        <div class="row tab-content">
                            <div id="list-view" class="tab-pane fade active show col-lg-12">
                                <div class="card border-0 bg-light">
                                    <div class="card-header">
                                        <h4 class="card-title">All Course </h4>
                                        <a href="add_subject.php" class="btn btn-square btn-secondary">+ Add Course</a>
                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table id="dataTable" class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Batch</th>
                                                        <th>Course</th>
                                                        <th>Price</th>
                                                        <th>Start Date</th>
                                                        <th>End Date</th>
                                                        <th>Date</th>
                                                        <th>Option</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php

                                                    $stmt = $DB_con->prepare('SELECT * FROM lmssubject ORDER BY sid');

                                                    $stmt->execute();

                                                    if ($stmt->rowCount() > 0) {

                                                        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {

                                                            extract($row);

                                                    ?>
                                                            <tr>
                                                                <td><?php echo $row['sid']; ?></td>
                                                                <td><a href="javascript:void(0);"><strong><?php

                                                                                                            $id = $class_id;

                                                                                                            $query = $DB_con->prepare('SELECT name FROM lmsclass WHERE cid=' . $id);

                                                                                                            $query->execute();

                                                                                                            $result = $query->fetch();

                                                                                                            echo $result['name'];

                                                                                                            ?></strong></a></td>
                                                                <td><a href="javascript:void(0);"><strong><?php echo $row['name']; ?></strong></a></td>
                                                                <td><a href="javascript:void(0);"><strong><?php echo $row['price']; ?></strong></a></td>
                                                                <td><a href="javascript:void(0);"><strong><?php echo $row['start']; ?></strong></a></td>
                                                                <td><a href="javascript:void(0);"><strong><?php echo $row['end']; ?></strong></a></td>
                                                                <td><?php echo $row['add_date']; ?></td>
                                                                <td>
                                                                    <?php

                                                                    if ($row['status'] == "Unpublish") {

                                                                        echo '<a class="btn btn-warning">Pending</a>';
                                                                    } else if ($row['status'] == "Publish") {

                                                                        echo '<a class="btn btn-success">Success</a>';
                                                                    }

                                                                    ?>
                                                                </td>
                                                                <td>
                                                                    <a href="edit_subject.php?sbid=<?php echo $row["sid"]; ?>" class="btn btn-sm btn-primary"><i class="la la-pencil"></i></a>
                                                                    <a href="delete_subject.php?sbid=<?php echo $row["sid"]; ?>" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#deleteModal">
                                                                        <i class="la la-trash-o"></i>
                                                                    </a>

                                                                    <!-- Modal -->
                                                                    <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
                                                                        <div class="modal-dialog">
                                                                            <div class="modal-content">
                                                                                <div class="modal-header">
                                                                                    <h5 class="modal-title" id="deleteModalLabel">Delete Subject</h5>
                                                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                                        <span aria-hidden="true">&times;</span>
                                                                                    </button>
                                                                                </div>
                                                                                <div class="modal-body">
                                                                                    Are you sure you want to delete this subject?
                                                                                </div>
                                                                                <div class="modal-footer">
                                                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                                    <a href="delete_subject.php?sbid=<?php echo $row["sid"]; ?>" class="btn btn-danger">Delete</a>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>

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