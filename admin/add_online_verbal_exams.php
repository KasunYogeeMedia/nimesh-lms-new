<?php

if (!isset($_SESSION)) {
    session_start();
}

require_once 'includes.php';
require_once '../super_admin/conn.php';
require_once '../super_admin/dbconfig4.php';

date_default_timezone_set("Asia/Colombo");

if (isset($_GET['edit'])) {
    $edit = mysqli_real_escape_string($conn, $_GET['edit']);
    $edit_qury = mysqli_query($conn, "SELECT * FROM lmsverbal_exam INNER JOIN lmsclass ON lmsverbal_exam.level=lmsclass.cid WHERE classid='$edit'");
    $edit_resalt = mysqli_fetch_array($edit_qury);


    $tealmsr_qury = mysqli_query($conn, "SELECT * FROM lmstealmsr WHERE tid='$edit_resalt[tealmsr]'");
    $tealmsr_resalt = mysqli_fetch_array($tealmsr_qury);


    $subject_qury = mysqli_query($conn, "SELECT * FROM lmssubject WHERE sid='$edit_resalt[subject]'");
    $subject_resalt = mysqli_fetch_array($subject_qury);
}


if (isset($_POST['update_class_bt'])) {
    $lesson = mysqli_real_escape_string($conn, $_POST['lesson']);
    $level = mysqli_real_escape_string($conn, $_POST['level']);
    $subject = mysqli_real_escape_string($conn, $_POST['subject']);
    $classdate = mysqli_real_escape_string($conn, $_POST['classdate']);
    $class_start_time = mysqli_real_escape_string($conn, $_POST['class_start_time']);
    $class_end_time = mysqli_real_escape_string($conn, $_POST['class_end_time']);
    $classlink = mysqli_real_escape_string($conn, $_POST['classlink']);
    $cpassword = mysqli_real_escape_string($conn, $_POST['cpassword']);
    $tealmsr = mysqli_real_escape_string($conn, $_POST['tealmsr']);
    $classtype = mysqli_real_escape_string($conn, $_POST['classtype']);
    $classstatus = mysqli_real_escape_string($conn, $_POST['classstatus']);




    if (!$_FILES['image']['name'] == "") {


        if ($_FILES['image']['type'] == "image/jpeg" || "image/png" || "image/jpg") {
            $imagename = time() . $_FILES['image']['name'];
            $source = $_FILES['image']['tmp_name'];
            $target = "images/class/" . str_replace(" ", "_", $imagename);
            $db_send_name = str_replace(" ", "_", $imagename);
            move_uploaded_file($source, $target);


            $imagepath = $imagename;
            $save = "images/class/" . $imagepath; //This is the new file you saving
            $file = "images/class/" . $imagepath; //This is the original file


            list($width, $height) = getimagesize($file);


            $modwidth = 300;


            $diff = $width / $modwidth;


            $modheight = $height / $diff;
            $tn = imagecreatetruecolor($modwidth, $modheight);
            $image = imagecreatefromjpeg($file);
            imagecopyresampled($tn, $image, 0, 0, 0, 0, $modwidth, $modheight, $width, $height);


            imagejpeg($tn, $save, 100);
        } else {
            $db_send_name = $edit_resalt['image'];
        }
    } else {
        $db_send_name = $edit_resalt['image'];
    }

   // echo("UPDATE lmsverbal_exam SET level='$level',subject='$subject',tealmsr='$tealmsr',lesson='$lesson',classdate='$classdate',class_start_time='$class_start_time',class_end_time='$class_end_time',classlink='$classlink',cpassword='$cpassword',classtype='$classtype',image='$db_send_name',classstatus='$classstatus' WHERE classid='$edit'");
    mysqli_query($conn, "UPDATE lmsverbal_exam SET level='$level',subject='$subject',tealmsr='$tealmsr',lesson='$lesson',classdate='$classdate',class_start_time='$class_start_time',class_end_time='$class_end_time',classlink='$classlink',cpassword='$cpassword',classtype='$classtype',image='$db_send_name',classstatus='$classstatus' WHERE classid='$edit'");
    echo "<script>window.location='add_online_verbal_exams.php?edit=$edit&update';</script>";
}


