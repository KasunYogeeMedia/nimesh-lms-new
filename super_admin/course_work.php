<?php

if (!isset($_SESSION)) {
    session_start();
}

require_once 'includes.php';

require_once '../super_admin/conn.php';

require_once '../super_admin/dbconfig4.php';

if (isset($_GET['exid'])) {
    $exid = mysqli_real_escape_string($conn, $_GET['exid']);
    if (mysqli_query($conn, "DELETE FROM lmscourse_work WHERE exid='$exid'")) {
        header("location:online_exams.php");
    }
}

?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Course Works | Online Learning Platforms | Dashboard</title>
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
                            <h4>All Online Exams</h4>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="home.php">Home</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0);">Online Exams</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0);">All Online Exams</a></li>
                        </ol>
                    </div>
                </div>

                <div class="row">

                    <div class="col-lg-12">
                        <div class="row tab-content">
                            <div id="list-view" class="tab-pane fade active show col-lg-12">
                                <div class="card border-0 bg-light">
                                    <div class="card-header">
                                        <h4 class="card-title">All Online Exams</h4>
                                        <a href="add_course_work.php" class="btn btn-square btn-secondary">+ Add Online Exams</a>
                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table id="dataTable" class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Option</th>
                                                        <th>Action</th>
                                                        <th>Batch</th>
                                                        <th>Class Course</th>
                                                        <th>Exam</th>
                                                        <th>Exam Post</th>
                                                        <th>Time</th>
                                                        <th>Document</th>

                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php
                                                    $no_count = 0;
                                                    $stmt = $DB_con->prepare('SELECT * FROM lmscourse_work ORDER BY exid DESC');

                                                    $stmt->execute();

                                                    if ($stmt->rowCount() > 0) {

                                                        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                                                            $no_count++;
                                                            extract($row);

                                                    ?>
                                                            <tr>
                                                                <td><?php echo $no_count; ?></td>
                                                                <td>
                                                                    <?php

                                                                    if ($row['status'] == "0") {

                                                                        echo '<button class="btn btn-primary btn-sm" on>Pending</button>';
                                                                    } else if ($row['status'] == "1") {

                                                                        echo '<button class="btn btn-success btn-sm">Published</button>';
                                                                    }

                                                                    ?>
                                                                </td>
                                                                <td style="white-space: normal;">
                                                                    <a class="btn btn-sm btn-primary mb-1" href="add_course_work.php?exid=<?php echo $row["exid"]; ?>">
                                                                        <i class="fa fa-edit"></i>
                                                                    </a>
                                                                    <a class="btn btn-sm btn-danger mb-1" href="add_course_work.php?exid=<?php echo $row["exid"]; ?>" onClick="return confirm('Are you sure to remove the exam?');">
                                                                        <i class="la la-trash-o"></i>
                                                                    </a>
                                                                </td>
                                                                <td><?php

                                                                    $id = $row['class'];

                                                                    $query = $DB_con->prepare('SELECT name FROM lmsclass WHERE cid=' . $id);

                                                                    $query->execute();

                                                                    $result = $query->fetch();

                                                                    echo $result['name'];

                                                                    ?></td>
                                                                <td>
                                                                    <?php

                                                                    $id = $row['subject'];

                                                                    $query = $DB_con->prepare('SELECT name FROM lmssubject WHERE sid=' . $id);

                                                                    $query->execute();

                                                                    $result = $query->fetch();

                                                                    echo $result['name'];

                                                                    ?>
                                                                </td>
                                                                <td><?php echo $row['examname']; ?></td>
                                                                <td style="white-space: normal;"><?php echo date("Y-m-d h:i:s A", strtotime($row['add_date'])); ?></td>
                                                                <td style="white-space: normal;">Start: <?php echo date("Y-m-d h:i:s A", strtotime($row['edate'])); ?><br>End: <?php echo date("Y-m-d h:i:s A", strtotime($row['exam_end_date'])); ?></td>
                                                                <td><a class="btn btn-success btn-rounded mt-3 px-4" href="../admin/images/exams/<?php echo $row['edocument']; ?>" target="_blank">View Paper</a></td>

                                                            </tr>
                                                    <?php }
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