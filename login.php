<?php

if (!isset($_SESSION)) {
    session_start();
}
error_reporting(0);

require_once 'super_admin/conn.php';
require_once 'super_admin/config.php';
require_once 'super_admin/dbconfig4.php';

if (isset($_SESSION["reid"])) {
}

$ip_address = time();


if (isset($_POST['login'])) {

    $username = (int)$_POST['username'];

    $password = md5($_POST['password']);

    $sql = mysqli_query($conn, "SELECT * FROM lmsregister WHERE contactnumber = '$username' and status='1'");

    if (mysqli_num_rows($sql) > 0) {

        $result = mysqli_fetch_array($sql);
        if ($password == $result['password']) {

            if ($result['relogin'] == 0) {

                $_SESSION['reid'] = $result['reid'];

                //setcookie('reid', $result['reid'], time() + (86400 * 30), "/");

                echo "<script>window.location='profile/student_profile.php';</script>";
            } else {
                echo "<script>window.location='login.php?ip_error';</script>";
            }
        } else {
            //password not match
            echo "<script>window.location='login.php?password_error';</script>";
        }
    } else {
        //user not found
        echo "<script>window.location='login.php?user_error';</script>";
    }
}

?>
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="author" content="Sadegh Rastgoo" />
    <title>Login</title>
    <link rel="stylesheet" href="node_modules/normalize.css/normalize.css" />
    <link rel="stylesheet" href="./assets/css/stylesm.css">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@200;400;700&display=swap" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/8e9390d601.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css" />
    <!-- Fonts -->
    <link rel="icon" href="assets/img/favicon.png" />
    <link rel="stylesheet" href="assets/css/log-styles.css" />
    <!-- font-awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
    <div class="background">
        <video class="background--vid" src="files/video-bg.mp4" autoplay muted loop></video>
    </div>
    <main>
        <div class="card__image-container">
            <div class="slide-images">
                <img class="slide" src="assets/img/slide1.jpg" alt="Card Image" />
                <img class="slide" src="assets/img/slide2.jpg" alt="Card Image" />
                <img class="slide" src="assets/img/slide3.jpg" alt="Card Image" />
            </div>
        </div>
        <form method="POST">
            <?php if (isset($_GET['request'])) { ?><div class="alert alert-info text-center"><strong>Information!</strong><br>Your Re login request send successfully. Waiting for approval your request.</div><?php } ?>
            <?php if (isset($_GET['password_error'])) { ?><div class="alert alert-danger text-center"><strong>We're sorry! </strong><br>The username or password you entered doesn't match our records.
                    Please try again or use the forgot my password button to reset your password</div><?php } ?>
            <?php if (isset($_GET['user_error'])) { ?><div class="alert alert-danger text-center"><strong>Sorry!</strong><br>The email address you entered isn't connected to an account, please register</div><?php } ?>
            <?php if (isset($_GET['ip_error'])) { ?><div class="alert alert-danger text-center"><strong>Sorry!</strong><br>Your account has been blocked due to unautorised access.<br><br><a style="color: dodgerblue; cursor: pointer;" onClick="JavaScript:window.location='login.php?req_id=<?php echo $_GET['u']; ?>';">Request Re login?</a></div><?php } ?>
            <?php if (isset($_GET['success'])) { ?><div class="alert alert-success" style="font-weight:bold;background-color:#f36a22;color:#ffffff;"> Thanks for registering! Sign in now and start learning right away! </div><?php } ?>
            <h2 class="heading-text">Sign In</h2>
            <div class="inp-1">
                <i class="far fa fa-mobile fa-lg"></i>
                <input name="username" id="username" value="<?php if (isset($_POST['username'])) {
                                                                echo $_POST['username'];
                                                            } ?>" type="text" required placeholder="Your Phone Number" maxlength="10" minlength="10">
            </div>
            <div class="inp-1">
                <i class="far fa fa-key fa-lg"></i>
                <input name="password" type="password" required id="myInput" placeholder="Your Password">
            </div>

            <button name="login" type="submit" class="custom-btn btn-13">Login</button>
            <hr />
            <a class="areu" href="forgot_password.php">Forgot Password?</a>
            <a class="areu" href="register.php">Don't have an account?</a>
        </form>
    </main>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>

</html>