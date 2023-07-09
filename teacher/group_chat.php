<?php

if (!isset($_SESSION)) {
    session_start();
}

require_once '../super_admin/dbconfig4.php';

require_once("../super_admin/config.php");

include '../super_admin/conn.php';

if (!isset($_SESSION['tid'])) {

    header('location:../login.php');

    die();
}


if (isset($_SESSION['tid']) && !empty($_SESSION['tid'])) {
    $tid = $_SESSION['tid'];
    $current_teacher = mysqli_query($conn, "SELECT * FROM lmstealmsr WHERE tid = $tid LIMIT 1");
    if ($current_teacher) {
        $current_teacher_data = mysqli_query(
            $conn,
            "SELECT *
			FROM lmstealmsr
			INNER JOIN lmstealmsr_multiple ON lmstealmsr.systemid = lmstealmsr_multiple.tealmsr_system_id
			INNER JOIN lmssubject ON lmstealmsr_multiple.tealmsr_contain_id = lmssubject.sid
			WHERE lmstealmsr_multiple.tealmsr_type = 3"
        );

        $current_teacher_result = mysqli_fetch_array($current_teacher_data);
        
    }
}
$user_qury = mysqli_query($conn, "SELECT * FROM lmstealmsr WHERE tid='$_SESSION[tid]'");
$user_resalt = mysqli_fetch_array($user_qury);
$vmonth;
$image_qury = mysqli_query($conn, "SELECT * FROM lmstealmsr WHERE tid='$_SESSION[tid]'");
$image_resalt = mysqli_fetch_array($image_qury);

if ($image_resalt['image'] == "") {
    $dis_image_path = "images/hd_dp.jpg";
} else {
    $dis_image_path = "uploadImg/" . $image_resalt['image'];
}

if (isset($_POST['submit'])) {
    /* Attempt MySQL server connection. Assuming you are running MySQL server with default setting (user 'root' with no password) */
    // $link = mysqli_connect(
    //     "localhost",
    //     "root",
    //     "",
    //     "nimesh-lms"
    // );

    // Check connection
    if ($conn === false) {
        die("ERROR: Could not connect. "
            . mysqli_connect_error());
    }

    // Escape user inputs for security
    $un = mysqli_real_escape_string(
        $conn,
        $_REQUEST['uname']
    );
    $m = mysqli_real_escape_string(
        $conn,
        $_REQUEST['msg']
    );
    $sub_id = mysqli_real_escape_string(
        $conn,
        $_REQUEST['sub_id']
    );
    date_default_timezone_set('Asia/Kolkata');
    $ts = date('y-m-d h:ia');

    // Attempt insert query execution
    $sql = "INSERT INTO chats (uname, msg, sub_id,dt)
		VALUES ('$un', '$m', '$sub_id','$ts')";
    if (mysqli_query($conn, $sql)) {;
    } else {
        echo "ERROR: Message not sent!!!";
    }
    // Close connection
    // mysqli_close($conn);
}
?>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Group Chat | Teacher Panel | Online Learning Platforms </title>

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

        <!-- Body Start -->
        <div class="content-body bg-light">
            <div class="row m-0">
                <div class="col py-4">
                    <button class="btn btn-light" id="rsbtnon" type="button" onclick="rightsbon()">
                        <i class="fa fa-bars" aria-hidden="true"></i>
                    </button>
                    <div class="chat_sec">
                        <div class="bg-primary text-light">
                            <h4 class="text-light ps-3 py-3">Group chat</h4>
                        </div>

                        <script>
                            function show_func() {
                                var element = document.getElementById("chathist");
                                element.scrollTop = element.scrollHeight;
                            }
                        </script>

                        <form id="myform" action="Group_chat.php" method="POST">
                            <div class="inner_div" id="chathist">
                                <?php
                                $query = "SELECT * FROM chats where sub_id = $_GET[gid]";
                                $run = $conn->query($query);
                                $i = 0;

                                while ($row = $run->fetch_array()) :
                                    if ($i == 0) {
                                        $i = 5;
                                        $first = $row;
                                ?>
                                        <div id="triangle1" class="triangle1"></div>
                                        <div id="message1" class="message1">
                                            <span style="color:white;float:right;">
                                                <?php echo $row['msg']; ?></span> <br />
                                            <div>
                                                <span style="color:black;float:left;font-size:10px;clear:both;">
                                                    <?php echo $row['uname']; ?>,
                                                    <?php echo $row['dt']; ?>
                                                </span>
                                            </div>
                                        </div>
                                        <br /><br />
                                        <?php
                                    } else {
                                        if ($row['uname'] != $first['uname']) {
                                        ?>
                                            <div id="triangle" class="triangle"></div>
                                            <div id="message" class="message">
                                                <span style="color:white;float:left;">
                                                    <?php echo $row['msg']; ?>
                                                </span> <br />
                                                <div>
                                                    <span style="color:black;float:right;font-size:10px;clear:both;">
                                                        <?php echo $row['uname']; ?>,
                                                        <?php echo $row['dt']; ?>
                                                    </span>
                                                </div>
                                            </div>
                                            <br /><br />
                                        <?php
                                        } else {
                                        ?>
                                            <div id="triangle1" class="triangle1"></div>
                                            <div id="message1" class="message1">
                                                <span style="color:white;float:right;">
                                                    <?php echo $row['msg']; ?>
                                                </span> <br />
                                                <div>
                                                    <span style="color:black;float:left;font-size:10px;clear:both;">
                                                        <?php echo $row['uname']; ?>,
                                                        <?php echo $row['dt']; ?>
                                                    </span>
                                                </div>
                                            </div>
                                            <br /><br />
                                <?php
                                        }
                                    }
                                endwhile;
                                ?>
                            </div>
                            <div class="bg-primary text-light p-3">

                                <div class="form-group row">
                                    <input class="form-control" type="hidden" id="uname" name="uname" value="<?php echo $current_teacher_result['fullname']; ?>">
                                    <input class="form-control" type="hidden" id="sub_id" name="sub_id" value="<?php echo $current_teacher_result['class_id']; ?>">
                                    <div class=" col">
                                        <textarea class="form-control w-100" id="msg" name="msg" rows='3' placeholder="Type your message"></textarea>
                                    </div>
                                    <div class="col-auto my-auto">
                                        <input class="btn btn-secondary btn-lg" type="submit" id="submit" name="submit" value="send">
                                    </div>
                                </div>

                            </div>
                        </form>
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