if (isset($_POST['add_class_bt'])) {
    $lesson = mysqli_real_escape_string($conn, $_POST['lesson']);
    $level = mysqli_real_escape_string($conn, $_POST['level']);
    $subject = mysqli_real_escape_string($conn, $_POST['subject']);
    $classdate = mysqli_real_escape_string($conn, $_POST['classdate']);
    $class_start_time = mysqli_real_escape_string($conn, $_POST['class_start_time']);
    $class_end_time = mysqli_real_escape_string($conn, $_POST['class_end_time']);
    $classlink = mysqli_real_escape_string($conn, $_POST['classlink']);
    $cpassword = mysqli_real_escape_string($conn, $_POST['cpassword']);
    $tealmsr = mysqli_real_escape_string($conn, $_POST['tealmsr']);
    $classtype = mysqli_real_escape_string($conn, $_POST['classtype']);
    $classstatus = mysqli_real_escape_string($conn, $_POST['classstatus']);




    if (!$_FILES['image']['name'] == "") {


        if ($_FILES['image']['type'] == "image/jpeg" || "image/png" || "image/jpg") {
            $imagename = time() . $_FILES['image']['name'];
            $source = $_FILES['image']['tmp_name'];
            $target = "images/class/" . str_replace(" ", "_", $imagename);
            $db_send_name = str_replace(" ", "_", $imagename);
            move_uploaded_file($source, $target);


            $imagepath = $imagename;
            $save = "images/class/" . $imagepath; //This is the new file you saving
            $file = "images/class/" . $imagepath; //This is the original file


            list($width, $height) = getimagesize($file);


            $modwidth = 300;


            $diff = $width / $modwidth;


            $modheight = $height / $diff;
            $tn = imagecreatetruecolor($modwidth, $modheight);
            $image = imagecreatefromjpeg($file);
            imagecopyresampled($tn, $image, 0, 0, 0, 0, $modwidth, $modheight, $width, $height);


            imagejpeg($tn, $save, 100);
        } else {
            $db_send_name = "";
        }
    } else {
        $db_send_name = "";
    }


    mysqli_query($conn, "INSERT INTO lmsverbal_exam(level, subject, tealmsr, lesson, classdate, class_start_time, class_end_time, classlink, cpassword, classtype, image, classstatus) VALUES ('$level','$subject','$tealmsr','$lesson','$classdate','$class_start_time','$class_end_time','$classlink','$cpassword','$classtype','$db_send_name','$classstatus')");
    //mysqli_query( $conn, "INSERT INTO lmsverbal_exam (level, subject, tealmsr, lesson, classdate, class_start_time, class_end_time, classlink, cpassword, classtype, image, add_date, classstatus) VALUES ('', '', '', '', '', '', '', '', '', '', '', '$payment_month', '')" );

    /*	$subject_qury = mysqli_query( $conn, "SELECT * FROM lmssubject WHERE name='$subject'" );
	$subject_resalt = mysqli_fetch_array( $subject_qury );


	$req_subject_qury = mysqli_query( $conn, "SELECT * FROM lmsreq_subject WHERE sub_req_sub_id='$subject_resalt[sid]'" );
	while ( $req_subject_resalt = mysqli_fetch_array( $req_subject_qury ) ) {
		//echo "<script>alert('$req_subject_resalt[sub_req_reg_no]');</script>";
	}*/
    //echo "<script>window.location='add_class_schedule.php?added';</script>";
}
?>



<!DOCTYPE html>

<html lang="en">



