<?php
// Load the database configuration file
include_once '../super_admin/conn.php';

if (isset($_POST['importSubmit'])) {

    // Allowed mime types
    $csvMimes = array('text/x-comma-separated-values', 'text/comma-separated-values', 'application/octet-stream', 'application/vnd.ms-excel', 'application/x-csv', 'text/x-csv', 'text/csv', 'application/csv', 'application/excel', 'application/vnd.msexcel', 'text/plain');

    // Validate whether selected file is a CSV file
    if (!empty($_FILES['file']['name']) && in_array($_FILES['file']['type'], $csvMimes)) {

        // If the file is uploaded
        if (is_uploaded_file($_FILES['file']['tmp_name'])) {

            // Open uploaded CSV file with read-only mode
            $csvFile = fopen($_FILES['file']['tmp_name'], 'r');

            // Skip the first line
            fgetcsv($csvFile);

            // Parse data from CSV file line by line
            while (($line = fgetcsv($csvFile)) !== FALSE) {
                // Get row data
                $reid   = $line[0];
                $stnumber  = $line[1];
                $fullname  = $line[2];
                $dob = $line[3];
                $level = $line[4];
                $district = $line[5];
                $gender = $line[6];
                $contactnumber = $line[7];
                $password = $line[8];
                // Check whether member already exists in the database with the same email
                $prevQuery = "SELECT contactnumber FROM lmsregister WHERE contactnumber = '" . $line[7] . "'";
                $prevResult = $conn->query($prevQuery);

                if ($prevResult->num_rows > 0) {
                    // Update member data in the database
                    $conn->query("UPDATE members SET name = '" . $name . "', phone = '" . $phone . "', status = '" . $status . "', modified = NOW() WHERE email = '" . $email . "'");
                } else {
                    // Insert member data in the database
                    $conn->query("INSERT INTO lmsregister (reid, stnumber, fullname, dob, level, district, gender, contactnumber, password) VALUES ('" . $reid . "', '" . $stnumber . "', '" . $fullname . "', '" . $dob . "','" . $level . "','" . $district . "', '" . $gender . "', '" . $contactnumber . "', '" . $password . "')");
                }
            }

            // Close opened CSV file
            fclose($csvFile);

            $qstring = '?status=succ';
        } else {
            $qstring = '?status=err';
        }
    } else {
        $qstring = '?status=invalid_file';
    }
}

// Redirect to the listing page
header("Location: student_import.php" . $qstring);
