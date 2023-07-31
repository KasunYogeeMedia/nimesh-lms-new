
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
   <style type="text/css">
    .container.ba1 {
  padding: 150px 150px;
  
}

.btn.btnslogin {
  display: block;
  width: 100%;
  border-radius: 50px;
  
  margin: 25px auto;
  border: none;
  color: #fff;
  font-weight: bold;
  background: #bbd2c5;
  background: -webkit-linear-gradient(to right, #536976, #bbd2c5);
  background: linear-gradient(to right, #DC3545, #FFC107);
  border: none;
  cursor: pointer;
  transition: 500ms;
  overflow: hidden;
  z-index: 1;
  max-width: 300px;
  padding: 20px 20px;
  font-size: 20px;
}
.heading-text{
    margin: 25px auto;
}

@media (max-width: 576px){
.container.ba1 {
  padding: 0;

}

}
</style>
    <main>
        <div class="container ba1">
            <div class="row text-center">
                <h2 class="heading-text pb-20">Select your role?</h2>
                <div class="col-md-6 ">
                    <a href="/login.php" class="btn btnslogin">Student Login</a>  
                </div>   
                <div class="col-md-6">
                    <a href="/teacher" class="btn btnslogin">Teacher Login</a>
                </div>  
            </div>
        </div>
       
    </main>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>

</html>