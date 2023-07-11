<?php

if (!isset($_SESSION)) {
    session_start();
}
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
                            <h4 class="item_title mb-4">Paid Live Classes</h4>

                        </div>
                        <?php
                        if ($full_pay == 1) { ?>
                            <div class="col-lg-12">
                                <div class="widget-box bg-light mb-2 p-3">

                                    <form method="post">
                                        <div class="row">
                                            <div class="col-lg-3 col-md-3">
                                                From : <input name="s_month" type="month" class="form-control" id="s_month" value="<?php echo date("Y-m"); ?>">
                                            </div>
                                            <div class="col-lg-3 col-md-3">
                                                To : <input name="e_month" type="month" class="form-control" id="e_month" value="<?php echo date("Y-m"); ?>">
                                            </div>
                                            <div class="col-lg-3 col-md-3">
                                                Class : <select name="fsubject" required class="form-control" style="border: 2px solid #ccc;">
                                                    <option hidden="yes">Select Class</option>
                                                    <?php
                                                    $sub_array = array();
                                                    $sub_qury = mysqli_query($conn, "SELECT * FROM lmsreq_subject WHERE sub_req_reg_no='$user_resalt[contactnumber]'");
                                                    while ($sub_resalt = mysqli_fetch_assoc($sub_qury)) {
                                                        array_push($sub_array, "'" . $sub_resalt['sub_req_sub_id'] . "'");
                                                    }
                                                    $sub_array_join = join(",", $sub_array);

                                                    $stmt = $DB_con->prepare("SELECT * FROM lmssubject WHERE sid IN ($sub_array_join) and status='Publish' ORDER BY name");
                                                    $stmt->execute();
                                                    if ($stmt->rowCount() > 0) {
                                                        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                                                            extract($row);
                                                    ?>
                                                            <option value="<?php echo $row['sid']; ?>"><?php echo $row['name']; ?> [<?php

                                                                                                                                    $id = $row['class_id'];

                                                                                                                                    $query = $DB_con->prepare('SELECT name FROM lmsclass WHERE cid=' . $id);

                                                                                                                                    $query->execute();

                                                                                                                                    $result = $query->fetch();

                                                                                                                                    echo $result['name'];

                                                                                                                                    ?>]</option>
                                                    <?php }
                                                    }
                                                    ?>

                                                </select>
                                            </div>
                                            <div class="col-lg-3 col-md-3">
                                                <br><button name="fil_bt" type="submit" class="btn btn-dark">Filter</button>
                                            </div>
                                        </div>
                                    </form>

                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="_14d25">
                                    <div class="row">
                                        <?php
                                        if (isset($_POST['fil_bt'])) {
                                            $s_month = date("Y-m-01", strtotime($_POST['s_month']));
                                            $e_month = date("Y-m-t", strtotime($_POST['e_month']));
                                            $fsubject = $_POST['fsubject'];

                                            $sub_array = array();
                                            $sub_qury = mysqli_query($conn, "SELECT * FROM lmsreq_subject WHERE sub_req_reg_no='$user_resalt[contactnumber]'");
                                            while ($sub_resalt = mysqli_fetch_assoc($sub_qury)) {
                                                array_push($sub_array, "'" . $sub_resalt['sub_req_sub_id'] . "'");
                                            }
                                            $sub_array_join = join(",", $sub_array);

                                            $lavel_qury = mysqli_query($conn, "SELECT * FROM lmsverbal_exam WHERE subject IN ($sub_array_join) and classtype='Online Class' and classstatus='1' and add_date BETWEEN '$s_month' and '$e_month' and subject='$fsubject'");
                                            while ($level_resalt = mysqli_fetch_array($lavel_qury)) {

                                                $tealmsr_qury = mysqli_query($conn, "SELECT * FROM lmstealmsr WHERE tid='$level_resalt[tealmsr]'");
                                                $tealmsr_resalt = mysqli_fetch_array($tealmsr_qury);

                                        ?>

                                                <div class="col-lg-3 col-md-4">
                                                    <div class="fcrse_1 mt-30">
                                                        <a href="#" class="fcrse_img">
                                                            <?php if ($level_resalt['image'] == "") {
                                                                $pro_img = "images/hd_dp2.jpg";
                                                            } else {
                                                                $pro_img = "../super_admin/images/class/" . $level_resalt['image'];
                                                            } ?><img src="<?php echo $pro_img; ?>" class="pro_pick2">
                                                            <div class="course-overlay">



                                                                <div class="crse_timer">
                                                                    <?php

                                                                    $id = $level_resalt['level'];

                                                                    $query = $DB_con->prepare('SELECT name FROM lmsclass WHERE cid=' . $id);

                                                                    $query->execute();

                                                                    $result = $query->fetch();

                                                                    echo $result['name'];

                                                                    ?> - <?php

                                                                            $id = $level_resalt['subject'];

                                                                            $query = $DB_con->prepare('SELECT name FROM lmssubject WHERE sid=' . $id);

                                                                            $query->execute();

                                                                            $result = $query->fetch();

                                                                            echo $result['name'];

                                                                            ?>
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <div class="fcrse_content">
                                                            <a href="#" class="crse14s"><?php echo $level_resalt['lesson']; ?></a>
                                                            <div class="vdtodt">
                                                                <span class="vdt14">Start : <?php echo date_format(date_create($level_resalt['class_start_time']), "h:i:s A"); ?></span>
                                                                <span class="vdt14">End : <?php echo date_format(date_create($level_resalt['class_end_time']), "h:i:s A"); ?></span>
                                                            </div>
                                                            <div class="auth1lnkprce">
                                                                <p class="cr1fot">
                                                                <div class="user-status">
                                                                    <div class="user-avatar">
                                                                        <?php if ($tealmsr_resalt['image'] == "") {
                                                                            $pro_img = "images/hd_dp.jpg";
                                                                        } else {
                                                                            $pro_img = "../super_admin/images/teacher/" . $tealmsr_resalt['image'];
                                                                        } ?><img src="<?php echo $pro_img; ?>" class="pro_pick">
                                                                    </div>
                                                                    <p class="user-status-title"><span class="bold"><?php echo $tealmsr_resalt['fullname']; ?></span></p>
                                                                    <p class="user-status-tag online">Teacher</p>
                                                                    <br>
                                                                    <?php
                                                                    $vmonth = date_format(date_create($level_resalt['add_date']), "Y-m-01");
                                                                    date_default_timezone_set("Asia/Colombo");
                                                                    $lmsck_date = date('Y-m-d', time());
                                                                    $lmsck_payment = mysqli_query($conn, "SELECT * FROM lmspayment WHERE userID='$_SESSION[reid]' and pay_sub_id='$level_resalt[subject]' and status='1' and pay_month='$vmonth' and expiredate>'$lmsck_date'");
                                                                    if (mysqli_num_rows($lmsck_payment) > 0) {
                                                                    ?>

                                                                        <a href="<?php echo $level_resalt['classlink']; ?>" class="save_btn btn-block" style="background-color:#151fc1;">Go Live</a>

                                                                    <?php
                                                                    } else {

                                                                    ?>
                                                                        <a href="student_profile.php" class="save_btn btn-block">Payment Here</a>
                                                                    <?php
                                                                    }
                                                                    ?>

                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                            <?php
                                            }
                                        } else {
                                            ?>
                                            <?php

                                            $sub_array = array();
                                            $sub_qury = mysqli_query($conn, "SELECT * FROM lmsreq_subject WHERE sub_req_reg_no='$user_resalt[contactnumber]'");
                                            while ($sub_resalt = mysqli_fetch_assoc($sub_qury)) {
                                                array_push($sub_array, "'" . $sub_resalt['sub_req_sub_id'] . "'");
                                            }
                                            $sub_array_join = join(",", $sub_array);

                                            $lavel_qury = mysqli_query($conn, "SELECT * FROM lmsverbal_exam WHERE subject IN ($sub_array_join) and classtype='Online Class' and classstatus='1'");
                                            while ($level_resalt = mysqli_fetch_array($lavel_qury)) {

                                                $tealmsr_qury = mysqli_query($conn, "SELECT * FROM lmstealmsr WHERE tid='$level_resalt[tealmsr]'");
                                                $tealmsr_resalt = mysqli_fetch_array($tealmsr_qury);

                                            ?>
                                                <div class="col-lg-3 col-md-4">
                                                    <div class="fcrse_1 mt-30">
                                                        <a href="#" class="fcrse_img">
                                                            <?php if ($level_resalt['image'] == "") {
                                                                $pro_img = "images/hd_dp2.jpg";
                                                            } else {
                                                                $pro_img = "../super_admin/images/class/" . $level_resalt['image'];
                                                            } ?><img src="<?php echo $pro_img; ?>" class="pro_pick2">
                                                            <div class="course-overlay">



                                                                <div class="crse_timer">
                                                                    <?php

                                                                    $id = $level_resalt['level'];

                                                                    $query = $DB_con->prepare('SELECT name FROM lmsclass WHERE cid=' . $id);

                                                                    $query->execute();

                                                                    $result = $query->fetch();

                                                                    echo $result['name'];

                                                                    ?> - <?php

                                                                            $id = $level_resalt['subject'];

                                                                            $query = $DB_con->prepare('SELECT name FROM lmssubject WHERE sid=' . $id);

                                                                            $query->execute();

                                                                            $result = $query->fetch();

                                                                            echo $result['name'];

                                                                            ?>
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <div class="fcrse_content">
                                                            <a href="#" class="crse14s"><?php echo $level_resalt['lesson']; ?></a>
                                                            <div class="vdtodt">
                                                                <span style="font-size:14px;">Start : <?php echo date_format(date_create($level_resalt['class_start_time']), "h:i:s A"); ?></span>
                                                                <span style="font-size:14px;">End : <?php echo date_format(date_create($level_resalt['class_end_time']), "h:i:s A"); ?></span>
                                                            </div>
                                                            <?php

                                                            date_default_timezone_set("Asia/Colombo");
                                                            $lmsck_date = date('Y-m-d', time());
                                                            $lmsck_payment = mysqli_query($conn, "SELECT * FROM lmspayment WHERE userID='$_SESSION[reid]' and pay_sub_id='$level_resalt[subject]' and status='1' ");
                                                            $row = mysqli_fetch_assoc($lmsck_payment);
                                                            if (mysqli_num_rows($lmsck_payment) == 1) {

                                                                if ($row['pay_type'] == 'full') {



                                                            ?>
                                                                    <h5>Zoom Password: <?php echo $level_resalt['cpassword']; ?></h5>




                                                                    <?php
                                                                } else {
                                                                    $subject_validate = mysqli_query($conn, "SELECT * FROM lmssubject WHERE sid='$level_resalt[subject]'");
                                                                    $subject_data = mysqli_fetch_assoc($subject_validate);
                                                                    $start_date = $subject_data['start'];
                                                                    $end_date = $subject_data['end'];

                                                                    $start_timestamp = strtotime($start_date);
                                                                    $end_timestamp = strtotime($end_date);

                                                                    $mid_timestamp = ($start_timestamp + $end_timestamp) / 2;
                                                                    $mid_date = date("Y-m-d", $mid_timestamp);

                                                                    if ($lmsck_date <= $mid_date) { ?>
                                                                        <h5>Zoom Password: <?php echo $level_resalt['cpassword']; ?></h5>
                                                                    <?php } else { ?>

                                                                <?php
                                                                    }
                                                                }
                                                                ?>

                                                            <?php

                                                            } else {




                                                            ?>

                                                            <?php
                                                            }
                                                            ?>


                                                            <div class="auth1lnkprce">
                                                                <p class="cr1fot">
                                                                <div class="user-status">
                                                                    <div class="user-avatar">
                                                                        <?php if ($tealmsr_resalt['image'] == "") {
                                                                            $pro_img = "images/hd_dp.jpg";
                                                                        } else {
                                                                            $pro_img = "../super_admin/images/teacher/" . $tealmsr_resalt['image'];
                                                                        } ?><img src="<?php echo $pro_img; ?>" class="pro_pick">
                                                                    </div>
                                                                    <p class="user-status-title"><span class="bold"><?php echo $tealmsr_resalt['fullname']; ?></span></p>
                                                                    <p class="user-status-tag online">Teacher</p>
                                                                    <br>
                                                                    <?php

                                                                    date_default_timezone_set("Asia/Colombo");
                                                                    $lmsck_date = date('Y-m-d');
                                                                    $lmsck_payments = mysqli_query($conn, "SELECT * FROM lmspayment WHERE userID='$_SESSION[reid]' and pay_sub_id='$level_resalt[subject]' and status='1'");
                                                                    $row = mysqli_fetch_assoc($lmsck_payment);
                                                                    $subject_validate = mysqli_query($conn, "SELECT * FROM lmssubject WHERE sid='$level_resalt[subject]'");
                                                                    $subject_data = mysqli_fetch_assoc($subject_validate);

                                                                    $userID = $_SESSION['reid'];
                                                                    $subjectID =  $level_resalt['subject'];
                                                                    $lID =  $level_resalt['classid'];
                                                                    if (mysqli_num_rows($lmsck_payments) == 1) {

                                                                        if ($row['pay_type'] == 'full') {



                                                                    ?>
                                                                            <input type="hidden" id="userID" name="userID" value="<?php echo $userID; ?>">
                                                                            <input type="hidden" id="subjectID" name="subjectID" value="<?php echo $subjectID; ?>">
                                                                            <input type="hidden" id="lID" name="lID" value="<?php echo $lID; ?>">
                                                                            <?php
                                                                            if ($lmsck_date == $level_resalt['classdate']) { ?>
                                                                                <a href="<?php echo $level_resalt['classlink']; ?>" target="_blank" class="save_btn btn-block" style="background-color:#151fc1;" id="btnSubmit">Go Live</a>
                                                                            <?php } else { ?>
                                                                                <a href="javascript:void(0);" class="save_btn btn-block" style="background-color:#151fc1;" id="btnSubmit">It Available for <?php echo $level_resalt['classdate']; ?></a>
                                                                            <?php } ?>




                                                                            <div>
                                                                                <p id="showCounts"></p>
                                                                            </div>

                                                                            <?php
                                                                        } else {


                                                                            $start_date = $subject_data['start'];
                                                                            $end_date = $subject_data['end'];

                                                                            $start_timestamp = strtotime($start_date);
                                                                            $end_timestamp = strtotime($end_date);

                                                                            $mid_timestamp = ($start_timestamp + $end_timestamp) / 2;
                                                                            $mid_date = date("Y-m-d", $mid_timestamp);

                                                                            if ($lmsck_date <= $mid_date) { ?>
                                                                                <input type="hidden" id="userID" name="userID" value="<?php echo $userID; ?>">
                                                                                <input type="hidden" id="subjectID" name="subjectID" value="<?php echo $subjectID; ?>">
                                                                                <input type="hidden" id="lID" name="lID" value="<?php echo $lID; ?>">

                                                                                <?php
                                                                                if ($lmsck_date == $level_resalt['classdate']) { ?>
                                                                                    <a href="<?php echo $level_resalt['classlink']; ?>" target="_blank" class="save_btn btn-block" style="background-color:#151fc1;" id="btnSubmit">Go Live</a>
                                                                                <?php } else { ?>
                                                                                    <a href="javascript:void(0);" class="save_btn btn-block" style="background-color:#151fc1;" id="btnSubmit">It Available for <?php echo $level_resalt['classdate']; ?></a>
                                                                                <?php } ?>
                                                                            <?php } else { ?>
                                                                                <a href="student_profile.php" class="save_btn btn-block">Pay here to other half payment</a>
                                                                        <?php
                                                                            }
                                                                        }
                                                                        ?>

                                                                        <?php

                                                                    } else if (mysqli_num_rows($lmsck_payments) == 2) {
                                                                        $sum = 0;

                                                                        while ($row2 = mysqli_fetch_assoc($lmsck_payments)) {
                                                                            $sum += $row2['amount'];
                                                                        }



                                                                        if ($sum == $subject_data['price']) { ?>
                                                                            <input type="hidden" id="userID" name="userID" value="<?php echo $userID; ?>">
                                                                            <input type="hidden" id="subjectID" name="subjectID" value="<?php echo $subjectID; ?>">
                                                                            <input type="hidden" id="lID" name="lID" value="<?php echo $lID; ?>">
                                                                            <?php
                                                                            if ($lmsck_date == $level_resalt['classdate']) { ?>
                                                                                <a href="<?php echo $level_resalt['classlink']; ?>" target="_blank" class="save_btn btn-block" style="background-color:#151fc1;" id="btnSubmit">Go Live</a>
                                                                            <?php } else { ?>
                                                                                <a href="javascript:void(0);" class="save_btn btn-block" style="background-color:#151fc1;" id="btnSubmit">It Available for <?php echo $level_resalt['classdate']; ?></a>
                                                                            <?php } ?>
                                                                        <?php } else { ?>
                                                                            <a href="student_profile.php" class="save_btn btn-block">Payment Here</a>
                                                                        <?php     }


                                                                        ?>

                                                                    <?php
                                                                    } else { ?>
                                                                        <a href="student_profile.php" class="save_btn btn-block">Payment Here</a>
                                                                    <?php
                                                                    }
                                                                    ?>

                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                        <?php
                                            }
                                        }
                                        ?>

                                    </div>
                                </div>
                            </div>
                        <?php } else { ?>
                            <div class="alert alert-warning" role="alert">
                                You are not pay the course full payment!
                            </div>
                        <?php } ?>
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
    <script>
        $('#btnSubmit').on('click', function() {
            var uid = "uid=" + $('#userID').val();
            var sid = "sid=" + $('#subjectID').val();
            var lid = "lid=" + $('#lID').val();

            var data = uid + '&' + sid + '&' + lid;

            $.ajax({
                    type: 'GET',
                    url: "attandance_save.php",
                    data: data
                })
                .done(function(data) {
                    /*handle successful call here*/
                })
                .fail(function(data) {
                    /*oops, something went wrong*/
                })
                .always(function(data) {
                    /*no matter what, let's do this*/
                });
        });
    </script>
</body>

</html>