<?php

if (!isset($_SESSION)) {
    session_start();
}

require_once 'includes.php';

require_once '../super_admin/conn.php';

require_once '../super_admin/dbconfig4.php';

?>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Student List | Online Learning Platforms | Dashboard</title>
    <?php
    require_once 'headercss.php';
    ?>
    <style type="text/css">
        .multi-select {
            height: 300px;
            border: 1px solid #DDD;
            overflow-y: scroll;
            padding: 5px;
        }

        .pro_pick {
            width: 120px;
            height: 120px;
            object-fit: cover;
            background-position: center;
            background-repeat: no-repeat;
            border-radius: 100%;
            cursor: pointer;
            border: 1px solid #DDD;
            padding: 5px;
            background: #EEE;
        }
    </style>
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
        <div class="content-body bg-light">
            <!-- row -->
            <div class="container-fluid">

                <div class="row page-titles mx-0">
                    <div class="col-sm-6 p-md-0">
                        <div class="welcome-text">
                            <h4>All Student List</h4>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="home.php">Home</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0);">Student List</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0);">All Student List</a></li>
                        </ol>
                    </div>
                </div>

                <div class="row">

                    <div class="col-lg-12">
                        <div class="row tab-content">
                            <div class="table-responsive">
                                <form class="form-horizontal" action="functions.php" method="post" name="upload_excel" enctype="multipart/form-data">
                                    <div class="form-group">
                                        <div class="col-md-12 col-md-offset-4" style="text-align:right;">
                                            <input type="hidden" name="feeID" value="<?php echo $_GET['feeID']; ?>">
                                            <input type="hidden" name="pay_sub_id" value="<?php echo $_GET['pay_sub_id']; ?>">
                                            <input type="submit" name="export_teacher_student" class="btn btn-success" value="export to excel" />
                                        </div>
                                    </div>
                                </form>


                                <table id="dataTable" class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Mobile</th>
                                            <th>Address</th>
                                            <th>Amount</th>
                                            <th>Time</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        $feeID = mysqli_real_escape_string($conn, $_GET['feeID']);
                                        $pay_sub_id = mysqli_real_escape_string($conn, $_GET['pay_sub_id']);
                                        $list_qury = mysqli_query($conn, "SELECT * FROM lmspayment WHERE feeID='$feeID' and pay_sub_id='$pay_sub_id'");
                                        while ($list_resalt = mysqli_fetch_array($list_qury)) {

                                            $stu_qury = mysqli_query($conn, "SELECT * FROM lmsregister WHERE reid='$list_resalt[userID]'");
                                            $stu_resalt = mysqli_fetch_array($stu_qury);
                                        ?>
                                            <tr>
                                                <td><?php echo $stu_resalt['fullname']; ?></td>
                                                <td><?php echo "0" . $stu_resalt['contactnumber']; ?></td>
                                                <td><?php echo $stu_resalt['address']; ?></td>
                                                <td><?php echo number_format($list_resalt['amount'], 2); ?></td>
                                                <td><?php echo date_format(date_create($list_resalt['created_at']), "M d, Y - h:i:s A"); ?></td>
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
        <!--**********************************
            Content body end
        ***********************************-->


        <!--**********************************
            Footer start
        ***********************************-->
        <div class="footer">
            <div class="copyright">
                <p>Copyright © Designed &amp; Developed by <a href="#" target="_blank">Yogeemedia</a> 2021</p>
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

    <?php

    require_once 'footerjs.php';

    ?>

    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

    <script type="text/javascript">
        // In your Javascript (external .js resource or <script> tag)

        $(document).ready(function() {

            $('#feeID').select2({

                placeholder: "Select Teacher",

                allowClear: true

            });

            $('#pay_sub_id').select2({

                placeholder: "Select Course",

                allowClear: true

            });

            $('#userID').select2({

                placeholder: "Select Student",

                allowClear: true

            });


        });
    </script>

</body>

</html>