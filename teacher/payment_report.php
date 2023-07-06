<?php

session_start();

require_once 'includes.php';

require_once("../admin/conn.php");

require_once '../admin/dbconfig4.php';

if (isset($_SESSION['tid'])) {

    $user_qury = mysqli_query($conn, "SELECT * FROM lmstealmsr WHERE tid='$_SESSION[tid]'");

    $user_resalt = mysqli_fetch_array($user_qury);



    if ($user_resalt['image'] == "") {

        $image_path = "../profile/images/hd_dp.jpg";
    } else {

        $image_path = "../admin/images/teacher/" . $user_resalt['image'];
    }
}

?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Teacher Payment Reports | Teacher Panel | Online Learning Platforms </title>

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
        <div class="content-body bg-light">
            <!-- row -->
            <div class="container-fluid">

                <div class="row page-titles mx-0">
                    <div class="col-sm-6 p-md-0">
                        <div class="welcome-text">
                            <h4>All Teacher Payment Reports</h4>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="home.php">Home</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0);">Teacher Payment Reports</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0);">All Teacher Payment Reports</a></li>
                        </ol>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <ul class="nav nav-pills mb-3">
                            <li class="nav-item"><a href="#list-view" data-toggle="tab" class="nav-link btn-primary mr-1 show active">List View</a></li>
                            <li class="nav-item"><a href="#grid-view" data-toggle="tab" class="nav-link btn-primary">Grid View</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-12">
                        <div class="row tab-content">
                            <div class="table-responsive">


                                <form method="post" class="p-3">
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <select name="filter_text" id="" required class="form-control">
                                                        <option value="" hidden="lms">Select Teacher</option>
                                                        <?php
                                                        $filter_teacher_qury = mysqli_query($conn, "SELECT * FROM lmstealmsr ORDER BY fullname");
                                                        while ($filter_teacher_resalt = mysqli_fetch_array($filter_teacher_qury)) {
                                                        ?>
                                                            <option value="<?php echo $filter_teacher_resalt['tid']; ?>"><?php echo $filter_teacher_resalt['fullname']; ?></option>
                                                        <?php
                                                        }
                                                        ?>
                                                    </select>
                                                </td>
                                                <td><button type="submit" name="filter_bt" class="btn btn-success">Filter</button></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </form>

                                <table id="dataTable" class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Action</th>
                                            <th>Course</th>
                                            <th>Student's</th>
                                            <th>Income</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        if (isset($_POST['filter_bt'])) {

                                            $user_qury = mysqli_query($conn, "SELECT * FROM lmstealmsr WHERE tid='$_POST[filter_text]'");
                                            $user_resalt = mysqli_fetch_array($user_qury);

                                            $sub_qury = mysqli_query($conn, "SELECT * FROM lmstealmsr_multiple INNER JOIN lmssubject ON lmstealmsr_multiple.tealmsr_contain_id=lmssubject.sid WHERE tealmsr_system_id='$user_resalt[systemid]' and tealmsr_type='3' ORDER BY name");
                                            while ($sub_resalt = mysqli_fetch_array($sub_qury)) {

                                                $sum_qury = mysqli_query($conn, "SELECT SUM(amount) AS Amount FROM lmspayment WHERE feeID='$_POST[filter_text]' and pay_sub_id='$sub_resalt[tealmsr_contain_id]'");
                                                $sum_resalt = mysqli_fetch_array($sum_qury);
                                        ?>
                                                <tr>
                                                    <td><a href="view_student_list.php?feeID=<?php echo $_POST['filter_text']; ?>&pay_sub_id=<?php echo $sub_resalt['tealmsr_contain_id'] ?>"><button type="button" class="btn btn-success btn-sm"><i class="fa fa-users"></i> View</button></a></td>
                                                    <td><?php echo $sub_resalt['name']; ?></td>
                                                    <td align="center"><?php echo number_format(mysqli_num_rows(mysqli_query($conn, "SELECT DISTINCT userID FROM lmspayment WHERE feeID='$_POST[filter_text]' and pay_sub_id='$sub_resalt[tealmsr_contain_id]'")), 0); ?></td>
                                                    <td align="right"><?php echo number_format($sum_resalt['Amount'], 2); ?></td>
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
        <!--**********************************
            Content body end
        ***********************************-->


        <!--**********************************
            Footer start
        ***********************************-->
        <div class="footer">
            <div class="copyright">
                <p>Copyright © Designed &amp; Developed by <a href="https://yogeemedia.com" target="_blank">Yogeemedia</a> 2021</p>
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

    <!--**********************************
        Scripts
    ***********************************-->
    <?php
    require_once 'footerjs.php';
    ?>

</body>

</html>