<head>

    <meta charset="utf-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width=device-width,initial-scale=1">

    <title>Add Verbal Exam | Online Learning Platforms | Dashboard</title>

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

            Header end ti-comment-alt

        ***********************************-->



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

                            <h4>Add Verbal Exam</h4>

                        </div>

                    </div>

                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">

                        <ol class="breadcrumb">

                            <li class="breadcrumb-item"><a href="index.php">Home</a>
                            </li>

                            <li class="breadcrumb-item"><a href="javascript:void(0);">Verbal Exam</a>
                            </li>

                            <li class="breadcrumb-item active"><a href="javascript:void(0);">Add Verbal Exam</a>
                            </li>

                        </ol>

                    </div>

                </div>



                <div class="row">

                    <div class="col-lg-12">

                        <div class="card border-0 bg-light">

                            <div class="card-header">

                                <h4 class="card-title">Add Verbal Exam</h4>

                            </div>

                            <div class="card-body">

                                <?php if (isset($_GET['added'])) { ?>

                                    <div class="alert alert-success alert-dismissible alert-alt solid fade show">

                                        <button type="button" class="close h-100" data-dismiss="alert" aria-label="Close"><span><i class="mdi mdi-close"></i></span></button>

                                        <strong>Success!</strong> New Verbal Exam Added Successfully.

                                    </div>

                                <?php } ?>

                                <?php if (isset($_GET['update'])) { ?>

                                    <div class="alert alert-success alert-dismissible alert-alt solid fade show">

                                        <button type="button" class="close h-100" data-dismiss="alert" aria-label="Close"><span><i class="mdi mdi-close"></i></span></button>

                                        <strong>Success!</strong> Verbal Exam Updated Successfully,

                                    </div>

                                <?php } ?>



                                <form method="POST" autocomplete="off" enctype="multipart/form-data">

                                    <div class="row">


                                        <input type="hidden" name="classtype" value="Online Class" />



                                        <div class="col-lg-3 col-md-3 col-sm-12">

                                            <div class="form-group">

                                                <label class="form-label">Teacher</label>

                                                <select name="tealmsr" class="form-control" required>

                                                    <option value="<?php if (isset($_GET['edit'])) {
                                                                        echo $edit_resalt['tealmsr'];
                                                                    } ?>" hidden="yes"><?php if (isset($_GET['edit'])) {
                                                                                            echo $tealmsr_resalt['fullname'];
                                                                                        } else {
                                                                                            echo "Select";
                                                                                        } ?></option>

                                                    <?php

                                                    $tealmsr = mysqli_query($conn, "SELECT * FROM lmstealmsr where status='1' ORDER BY fullname");

                                                    while ($tealmsr_resalt = mysqli_fetch_array($tealmsr)) {

                                                    ?>

                                                        <option value="<?php echo $tealmsr_resalt['tid']; ?>"><?php echo $tealmsr_resalt['fullname']; ?></option>

                                                    <?php

                                                    }

                                                    ?>

                                                </select>





                                            </div>

                                        </div>

                                        <div class="col-lg-6 col-md-6 col-sm-12">

                                            <div class="form-group">

                                                <label class="form-label">Lesson</label>

                                                <input type="text" name="lesson" class="form-control" value="<?php if (isset($_GET['edit'])) {
                                                                                                                    echo $edit_resalt['lesson'];
                                                                                                                } ?>" required>

                                            </div>

                                        </div>

                                        <div class="col-lg-2 col-md-2 col-sm-12">

                                            <div class="form-group">

                                                <label class="form-label">Batch</label>

                                                <select name="level" class="form-control" onChange="JavaScript:send_level(this.value);" required>

                                                    <option value="<?php if (isset($_GET['edit'])) {
                                                                        echo $edit_resalt['level'];
                                                                    } ?>" hidden="yes"><?php if (isset($_GET['edit'])) {
                                                                                            echo $edit_resalt['name'];
                                                                                        } else {
                                                                                            echo "Select";
                                                                                        } ?></option>

                                                    <?php

                                                    $level = mysqli_query($conn, "SELECT * FROM lmsclass ORDER BY cid");

                                                    while ($level_resalt = mysqli_fetch_array($level)) {

                                                    ?>

                                                        <option value="<?php echo $level_resalt['cid']; ?>"><?php echo $level_resalt['name']; ?></option>

                                                    <?php

                                                    }

                                                    ?>

                                                </select>





                                            </div>

                                        </div>

                                        <script>
                                            function send_level(level_id) {

                                                var xhttp = new XMLHttpRequest();

                                                xhttp.onreadystatechange = function() {

                                                    if (this.readyState == 4 && this.status == 200) {

                                                        document.getElementById("subject_dis").innerHTML = this.responseText;

                                                    }

                                                };

                                                xhttp.open("GET", "ajax_subject_filter.php?level_id=" + level_id, true);

                                                xhttp.send();

                                            }
                                        </script>

                                        <div class="col-lg-3 col-md-3 col-sm-12">

                                            <div class="form-group">

                                                <label class="form-label">Course</label>

                                                <span id="subject_dis">

                                                    <select name="subject" class="form-control" required>

                                                        <option hidden="yes" value="<?php if (isset($_GET['edit'])) {
                                                                                        echo $edit_resalt['subject'];
                                                                                    } else {
                                                                                    } ?>"><?php if (isset($_GET['edit'])) {
                                                                                                echo $subject_resalt['name'];
                                                                                            } else {
                                                                                                echo "Course Not Found";
                                                                                            } ?></option>

                                                    </select>

                                                </span>





                                            </div>

                                        </div>

                                        <div class="col-lg-3 col-md-3 col-sm-12">

                                            <div class="form-group">

                                                <label class="form-label">Class Publish Date</label>

                                                <input type="date" name="classdate" class="form-control" value="<?php if (isset($_GET['edit'])) {
                                                                                                                    echo $edit_resalt['classdate'];
                                                                                                                } ?>" required>

                                            </div>

                                        </div>

                                        <div class="col-lg-2 col-md-2 col-sm-12">

                                            <div class="form-group">

                                                <label class="form-label">Start Time</label>

                                                <input type="time" name="class_start_time" class="form-control" style="display: inline-block;" value="<?php if (isset($_GET['edit'])) {
                                                                                                                                                            echo $edit_resalt['class_start_time'];
                                                                                                                                                        } ?>" required>

                                            </div>

                                        </div>

                                        <div class="col-lg-2 col-md-2 col-sm-12">

                                            <div class="form-group">

                                                <label class="form-label">End Time</label>

                                                <input type="time" name="class_end_time" class="form-control" style="display: inline-block;" value="<?php if (isset($_GET['edit'])) {
                                                                                                                                                        echo $edit_resalt['class_end_time'];
                                                                                                                                                    } ?>" required>

                                            </div>

                                        </div>

                                        <div class="col-lg-12 col-md-12 col-sm-12">

                                            <div class="form-group">

                                                <label class="form-label">Link</label>

                                                <input type="text" name="classlink" class="form-control" value="<?php if (isset($_GET['edit'])) {
                                                                                                                    echo $edit_resalt['classlink'];
                                                                                                                } ?>" required>

                                            </div>

                                        </div>

                                        <div class="col-lg-3 col-md-3 col-sm-12">

                                            <div class="form-group">

                                                <label class="form-label">Password</label>

                                                <input type="text" name="cpassword" class="form-control" value="<?php if (isset($_GET['edit'])) {
                                                                                                                    echo $edit_resalt['cpassword'];
                                                                                                                } ?>" required>

                                            </div>

                                        </div>


                                        <div class="col-lg-3 col-md-3 col-sm-12">

                                            <div class="form-group">

                                                <label class="form-label">Class Status</label>

                                                <select name="classstatus" class="form-control" required>

                                                    <option value="<?php if (isset($_GET['edit'])) {
                                                                        echo $edit_resalt['classstatus'];
                                                                    } ?>"><?php if (isset($_GET['edit'])) {
                                                                                echo $edit_resalt['classstatus'];
                                                                            } ?></option>

                                                    <option value="0">Upublished</option>

                                                    <option value="1">Pubslished</option>

                                                    <option value="2">Done</option>

                                                    <option value="3">Cancel</option>

                                                </select>





                                            </div>

                                        </div>

                                        <div class="col-lg-3 col-md-3 col-sm-12">

                                            <div class="form-group">

                                                <label class="form-label">Cover Photo</label>

                                                <label for="fileName"><img src="../profile/images/hd_dp.jpg" id="yourImgTag" class="pro_pick"></label>

                                                <input type="file" name="image" id="fileName" hidden="yes" onChange="dis_name();">



                                                <script>
                                                    function dis_name() {

                                                        var input = document.getElementById("fileName");

                                                        var fReader = new FileReader();

                                                        fReader.readAsDataURL(input.files[0]);

                                                        fReader.onloadend = function(event) {

                                                            var img = document.getElementById("yourImgTag");

                                                            img.src = event.target.result;

                                                        }

                                                    }
                                                </script>

                                            </div>

                                        </div>

                                        <div class="col-lg-12 col-md-12 col-sm-12">

                                            <button type="submit" name="<?php if (isset($_GET['edit'])) {
                                                                            echo "update_class_bt";
                                                                        } else {
                                                                            echo "add_class_bt";
                                                                        } ?>" class="btn btn-primary">
                                                <?php if (isset($_GET['edit'])) {
                                                    echo "Update";
                                                } else {
                                                    echo "Save Changes";
                                                } ?>
                                            </button>

                                            <a class="btn btn-danger" href="online_verbal.php"><i class="fa fa-times"></i> Cancel</a>

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