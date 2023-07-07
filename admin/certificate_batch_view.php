<?php

if (!isset($_SESSION)) {
    session_start();
}

require_once 'includes.php';

include 'conn.php';

require_once 'dbconfig4.php';

?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Students Batch Wise Report | Online Learning Platforms | Dashboard</title>
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
            Header start
        ***********************************-->
        <!-- <div class="header">
			<div class="header-content">
				<nav class="navbar navbar-expand">
					<div class="collapse navbar-collapse justify-content-between">
						<div class="header-left">

						</div>

						<ul class="navbar-nav header-right">
							<li class="nav-item dropdown header-profile">
								<a class="nav-link" href="#" role="button" data-toggle="dropdown">
									<img src="images/profile/pic1.jpg" width="20" alt="" />
								</a>
								<div class="dropdown-menu dropdown-menu-right">
									<a href="admin.php" class="dropdown-item ai-icon">
										<svg id="icon-user1" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user">
											<path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
											<circle cx="12" cy="7" r="4"></circle>
										</svg>
										<span class="ml-2"><?php echo $user_name; ?></span>
									</a>
									<a href="logout.php" class="dropdown-item ai-icon">
										<svg id="icon-logout" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-log-out">
											<path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path>
											<polyline points="16 17 21 12 16 7"></polyline>
											<line x1="21" y1="12" x2="9" y2="12"></line>
										</svg>
										<span class="ml-2">Logout </span>
									</a>
								</div>
							</li>
						</ul>
					</div>
				</nav>
			</div>
		</div> -->
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
                            <h4>All Students</h4>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="home.php">Home</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0);">Students</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0);">All Students</a></li>
                        </ol>
                    </div>
                </div>

                <div class="row">

                    <div class="col-lg-12">
                        <div class="row tab-content">
                            <div id="list-view" class="tab-pane fade active show col-lg-12">
                                <div class="card border-0 bg-light">
                                    <div class="card-header">
                                        <h4 class="card-title">All Students </h4>
                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <div>
                                                <form class="form-horizontal" action="functions.php" method="post" name="upload_excel" enctype="multipart/form-data">
                                                    <div class="form-group">
                                                        <div class="col-md-12 col-md-offset-4" style="text-align:right;">
                                                            <input type="hidden" name="gid" value="<?php echo $_GET['gid']; ?>">
                                                            <input type="submit" name="export_grade" class="btn btn-success" value="export to excel" />
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                            <table id="dataTable" class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Action</th>
                                                        <th>Certificate Status</th>
                                                        <th>Student</th>
                                                        <th>Date</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php

                                                    $stmt = $DB_con->prepare("SELECT *
                                                    FROM lmsregister
                                                    -- INNER JOIN exam_submissions ON lmsregister.reid = exam_submissions.user_id
                                                    -- INNER JOIN lms_exam_report ON lmsregister.reid = lms_exam_report.exam_report_user
                                                    INNER JOIN verbal_exam ON lmsregister.reid = verbal_exam.userId
                                                    LEFT JOIN certificate ON lmsregister.reid = certificate.userId
                                                    where level = $_GET[gid]");

                                                    $stmt->execute();

                                                    if ($stmt->rowCount() > 0) {

                                                        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {

                                                            extract($row);

                                                    ?>
                                                            <tr>
                                                                <td><?php echo $row['reid']; ?></td>
                                                                <td>
                                                                    <a id="print-btn" class="btn btn-sm btn-primary" data-userid="<?php echo $row['reid']; ?>" data-certificate="<?php echo $row['certificate_status']; ?>"><i class="la la-print"></i></a>
                                                                </td>
                                                                <td>
                                                                    <?php

                                                                    if ($row['certificate_status'] == "0") {

                                                                        echo '<button class="btn btn-primary btn-sm">Pending</button>';
                                                                    } else if ($row['certificate_status'] == "1") {

                                                                        echo '<button class="btn btn-success btn-sm">Success</button>';
                                                                    } else if ($row['certificate_status'] == "") {

                                                                        echo '<button class="btn btn-success btn-sm">Not Issued</button>';
                                                                    }

                                                                    ?>
                                                                </td>
                                                                <td>
                                                                    <?php echo $row['fullname']; ?>
                                                                </td>

                                                                <td><strong><?php echo $row['issue_date']; ?></strong></td>

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





    <script>
        // Select the print button
        const printBtn = document.getElementById('print-btn');

        // Add a click event listener to the print button
        printBtn.addEventListener('click', function() {
            // Get the values of the data attributes
            const userid = printBtn.getAttribute('data-userid');
            const certificate = printBtn.getAttribute('data-certificate');


            // Check if certificate and status are empty
            if (certificate === "") {
                // Perform AJAX request to insert the data
                const xhr = new XMLHttpRequest();
                xhr.onreadystatechange = function() {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        // Reload the page after the AJAX request is completed
                        location.reload();
                    }
                };

                // Set up the AJAX request
                xhr.open('POST', 'certificate_insert.php', true);
                xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

                // Construct the data to send with the request
                const data = 'userid=' + encodeURIComponent(userid);

                // Send the AJAX request
                xhr.send(data);
            } else {
                // Perform AJAX request to update the data
                const xhr = new XMLHttpRequest();
                xhr.onreadystatechange = function() {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        // Reload the page after the AJAX request is completed
                        location.reload();
                    }
                };

                // Set up the AJAX request
                xhr.open('POST', 'certificate_update.php', true);
                xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

                // Construct the data to send with the request
                const data = 'userid=' + encodeURIComponent(userid) +
                    '&certificate=' + encodeURIComponent(certificate) +
                    '&status=' + encodeURIComponent(status);

                // Send the AJAX request
                xhr.send(data);
            }
        });
    </script>

    </script>



</body>

</html>