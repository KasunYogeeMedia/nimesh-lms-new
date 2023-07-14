<!DOCTYPE html>
<html lang="zxx">

<!-- Mirrored from theme-flix.com/edumen/contact.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 23 Aug 2021 05:07:54 GMT -->
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ipdedu</title>
    <link rel=icon href="assets/img/favicon.png" sizes="20x20" type="image/png">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="assets/css/vendor.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/responsive.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  
  <script src="https://www.google.com/recaptcha/api.js?render=6Lf9wpIiAAAAAA3HAjI2mBEhPGVZx9JyXR9-wnoj"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</head>
<body>

    <!-- preloader area start -->
    <div class="preloader" id="preloader">
        <div class="preloader-inner">
            <div class="spinner">
                <div class="dot1"></div>
                <div class="dot2"></div>
            </div>
        </div>
    </div>
    <!-- preloader area end -->
  
    <!-- include header -->
    <?php include'include/header.php';?>

    <!-- page title start -->
    <div class="page-title-area bg-overlay" style="background-image: url('assets/img/bg/3.jpg')">
        <div class="container">
            <div class="row">
                <div class="col-lg-7">
                    <div class="breadcrumb-inner">
                        <h2 class="page-title">INSTITUTION FOR PROFESSINAL DEVELOPMENT</h2>
                        <ul class="page-list">
                            <li><a href="index.php">Home</a></li>
                            <li>Contact</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- page title end -->

    <!-- contact area start -->
    <div class="contact-area pd-top-110 pd-bottom-120">
        <div class="container">
            <div class="section-title text-center">
                <h2 class="title">Get in touch</h2>
            </div>
            <div class="row">
                <div class="col-lg-5 col-md-6">
                    <div class="contact-page-thumb thumb" style="background-image: url('assets/img/bg/5.png')"></div>
                </div>
                <div class="col-lg-7 col-md-6 align-self-center">
                    <form action="#" id="form" method="post" class="contact-form-inner  mt-5 mt-md-0">
                        <div class="row custom-gutters-20">
                            <div class="col-lg-6">
                                <label class="single-input-inner style-bg-border">
                                    <input type="text" name="name" id="name" placeholder="Full Name" required>
                                </label>
                            </div>
                            <div class="col-lg-6">
                                <label class="single-input-inner style-bg-border">
                                   <input type="text" name="phone"   id="phone_number" placeholder="Phone No" required>
                                </label>
                            </div>
                            <div class="col-6">
                                <label class="single-input-inner style-bg-border">
                                    <input type="email" name="email" id="email" placeholder="Your Email *" required>
                                </label>
                            </div>
                          <div class="col-6">
                                <label class="single-input-inner style-bg-border">
                                    <input type="subject" name="subject" id="msg_subject" placeholder="Subject" required>
                                </label>
                            </div>
                            <div class="col-12">
                                <label class="single-input-inner style-bg-border">
                                    <textarea name="message" id="message" placeholder="Message" required></textarea>
                                </label>
                            </div>
                            <div class="col-12">
                              <button type="submit" id="submit" class="btn btn-base">Submit</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- contact area end-->
  

    <div class="contact-g-map">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d247.55074378721022!2d79.88761733630204!3d6.913080263956962!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae25990edd6a659%3A0x5cea1672870b7b4e!2s!5e0!3m2!1sen!2slk!4v1666170803367!5m2!1sen!2slk"></iframe>
    </div>

  <!--  email -->    
                 <script>
      $(function() {

        $('#form').on('submit', function (e) {

          e.preventDefault();

          $.ajax({
            url: "email.php",
            type: 'post',
            data:  new FormData(this),
            contentType: false,
            cache: false,
            processData:false,
            success: function (data) {
            if(data == 1){
               swal("Success !", "Your Email Sent !", "success");
                $('#form')[0].reset();
            }else if(data == 2){
              swal("Sorry !", "Email Send Faild !", "error");
            }else{
              swal("Sorry !", "Email Send Faild !", "error");

            }
              
            }
          });

        });

      });
    </script>
    
    <script>
      grecaptcha.ready(function() {
          grecaptcha.execute('6Lf9wpIiAAAAAA3HAjI2mBEhPGVZx9JyXR9-wnoj', {action: 'homepage'}).then(function(token) {
             // console.log(token);
             document.getElementById("token").value = token;
          });
      });
    </script>
  
      <!-- include footer -->
    <?php include'include/footer.php';?>

    <!-- back to top area start -->
    <div class="back-to-top">
        <span class="back-top"><i class="fa fa-angle-up"></i></span>
    </div>
    <!-- back to top area end -->


    <!-- all plugins here -->
    <script src="assets/js/vendor.js"></script>
    <!-- main js  -->
    <script src="assets/js/main.js"></script>
</body>

<!-- Mirrored from theme-flix.com/edumen/contact.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 23 Aug 2021 05:08:47 GMT -->
</html>