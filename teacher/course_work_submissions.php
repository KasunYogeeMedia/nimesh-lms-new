<?php

if (!isset($_SESSION)) {
    session_start();
}

require_once 'includes.php';

include '../super_admin/conn.php';

require_once '../super_admin/dbconfig4.php';

if (isset($_POST["submit"])) {
    $marks = htmlspecialchars($_POST["marks"]);
    $submission_id = htmlspecialchars($_POST["submission_id"]);

    $sql = "UPDATE course_work_submissions SET marks = " . $marks . " WHERE id = " . $submission_id;

    echo $sql;

    $query = mysqli_query($conn, $sql);

    $success = 1;
}


$exam_id = 0;

if (isset($_GET['exam_id'])) {
    $exam_id = htmlspecialchars($_GET['exam_id']);
}




?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Course Works Submissions | Online Learning Platforms | Dashboard</title>
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
                            <h4>Submissions</h4>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="home.php">Home</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0);">Submissions</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0);">Submissions</a></li>
                        </ol>
                    </div>
                </div>

                <div class="row">

                    <div class="col-lg-12">
                        <div class="row tab-content">
                            <div id="list-view" class="tab-pane fade active show col-lg-12">
                                <div class="card border-0 bg-light">
                                    <div class="card-header">
                                        <h4 class="card-title">Submissions</h4>
                                    </div>
                                    <div class="card-body">
                                        <?php
                                        if (isset($success)) {
                                        ?>
                                            <div class="alert alert-success" role="alert">
                                                Marks updated successfully!
                                            </div>
                                        <?php } ?>

                                        <div class="form-group">

                                            <select class="form-control" onchange="this.options[this.selectedIndex].value && (window.location = 'course_work_submissions.php?exam_id=' + this.options[this.selectedIndex].value);">
                                                <option value="0">Filter Course Work</option>
                                                <?php

                                                $query = mysqli_query($conn, "SELECT * FROM lmscourse_work where tid=$_SESSION[tid]");
                                                while ($result = mysqli_fetch_array($query)) {
                                                    if ($result['exid']  ==  $exam_id) {
                                                        echo '<option selected="selected" value="' . $result['exid'] . '">' . $result['examname'] . '</option>';
                                                    } else {
                                                        echo '<option value="' . $result['exid'] . '">' . $result['examname'] . '</option>';
                                                    }
                                                }

                                                ?>
                                            </select>

                                        </div>


                                        <div class="table-responsive">
                                            <table id="dataTable" class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <td>Course Work Title</td>
                                                        <td>Student</td>
                                                        <td>Sbmitted Date/Time</td>
                                                        <td>Due Date/Time</td>
                                                        <td>Status</td>
                                                        <td>Marks</td>
                                                        <td>Action</td>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php
                                                    $today_time = date("Y-m-d");

                                                    if ($exam_id != 0) {
                                                        $submission_query = mysqli_query($conn, "SELECT * FROM course_work_submissions WHERE exam_id =$exam_id");
                                                    } else {
                                                        $submission_query = mysqli_query($conn, "SELECT * FROM course_work_submissions");
                                                    }

                                                    while ($submission_result = mysqli_fetch_array($submission_query)) {
                                                        date_default_timezone_set('Asia/Colombo');

                                                        $exam_query = mysqli_query($conn, "SELECT * FROM lmscourse_work  WHERE exid=' $submission_result[exam_id] '  AND tid='$_SESSION[tid]' ");
                                                        $user_query = mysqli_query($conn, "SELECT * FROM lmsregister  WHERE reid=" . $submission_result['user_id']);

                                                        $exam_result = mysqli_fetch_array($exam_query);
                                                        $user_result = mysqli_fetch_array($user_query);

                                                    ?>
                                                        <tr>
                                                            <td><?php echo $exam_result['examname']; ?></td>
                                                            <td><?php echo $user_result['fullname']; ?></td>
                                                            <td><?php echo $submission_result['time']; ?></td>
                                                            <td><?php echo $exam_result['edate'] . " - " . $exam_result['endtime']; ?></td>
                                                            <?php

                                                            $submitted_time = strtotime($submission_result['time']);
                                                            $deadline = strtotime($exam_result['edate'] . " " . $exam_result['endtime']);

                                                            if ($deadline - $submitted_time) {

                                                                echo '<td><button class="btn btn-success btn-sm">Submited</span></td>';
                                                            } else {

                                                                echo '<td><span>Late submitted</span></td>';
                                                            }

                                                            ?>
                                                            <td>
                                                                <?php echo $submission_result['marks']; ?>%
                                                                <?php /*?><?php if ($submission_result['marks'] == -1) {echo "NA"; }else{echo $submission_result['marks'] . " %";} ?><a href="#" class="edit_marks_btn" <?php if ($submission_result['marks'] != -1) {echo 'data-current_marks="'.$submission_result['marks'].'"'; }else{echo 'data-current_marks="0"';} ?> data-submission_id="<?php echo $submission_result['id']; ?>" ><i class="fa fa-edit"></i><?php */ ?>
                                                            </td>
                                                            <td><a target="_blank" href="add_course_work_marks.php?id=<?php echo $submission_result['id']; ?>"><button class="btn btn-primary btn-sm">Check &amp; Add Marks</button></a></td>
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
                </div>

            </div>
        </div>
        <!--**********************************
            Content body end
        ***********************************-->

        <div id="edit_marks_modal" class="modal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <form action="submissions.php" method="POST">
                        <div class="modal-header">
                            <h5 class="modal-title">Give/Edit Marks</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <input type="value" name="marks" min="0" max="100" class="form-control" required="required">
                            <input type="hidden" name="submission_id" id="submission_id">
                            <input type="hidden" name="current_marks" id="current_marks">
                        </div>
                        <div class="modal-footer">
                            <input type="submit" name="submit" class="btn btn-primary">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

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
        function exportTableToExcel(tableID, filename = '') {
            var downloadLink;
            var dataType = 'application/vnd.ms-excel';
            var tableSelect = document.getElementById(tableID);
            var tableHTML = tableSelect.outerHTML.replace(/ /g, '%20');

            // Specify file name
            filename = filename ? filename + '.xls' : 'excel_data.xls';

            // Create download link element
            downloadLink = document.createElement("a");

            document.body.appendChild(downloadLink);

            if (navigator.msSaveOrOpenBlob) {
                var blob = new Blob(['\ufeff', tableHTML], {
                    type: dataType
                });
                navigator.msSaveOrOpenBlob(blob, filename);
            } else {
                // Create a link to the file
                downloadLink.href = 'data:' + dataType + ', ' + tableHTML;

                // Setting the file name
                downloadLink.download = filename;

                //triggering the function
                downloadLink.click();
            }
        }
    </script>

    <script>
        $(".edit_marks_btn").click(function() {
            var id = $(this).data("submission_id");
            var current_marks = $(this).data("current_marks");

            $("#edit_marks_modal").modal("show");
            $("#submission_id").val(id);
            $("#current_marks").val(current_marks);
        })

        $(document).ready(function() {

            loadGallery(true, 'a.thumbnail');

            //This function disables buttons when needed
            function disableButtons(counter_max, counter_current) {
                $('#thow-previous-image, #thow-next-image').thow();
                if (counter_max == counter_current) {
                    $('#thow-next-image').hide();
                } else if (counter_current == 1) {
                    $('#thow-previous-image').hide();
                }
            }

            /**
             *
             * @param setIDs        Sets IDs when DOM is loaded. If using a PHP counter, set to false.
             * @param setClickAttr  Sets the attribute for the click handler.
             */

            function loadGallery(setIDs, setClickAttr) {
                var current_image,
                    selector,
                    counter = 0;

                $('#thow-next-image, #thow-previous-image').click(function() {
                    if ($(this).attr('id') == 'thow-previous-image') {
                        current_image--;
                    } else {
                        current_image++;
                    }

                    selector = $('[data-image-id="' + current_image + '"]');
                    updateGallery(selector);
                });

                function updateGallery(selector) {
                    var $sel = selector;
                    current_image = $sel.data('image-id');
                    $('#image-gallery-caption').text($sel.data('caption'));
                    $('#image-gallery-title').text($sel.data('title'));
                    $('#image-gallery-image').attr('src', $sel.data('image'));
                    disableButtons(counter, $sel.data('image-id'));
                }

                if (setIDs == true) {
                    $('[data-image-id]').each(function() {
                        counter++;
                        $(this).attr('data-image-id', counter);
                    });
                }
                $(setClickAttr).on('click', function() {
                    updateGallery($(this));
                });
            }
        });
    </script>

    <script>
        function Publithed_teathrs(id) {

            $.ajax({
                url: 'publithed_teathrs.php',
                method: 'POST',
                data: {
                    id: id
                },
                success: function(data) {
                    location.reload();

                }
            });

        }

        function Reject_ads(id) {
            alert(id);
            $.ajax({
                url: 'reject_teathrs.php',
                method: 'POST',
                data: {
                    id: id
                },
                success: function(data) {
                    location.reload();

                }
            });

        }
    </script>

</body>

</html>