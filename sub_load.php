<div class="sub_table">

    <?php

    require_once("super_admin/conn.php");

    $subject_qury = mysqli_query($conn, "SELECT * FROM lmssubject WHERE class_id='$_GET[cid]' ORDER BY name");
    if (!mysqli_num_rows($subject_qury) > 0) {
        echo "Course Not Found";
    }

    while ($subject_resalt = mysqli_fetch_array($subject_qury)) {
    ?>

        <div class="table-responsive">
            <table class="table text-light">
                <tr>
                    <td class="checkbox">
                        <input type="checkbox" name="subjects[]" id="<?php echo $subject_resalt['sid']; ?>" value="<?php echo $subject_resalt['sid']; ?>">
                    </td>
                    <td>
                        <label style="font-size: 15px; font-weight: bold; display: block;" for="<?php echo $subject_resalt['sid']; ?>">
                            <?php echo $subject_resalt['name']; ?>
                        </label>
                    </td>
            </table>
        </div>

    <?php
    }
    ?>
</div>