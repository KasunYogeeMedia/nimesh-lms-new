<?php

session_start();

include '../super_admin/conn.php';
require_once '../super_admin/dbconfig4.php';
$user_qury = mysqli_query($conn, "SELECT * FROM lmsregister WHERE reid='$_SESSION[reid]'");
$user_resalt = mysqli_fetch_array($user_qury);

$image_qury = mysqli_query($conn, "SELECT * FROM lmsregister WHERE reid='$_SESSION[reid]'");
$image_resalt = mysqli_fetch_array($image_qury);

if ($image_resalt['image'] == "") {
    $dis_image_path = "images/hd_dp.jpg";
} else {
    $dis_image_path = "uploadImg/" . $image_resalt['image'];
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, shrink-to-fit=9">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Online Class | Online Learning Platforms | Student Panel</title>
    <?php
    require_once 'headercss.php';
    ?>
</head>

<body>



    <?php
    require_once 'sidebarmenu.php';
    ?>

    <!-- Body Start -->
    <div class="wrapper custom-theme bg-light">
        <div class="row m-0">
            <div class="col py-4">
                <button class="btn btn-light" id="rsbtnon" type="button" onclick="rightsbon()">
                    <i class="fa fa-bars" aria-hidden="true"></i>
                </button>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h4 class="item_title mb-4">Exam Types</h4>
                        </div>

                        <div class="row">
                            <div class="col-xl-6 col-lg-6 col-md-6 col-xxl-4 dash_card">
                                <div class="card_dash h-100">
                                    <div class="card_dash_left">
                                        <h2 class="text-dark">Verbal Exams<h2>
                                    </div>
                                    <div class="card_dash_right">
                                        <i class="fa fa-file-text fa-3x text-dark"></i>
                                    </div>
                                    <a href="online_verbal_exam.php" class="btn btn-success dash_card_a">View More</a>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-xxl-4 dash_card">
                                <div class="card_dash h-100">
                                    <div class="card_dash_left">
                                        <h2 class="text-dark">MCQ Exams</h2>
                                    </div>
                                    <div class="card_dash_right">
                                        <i class="fa fa-file-text fa-3x text-dark"></i>
                                    </div>
                                    <a href="exam_list.php?type=1" class="btn btn-success dash_card_a">View More</a>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-xxl-4 dash_card">
                                <div class="card_dash h-100">
                                    <div class="card_dash_left">
                                        <h2 class="text-dark">Paper Exams</h2>
                                    </div>
                                    <div class="card_dash_right">
                                        <i class="fa fa-file-text fa-3x text-dark"></i>
                                    </div>
                                    <a href="paper_exam_list.php" class="btn btn-success dash_card_a">View More</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="rgsb" class="rg-sb col-sm-6 col-md-5 col-lg-3 col-xl-3 col-xxl-3 bg-light rounded-left pt-4">
                <?php
                require_once 'right-sidebar.php';
                ?>
            </div>
        </div>
        <?php
        require_once 'footer.php';
        ?>
    </div>
    <!-- Body End -->
    <?php
    require_once 'footerjs.php';
    ?>

</body>

</html>