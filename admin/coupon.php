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
    <title>Coupon | Online Learning Platforms | Dashboard</title>
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
                            <h4>All Coupon</h4>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="home.php">Home</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0);">Coupon</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0);">All Coupon</a></li>
                        </ol>
                    </div>
                </div>

                <div class="row">

                    <div class="col-lg-12">
                        <div class="row tab-content">
                            <div id="list-view" class="tab-pane fade active show col-lg-12">
                                <div class="card border-0 bg-light">
                                    <div class="card-header">
                                        <h4 class="card-title">All Coupon </h4>
                                        <a href="add_coupon.php" class="btn btn-square btn-secondary">+ Add Coupon</a>
                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table id="dataTable" class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Coupon Code</th>
                                                        <th>Percentage</th>
                                                        <th>Batch</th>
                                                        <th>Valid Date</th>
                                                        <th>Option</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php

                                                    $stmt = $DB_con->prepare('SELECT * FROM lmscoupon ORDER BY id DESC');

                                                    $stmt->execute();


                                                    if ($stmt->rowCount() > 0) {
                                                        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                                                            extract($row);
                                                    ?>
                                                            <tr>
                                                                <td><?php echo $row['id']; ?></td>
                                                                <td><a href="javascript:void(0);"><strong><?php echo $row['coupon_code']; ?></strong></a></td>
                                                                <td><?php echo $row['percentage']; ?></td>
                                                                <?php
                                                                $selectedBatchID = $row['batch']; // Assuming $row contains the data from your previous query

                                                                // Query to fetch data based on selected batch ID
                                                                $innerStmt = $DB_con->prepare('SELECT * FROM lmsclass WHERE cid = :selectedBatchID');
                                                                $innerStmt->bindParam(':selectedBatchID', $selectedBatchID);
                                                                $innerStmt->execute();

                                                                if ($innerStmt->rowCount() > 0) {
                                                                    $batchData = $innerStmt->fetch(PDO::FETCH_ASSOC);

                                                                    // Access the data from $batchData array
                                                                    $cid = $batchData['cid'];
                                                                    $batch_name = $batchData['name'];
                                                                    // Retrieve other column values as needed

                                                                    // Output the retrieved data
                                                                    echo "<td>" . $batch_name . "</td>";

                                                                    // Output other column values as needed
                                                                }
                                                                ?>
                                                                <td><?php echo $row['valid_date']; ?></td>
                                                                <td>
                                                                    <a href="edit_coupon.php?clid=<?php echo $row["id"]; ?>" class="btn btn-sm btn-primary"><i class="la la-pencil"></i></a>
                                                                    <a href="delete_coupon.php?clid=<?php echo $row["id"]; ?>" class="btn btn-sm btn-danger"><i class="la la-trash-o"></i></a>
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