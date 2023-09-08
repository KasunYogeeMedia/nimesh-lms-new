<?php
ob_start();
session_start();

$a = time() + 60 * 60 * 24 * 30;

$exp_date = date("Y-m-d", $a);

require_once("../super_admin/config.php");

require_once '../super_admin/dbconfig4.php';

include '../super_admin/conn.php';

if (!isset($_SESSION['reid'])) {

    header('location:../login.php');

    die();
}

$user_qury = mysqli_query($conn, "SELECT * FROM certificate WHERE certificate_status =1 AND userId='$_SESSION[reid]'");
$user_resalt = mysqli_fetch_array($user_qury);

if ($user_resalt > 0) {

    echo '
    
    <html>

<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Crimson+Text&family=Marck+Script&family=Roboto:ital,wght@0,300;0,400;1,300;1,400&display=swap" rel="stylesheet">
    <style type="text/css">
        body,
        html {
            margin: 0;
            padding: 0;
            
        }

        body {
            background-image: url(https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/v546batch3-mynt-34-badgewatercolor_1.jpg?w=800&dpr=1&fit=default&crop=default&q=65&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=89288ef4b47127f7f34a5998b50e4470);
            color: black;
            display: table;
            font-family: Georgia, serif;
            font-size: 18px;
            text-align: center;
            width: 100%;
            height: 100%;
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            font-family: "Roboto", sans-serif;
            opacity:0;
        }

        .container {
            width: 100%;
            height: 100%;
            display: table-cell;
            vertical-align: middle;
        }

        .logo {
            position: absolute;
            top: 20%;
            left: 7%;
            max-width: 12%;
        }

        .icon {
            position: absolute;
            top: 55%;
            right: 8%;
            max-width: 14%;
        }

        .title {
            color: 870CA5;
            font-size: 46px;
            font-weight: bold;
            font-family: "Crimson Text", serif;
            width: 80%;
            margin: auto;
        }

        .subtitle {
            font-size: 20px;
        }

        .course {
            font-size: 52px;
            margin: 16px;
            font-family: "Marck Script", cursive;
        }

        .assignment {
            margin: 10px;
            font-style: italic;
            font-weight: 300;
        }

        .person {
            border-bottom: 2px solid black;
            font-size: 32px;
            font-style: italic;
            margin: 20px auto;
            width: 400px;

        }

        .dotted {
            border-bottom: 2px dotted #000;
            text-decoration: none;
        }

        .reason {
            margin: 20px;
            max-width: 60%;
            margin: auto;
            line-height: 1.5;
            font-style: italic;
            font-weight: 300;
        }

        .foot-table {
            margin: auto;
            text-align: center;
            margin-top: 8%;
            width: 100%;
        }

        .foot-table td {
            vertical-align: baseline;
            font-size: 12px;
        }

        .sign-preson {
	font-size: 14px;
	margin: 5px;
	color: #870CA5;
	font-weight: bold;
}
@media print {
   body{
    opacity:1;
   }
}
    </style>
    <style type="text/css" media="print">
@page {
    size: auto;   /* auto is the initial value */
    margin: 0;  /* this affects the margin in the printer settings */
}
</style>

</head>

<body>
    <div class="container">

        <img class="logo" src="images/logo.png" alt="">
        <img class="icon" src="images/icon.png" alt="">

        <div class="title">
            INSTITUTE FOR PROFESSIONAL
            DEVELOPMENT
        </div>

        <div class="course">
            Announcing Course
        </div>

        <div class="subtitle">
            CERTIFICATE OF COMPLETION
        </div>

        <div class="assignment">
            This is proudly presented to
        </div>

        <div class="person dotted">
            Name
        </div>

        <div class="reason">
            for participating and successfully completing
            <br>
            the Presentation & Announcing Course.
            <br>
            Awarded <span class="dotted">dotted text here</span>
            <br>
            The approved programme at IPD
        </div>
        <table class="foot-table">
            <tr>
                <td>
                    <span class="dotted">dotted text here</span>

                    <div class="sign-preson">
                        Lal Sarath Kumara
                    </div>
                    Voice Over Artist
                    <br>
                    Television and Radio/Senior Lecturer
                </td>
                <td style="margin: 0 2%">
                    <span class="dotted">dotted text here</span>

                    <div class="sign-preson">
                        K. A. Priyanka Perera
                    </div>
                    Consultant
                    <br>
                    Training and Skill Development
                    <br>
                    IPD Institute
                </td>
                <td>
                    <span class="dotted">dotted text here</span>

                    <div class="sign-preson">
                        Chanaka Inoj
                    </div>
                    Senior Journalist / Lecturer &
                    <br>
                    News Anchor
                </td>
            </tr>
        </table>
    </div>
<script>
    window.print();
    window.history.back();
</script>

</body>

</html>

    ';
} else {
    echo '
    
    <html>

<head>
    <title>Certificate Not Found</title>
    <style>
        * {
            transition: all 0.6s;
        }

        html {
            height: 100%;
        }

        body {
            font-family: "Lato", sans-serif;
            color: #888;
            margin: 0;
        }

        #main {
            display: table;
            width: 100%;
            height: 100vh;
            text-align: center;
        }

        .fof {
            display: table-cell;
            vertical-align: middle;
        }

        .fof h1 {
            font-size: 50px;
            display: inline-block;
            padding-right: 12px;
            animation: type .2s alternate infinite;
        }

        @keyframes type {
            from {
                box-shadow: inset -3px 0px 0px #888;
            }

            to {
                box-shadow: inset -3px 0px 0px transparent;
            }
        }
    </style>
</head>

<body>
    <div id="main">
        <div class="fof">
            <h1>Certificate Not Found</h1>
        </div>
    </div>
    <script>
    setTimeout("history.go(-1)", 1000);
</script>
</body>

</html>
    
    ';
}
