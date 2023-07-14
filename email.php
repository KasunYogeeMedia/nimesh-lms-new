<?php

$secret_key = "6Lf9wpIiAAAAAPzPiKAttgm983bypxww23F9HupQ";

//$to = "info@abc.com";
$to = "ipdedu@ipdedu.com";

$logo = 'https://ipdedu.com/assets/img/logo-2.png';
$link = 'https://ipdedu.com/assets/img/logo-2.png';

$page_title = 'Institute for professional development';
$discription = 'Institute for professional development';
$companey = "Institute for professional development";
$thank_msg = "Thank you for contacting us. We're looking into your request and will contact you as soon as possible. ";

$name = $_POST['name'];
$from = $_POST['email'];
$phone = $_POST['phone'];
$subject = $_POST['subject'];
$message = $_POST['message'];


// set the timezone first
if(function_exists('date_default_timezone_set')) {
    date_default_timezone_set("Asia/Colombo");
}

// then use the date functions, not the other way around
$date = date("d/m/Y");
$date1 =  date("H:i a");

//$headers = "From: $from";
//$headers .= "From: " . $from . "\r\n";
//$headers .= "Reply-To: ". $from . "\r\n";
//$headers .= "MIME-Version: 1.0\r\n";
//$headers .= "Content-Type: text/html; charset=ISO-8859-1\r\n";

$headers  = "From: $from\n";
//$headers .= "Cc: testsite < mail@testsite.com >\n"; 
$headers .= "X-Sender:$from\n";
$headers .= 'X-Mailer: PHP/' . phpversion();
$headers .= "X-Priority: 1\n"; // Urgent message!
$headers .= "Return-Path: $from\n"; // Return path for errors
$headers .= "MIME-Version: 1.0\r\n";
$headers .= "Content-Type: text/html; charset=iso-8859-1\n";

$body = '

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html style="width:100%;font-family:roboto, "helvetica neue", helvetica, arial, sans-serif;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%;padding:0;Margin:0;">
 <head> 
  <meta charset="UTF-8"> 
  <meta content="width=device-width, initial-scale=1" name="viewport"> 
  <meta name="x-apple-disable-message-reformatting"> 
  <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
  <meta content="telephone=no" name="format-detection"> 
  <title>' . $page_title . ' </title> 
 
  <link href="https://fonts.googleapis.com/css?family=Roboto:400,400i,700,700i" rel="stylesheet"> 
  <!--<![endif]--> 
  <style type="text/css">
@media only screen and (max-width:600px) {.st-br { padding-left:10px!important; padding-right:10px!important } p, ul li, ol li, a { font-size:16px!important; line-height:150%!important } h1 { font-size:30px!important; text-align:center; line-height:120%!important } h2 { font-size:26px!important; text-align:center; line-height:120%!important } h3 { font-size:20px!important; text-align:center; line-height:120%!important } h1 a { font-size:30px!important; text-align:center } h2 a { font-size:26px!important; text-align:center } h3 a { font-size:20px!important; text-align:center } .es-menu td a { font-size:14px!important } .es-header-body p, .es-header-body ul li, .es-header-body ol li, .es-header-body a { font-size:16px!important } .es-footer-body p, .es-footer-body ul li, .es-footer-body ol li, .es-footer-body a { font-size:14px!important } .es-infoblock p, .es-infoblock ul li, .es-infoblock ol li, .es-infoblock a { font-size:12px!important } *[class="gmail-fix"] { display:none!important } .es-m-txt-c, .es-m-txt-c h1, .es-m-txt-c h2, .es-m-txt-c h3 { text-align:center!important } .es-m-txt-r, .es-m-txt-r h1, .es-m-txt-r h2, .es-m-txt-r h3 { text-align:right!important } .es-m-txt-l, .es-m-txt-l h1, .es-m-txt-l h2, .es-m-txt-l h3 { text-align:left!important } .es-m-txt-r img, .es-m-txt-c img, .es-m-txt-l img { display:inline!important } .es-button-border { display:block!important } a.es-button { font-size:16px!important; display:block!important; border-left-width:0px!important; border-right-width:0px!important } .es-btn-fw { border-width:10px 0px!important; text-align:center!important } .es-adaptive table, .es-btn-fw, .es-btn-fw-brdr, .es-left, .es-right { width:100%!important } .es-content table, .es-header table, .es-footer table, .es-content, .es-footer, .es-header { width:100%!important; max-width:600px!important } .es-adapt-td { display:block!important; width:100%!important } .adapt-img { width:100%!important; height:auto!important } .es-m-p0 { padding:0px!important } .es-m-p0r { padding-right:0px!important } .es-m-p0l { padding-left:0px!important } .es-m-p0t { padding-top:0px!important } .es-m-p0b { padding-bottom:0!important } .es-m-p20b { padding-bottom:20px!important } .es-mobile-hidden, .es-hidden { display:none!important } .es-desk-hidden { display:table-row!important; width:auto!important; overflow:visible!important; float:none!important; max-height:inherit!important; line-height:inherit!important } .es-desk-menu-hidden { display:table-cell!important } table.es-table-not-adapt, .esd-block-html table { width:auto!important } table.es-social { display:inline-block!important } table.es-social td { display:inline-block!important } }
.rollover:hover .rollover-first {
  max-height:0px!important;
  display:none!important;
}
.rollover:hover .rollover-second {
  max-height:none!important;
  display:block!important;
}
#outlook a {
  padding:0;
}
.ExternalClass {
  width:100%;
}
.ExternalClass,
.ExternalClass p,
.ExternalClass span,
.ExternalClass font,
.ExternalClass td,
.ExternalClass div {
  line-height:100%;
}
.es-button {
  mso-style-priority:100!important;
  text-decoration:none!important;
}
a[x-apple-data-detectors] {
  color:inherit!important;
  text-decoration:none!important;
  font-size:inherit!important;
  font-family:inherit!important;
  font-weight:inherit!important;
  line-height:inherit!important;
}
.es-desk-hidden {
  display:none;
  float:left;
  overflow:hidden;
  width:0;
  max-height:0;
  line-height:0;
  mso-hide:all;
}
.es-button-border:hover {
  border-style:solid solid solid solid!important;
  background:#d6a700!important;
  border-color:#42d159 #42d159 #42d159 #42d159!important;
}
.es-button-border:hover a.es-button {
  background:#d6a700!important;
  border-color:#d6a700!important;
}
</style> 
 </head> 
 <body style="width:100%;font-family:roboto, "helvetica neue", helvetica, arial, sans-serif;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%;padding:0;Margin:0;"> 
  <div class="es-wrapper-color" style="background-color:#F6F6F6;"> 
   <!--[if gte mso 9]>
      <v:background xmlns:v="urn:schemas-microsoft-com:vml" fill="t">
        <v:fill type="tile" color="#f6f6f6"></v:fill>
      </v:background>
    <![endif]--> 
   <table class="es-wrapper" width="100%" cellspacing="0" cellpadding="0" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;padding:0;Margin:0;width:100%;height:100%;background-repeat:repeat;background-position:center top;"> 
     <tr style="border-collapse:collapse;"> 
      <td class="st-br" valign="top" style="padding:0;Margin:0;"> 
       <table cellpadding="0" cellspacing="0" class="es-header" align="center" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;table-layout:fixed !important;width:100%;background-color:transparent;background-repeat:repeat;background-position:center top;"> 
         <tr style="border-collapse:collapse;"> 
          <td align="center" style="padding:0;Margin:0;background-image:url(https://eibgtd.stripocdn.email/content/guids/CABINET_cf1df54b4dff5544a5d226764700442f/images/20841560930387653.jpg);background-color:transparent;background-position:center bottom;background-repeat:no-repeat;" bgcolor="transparent" background="https://eibgtd.stripocdn.email/content/guids/CABINET_cf1df54b4dff5544a5d226764700442f/images/20841560930387653.jpg"> 
           <!--[if gte mso 9]><v:rect xmlns:v="urn:schemas-microsoft-com:vml" fill="true" stroke="false" style="mso-width-percent:1000;height:204px;"><v:fill type="tile" src="https://pics.esputnik.com/repository/home/17278/common/images/1546958148946.jpg" color="#343434" origin="0.5, 0" position="0.5,0" ></v:fill><v:textbox inset="0,0,0,0"><![endif]--> 
           <div> 
            <table bgcolor="transparent" class="es-header-body" align="center" cellpadding="0" cellspacing="0" width="600" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-color:transparent;"> 
              <tr style="border-collapse:collapse;"> 
               <td align="left" style="padding:0;Margin:0;padding-top:20px;padding-left:20px;padding-right:20px;"> 
                <table cellpadding="0" cellspacing="0" width="100%" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;"> 
                  <tr style="border-collapse:collapse;"> 
                   <td width="560" align="center" valign="top" style="padding:0;Margin:0;"> 
                    <table cellpadding="0" cellspacing="0" width="100%" role="presentation" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;"> 
                      <tr style="border-collapse:collapse;"> 
                       <td align="center" style="padding:0;Margin:0;"><a target="_blank" href="#" style="-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:roboto, "helvetica neue", helvetica, arial, sans-serif;font-size:14px;text-decoration:underline;color:#1376C8;"><img src="'.$logo.'" alt style="display:block;border:0;outline:none;text-decoration:none;-ms-interpolation-mode:bicubic;width:auto;height:auto;" width="254"></a></td> 
                      </tr> 
                      <tr style="border-collapse:collapse;"> 
                       <td align="center" height="65" style="padding:0;Margin:0;"></td> 
                      </tr> 
                    </table></td> 
                  </tr> 
                </table></td> 
              </tr> 
            </table> 
           </div> 
           <!--[if gte mso 9]></v:textbox></v:rect><![endif]--></td> 
         </tr> 
       </table> 
       <table cellpadding="0" cellspacing="0" class="es-content" align="center" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;table-layout:fixed !important;width:100%;"> 
         <tr style="border-collapse:collapse;"> 
          <td align="center" bgcolor="transparent" style="padding:0;Margin:0;background-color:transparent;"> 
           <table bgcolor="transparent" class="es-content-body" align="center" cellpadding="0" cellspacing="0" width="600" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-color:transparent;"> 
             <tr style="border-collapse:collapse;"> 
              <td align="left" style="Margin:0;padding-bottom:15px;padding-top:30px;padding-left:30px;padding-right:30px;border-radius:10px 10px 0px 0px;background-color:#FFFFFF;background-position:left bottom;" bgcolor="#ffffff"> 
               <table cellpadding="0" cellspacing="0" width="100%" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;"> 
                 <tr style="border-collapse:collapse;"> 
                  <td width="540" align="center" valign="top" style="padding:0;Margin:0;"> 
                   <table cellpadding="0" cellspacing="0" width="100%" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-position:left bottom;" role="presentation"> 
                     <tr style="border-collapse:collapse;"> 
                      <td align="center" style="padding:0;Margin:0;"><h1 style="Margin:0;line-height:36px;mso-line-height-rule:exactly;font-family:tahoma, verdana, segoe, sans-serif;font-size:30px;font-style:normal;font-weight:bold;color:#212121;">Congratulations !<br><span style="font-size:25px;color:#0000FF;">You Have New Inquiry</span></h1></td> 
                     </tr> 
                   </table></td> 
                 </tr> 
               </table></td> 
             </tr> 
             <tr style="border-collapse:collapse;"> 
              <td align="left" style="Margin:0;padding-top:5px;padding-bottom:5px;padding-left:30px;padding-right:30px;border-radius:0px 0px 10px 10px;background-position:left top;background-color:#FFFFFF;"> 
               <table cellpadding="0" cellspacing="0" width="100%" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;"> 
                 <tr style="border-collapse:collapse;"> 
                  <td width="540" align="center" valign="top" style="padding:0;Margin:0;"> 
                   <table cellpadding="0" cellspacing="0" width="100%" role="presentation" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;"> 
                     <tr style="border-collapse:collapse;"> 
                      <td align="left" style="padding:0;Margin:0;"> 
                       <ul> 
                        <li style="-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-size:18px;font-family:roboto, "helvetica neue", helvetica, arial, sans-serif;line-height:27px;Margin-bottom:15px;color:#131313;text-align:justify;"><strong>Name &nbsp; &nbsp;:</strong>' . $name .'</li> 
                        <li style="-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-size:18px;font-family:roboto, "helvetica neue", helvetica, arial, sans-serif;line-height:27px;Margin-bottom:15px;color:#131313;text-align:justify;"><strong>Email &nbsp; &nbsp; :&nbsp;</strong>' . $from .'</li> 
                         <li style="-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-size:18px;font-family:roboto, "helvetica neue", helvetica, arial, sans-serif;line-height:27px;Margin-bottom:15px;color:#131313;text-align:justify;"><strong>Phone &nbsp; &nbsp;:</strong>' . $phone . ' </li> 
                        <li style="-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-size:18px;font-family:roboto, "helvetica neue", helvetica, arial, sans-serif;line-height:27px;Margin-bottom:15px;color:#131313;text-align:justify;"><strong>Subject &nbsp; &nbsp;:</strong>' . $subject . ' </li> 

                      </ul></td> 
                     </tr> 
                     <tr style="border-collapse:collapse;"> 
                      <td align="center" style="padding:0;Margin:0;"><h3 style="Margin:0;line-height:30px;mso-line-height-rule:exactly;font-family:tahoma, verdana, segoe, sans-serif;font-size:20px;font-style:normal;font-weight:normal;color:#212121;text-align:center;"><strong><u>Message</u></strong><br>  ' . $message . ' </h3></td> 
                     </tr> 
                   </table></td> 
                 </tr> 
               </table></td> 
             </tr> 
             <tr style="border-collapse:collapse;"> 
              <td align="left" style="Margin:0;padding-top:30px;padding-bottom:30px;padding-left:30px;padding-right:30px;"> 
               <table cellpadding="0" cellspacing="0" width="100%" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;"> 
                 <tr style="border-collapse:collapse;"> 
                  <td width="540" align="center" valign="top" style="padding:0;Margin:0;"> 
                   <table cellpadding="0" cellspacing="0" width="100%" role="presentation" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;"> 
                     <tr style="border-collapse:collapse;"> 
                      <td align="center" style="padding:0;Margin:0;"><h3 style="Margin:0;line-height:30px;mso-line-height-rule:exactly;font-family:tahoma, verdana, segoe, sans-serif;font-size:20px;font-style:normal;font-weight:normal;color:#212121;"> ' . $discription . '</h3></td> 
                     </tr> 
                   </table></td> 
                 </tr> 
               </table></td> 
             </tr> 
           </table></td> 
         </tr> 
       </table> 
       <table cellpadding="0" cellspacing="0" class="es-footer" align="center" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;table-layout:fixed !important;width:100%;background-color:#F6F6F6;background-repeat:repeat;background-position:center top;"> 
         <tr style="border-collapse:collapse;"> 
          <td align="center" style="padding:0;Margin:0;background-image:url(https://eibgtd.stripocdn.email/content/guids/CABINET_cf1df54b4dff5544a5d226764700442f/images/31751560930679125.jpg);background-position:left bottom;background-repeat:no-repeat;" background="https://eibgtd.stripocdn.email/content/guids/CABINET_cf1df54b4dff5544a5d226764700442f/images/31751560930679125.jpg"> 
           <table bgcolor="#31cb4b" class="es-footer-body" align="center" cellpadding="0" cellspacing="0" width="600" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-color:transparent;"> 
             <tr style="border-collapse:collapse;"> 
              <td align="left" bgcolor="#efefef" style="padding:0;Margin:0;padding-left:30px;padding-right:30px;background-color:#EFEFEF;"> 
               <table cellpadding="0" cellspacing="0" width="100%" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;"> 
                 <tr style="border-collapse:collapse;"> 
                  <td width="540" align="center" valign="top" style="padding:0;Margin:0;"> 
                   <table cellpadding="0" cellspacing="0" width="100%" role="presentation" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;"> 
                     <tr style="border-collapse:collapse;"> 
                      <td align="center" style="padding:10px;Margin:0;"><p style="Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-size:16px;font-family:roboto, "helvetica neue", helvetica, arial, sans-serif;line-height:24px;color:#131313;">Solutions By <strong><a target="_blank" style="-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:roboto, "helvetica neue", helvetica, arial, sans-serif;font-size:16px;text-decoration:underline;color:#1740E2;text-align:center;" href="https://www.uxlanka.com">UX Lanka</a></strong></p></td> 
                     </tr> 
                   </table></td> 
                 </tr> 
               </table></td> 
             </tr> 
             <tr style="border-collapse:collapse;"> 
              <td align="left" style="padding:0;Margin:0;background-position:left top;"> 
               <table cellpadding="0" cellspacing="0" width="100%" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;"> 
                 <tr style="border-collapse:collapse;"> 
                  <td width="600" align="center" valign="top" style="padding:0;Margin:0;"> 
                   <table cellpadding="0" cellspacing="0" width="100%" role="presentation" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;"> 
                     <tr style="border-collapse:collapse;"> 
                      <td align="center" height="40" style="padding:0;Margin:0;"></td> 
                     </tr> 
                   </table></td> 
                 </tr> 
               </table></td> 
             </tr> 
           </table></td> 
         </tr> 
       </table></td> 
     </tr> 
   </table> 
  </div>  
 </body>
</html>

';


  // cliant reply
  $body1 = '

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html style="width:100%;font-family:roboto, "helvetica neue", helvetica, arial, sans-serif;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%;padding:0;Margin:0;">
 <head> 
  <meta charset="UTF-8"> 
  <meta content="width=device-width, initial-scale=1" name="viewport"> 
  <meta name="x-apple-disable-message-reformatting"> 
  <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
  <meta content="telephone=no" name="format-detection"> 
  <title> ' . $page_title . ' </title> 
 
  <link href="https://fonts.googleapis.com/css?family=Roboto:400,400i,700,700i" rel="stylesheet"> 
  <!--<![endif]--> 
  <style type="text/css">
@media only screen and (max-width:600px) {.st-br { padding-left:10px!important; padding-right:10px!important } p, ul li, ol li, a { font-size:16px!important; line-height:150%!important } h1 { font-size:30px!important; text-align:center; line-height:120%!important } h2 { font-size:26px!important; text-align:center; line-height:120%!important } h3 { font-size:20px!important; text-align:center; line-height:120%!important } h1 a { font-size:30px!important; text-align:center } h2 a { font-size:26px!important; text-align:center } h3 a { font-size:20px!important; text-align:center } .es-menu td a { font-size:14px!important } .es-header-body p, .es-header-body ul li, .es-header-body ol li, .es-header-body a { font-size:16px!important } .es-footer-body p, .es-footer-body ul li, .es-footer-body ol li, .es-footer-body a { font-size:14px!important } .es-infoblock p, .es-infoblock ul li, .es-infoblock ol li, .es-infoblock a { font-size:12px!important } *[class="gmail-fix"] { display:none!important } .es-m-txt-c, .es-m-txt-c h1, .es-m-txt-c h2, .es-m-txt-c h3 { text-align:center!important } .es-m-txt-r, .es-m-txt-r h1, .es-m-txt-r h2, .es-m-txt-r h3 { text-align:right!important } .es-m-txt-l, .es-m-txt-l h1, .es-m-txt-l h2, .es-m-txt-l h3 { text-align:left!important } .es-m-txt-r img, .es-m-txt-c img, .es-m-txt-l img { display:inline!important } .es-button-border { display:block!important } a.es-button { font-size:16px!important; display:block!important; border-left-width:0px!important; border-right-width:0px!important } .es-btn-fw { border-width:10px 0px!important; text-align:center!important } .es-adaptive table, .es-btn-fw, .es-btn-fw-brdr, .es-left, .es-right { width:100%!important } .es-content table, .es-header table, .es-footer table, .es-content, .es-footer, .es-header { width:100%!important; max-width:600px!important } .es-adapt-td { display:block!important; width:100%!important } .adapt-img { width:100%!important; height:auto!important } .es-m-p0 { padding:0px!important } .es-m-p0r { padding-right:0px!important } .es-m-p0l { padding-left:0px!important } .es-m-p0t { padding-top:0px!important } .es-m-p0b { padding-bottom:0!important } .es-m-p20b { padding-bottom:20px!important } .es-mobile-hidden, .es-hidden { display:none!important } .es-desk-hidden { display:table-row!important; width:auto!important; overflow:visible!important; float:none!important; max-height:inherit!important; line-height:inherit!important } .es-desk-menu-hidden { display:table-cell!important } table.es-table-not-adapt, .esd-block-html table { width:auto!important } table.es-social { display:inline-block!important } table.es-social td { display:inline-block!important } }
.rollover:hover .rollover-first {
  max-height:0px!important;
  display:none!important;
}
.rollover:hover .rollover-second {
  max-height:none!important;
  display:block!important;
}
#outlook a {
  padding:0;
}
.ExternalClass {
  width:100%;
}
.ExternalClass,
.ExternalClass p,
.ExternalClass span,
.ExternalClass font,
.ExternalClass td,
.ExternalClass div {
  line-height:100%;
}
.es-button {
  mso-style-priority:100!important;
  text-decoration:none!important;
}
a[x-apple-data-detectors] {
  color:inherit!important;
  text-decoration:none!important;
  font-size:inherit!important;
  font-family:inherit!important;
  font-weight:inherit!important;
  line-height:inherit!important;
}
.es-desk-hidden {
  display:none;
  float:left;
  overflow:hidden;
  width:0;
  max-height:0;
  line-height:0;
  mso-hide:all;
}
.es-button-border:hover {
  border-style:solid solid solid solid!important;
  background:#d6a700!important;
  border-color:#42d159 #42d159 #42d159 #42d159!important;
}
.es-button-border:hover a.es-button {
  background:#d6a700!important;
  border-color:#d6a700!important;
}
</style> 
 </head> 
 <body style="width:100%;font-family:roboto, "helvetica neue", helvetica, arial, sans-serif;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%;padding:0;Margin:0;"> 
  <div class="es-wrapper-color" style="background-color:#F6F6F6;"> 
   <!--[if gte mso 9]>
      <v:background xmlns:v="urn:schemas-microsoft-com:vml" fill="t">
        <v:fill type="tile" color="#f6f6f6"></v:fill>
      </v:background>
    <![endif]--> 
   <table class="es-wrapper" width="100%" cellspacing="0" cellpadding="0" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;padding:0;Margin:0;width:100%;height:100%;background-repeat:repeat;background-position:center top;"> 
     <tr style="border-collapse:collapse;"> 
      <td class="st-br" valign="top" style="padding:0;Margin:0;"> 
       <table cellpadding="0" cellspacing="0" class="es-header" align="center" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;table-layout:fixed !important;width:100%;background-color:transparent;background-repeat:repeat;background-position:center top;"> 
         <tr style="border-collapse:collapse;"> 
          <td align="center" style="padding:0;Margin:0;background-image:url(https://eibgtd.stripocdn.email/content/guids/CABINET_cf1df54b4dff5544a5d226764700442f/images/20841560930387653.jpg);background-color:transparent;background-position:center bottom;background-repeat:no-repeat;" bgcolor="transparent" background="https://eibgtd.stripocdn.email/content/guids/CABINET_cf1df54b4dff5544a5d226764700442f/images/20841560930387653.jpg"> 
           <!--[if gte mso 9]><v:rect xmlns:v="urn:schemas-microsoft-com:vml" fill="true" stroke="false" style="mso-width-percent:1000;height:204px;"><v:fill type="tile" src="https://pics.esputnik.com/repository/home/17278/common/images/1546958148946.jpg" color="#343434" origin="0.5, 0" position="0.5,0" ></v:fill><v:textbox inset="0,0,0,0"><![endif]--> 
           <div> 
            <table bgcolor="transparent" class="es-header-body" align="center" cellpadding="0" cellspacing="0" width="600" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-color:transparent;"> 
              <tr style="border-collapse:collapse;"> 
               <td align="left" style="padding:0;Margin:0;padding-top:20px;padding-left:20px;padding-right:20px;"> 
                <table cellpadding="0" cellspacing="0" width="100%" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;"> 
                  <tr style="border-collapse:collapse;"> 
                   <td width="560" align="center" valign="top" style="padding:0;Margin:0;"> 
                    <table cellpadding="0" cellspacing="0" width="100%" role="presentation" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;"> 
                      <tr style="border-collapse:collapse;"> 
                       <td align="center" style="padding:0;Margin:0;"><a target="_blank" href="https://www.uxlanka.com/" style="-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:roboto, "helvetica neue", helvetica, arial, sans-serif;font-size:14px;text-decoration:underline;color:#1376C8;"><img src="'.$logo.'" alt style="display:block;border:0;outline:none;text-decoration:none;-ms-interpolation-mode:bicubic;width:auto;height:auto;" width="254"></a></td> 
                      </tr> 
                      <tr style="border-collapse:collapse;"> 
                       <td align="center" height="65" style="padding:0;Margin:0;"></td> 
                      </tr> 
                    </table></td> 
                  </tr> 
                </table></td> 
              </tr> 
            </table> 
           </div> 
           <!--[if gte mso 9]></v:textbox></v:rect><![endif]--></td> 
         </tr> 
       </table> 
       <table cellpadding="0" cellspacing="0" class="es-content" align="center" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;table-layout:fixed !important;width:100%;"> 
         <tr style="border-collapse:collapse;"> 
          <td align="center" bgcolor="transparent" style="padding:0;Margin:0;background-color:transparent;"> 
           <table bgcolor="transparent" class="es-content-body" align="center" cellpadding="0" cellspacing="0" width="600" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-color:transparent;"> 
             <tr style="border-collapse:collapse;"> 
              <td align="left" style="Margin:0;padding-bottom:15px;padding-top:30px;padding-left:30px;padding-right:30px;border-radius:10px 10px 0px 0px;background-color:#FFFFFF;background-position:left bottom;" bgcolor="#ffffff"> 
               <table cellpadding="0" cellspacing="0" width="100%" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;"> 
                 <tr style="border-collapse:collapse;"> 
                  <td width="540" align="center" valign="top" style="padding:0;Margin:0;"> 
                   <table cellpadding="0" cellspacing="0" width="100%" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-position:left bottom;" role="presentation"> 
                     <tr style="border-collapse:collapse;"> 
                      <td align="center" style="padding:0;Margin:0;"><h1 style="Margin:0;line-height:36px;mso-line-height-rule:exactly;font-family:tahoma, verdana, segoe, sans-serif;font-size:30px;font-style:normal;font-weight:bold;color:#212121;">Hello ' . $name . ' !<br><span style="font-size:25px;color:#0000FF;">Thank for Contacting ' . $companey . '</span></h1></td> 
                     </tr> 
                   </table></td> 
                 </tr> 
               </table></td> 
             </tr> 
             <tr style="border-collapse:collapse;"> 
              <td align="left" style="Margin:0;padding-top:5px;padding-bottom:5px;padding-left:30px;padding-right:30px;border-radius:0px 0px 10px 10px;background-position:left top;background-color:#FFFFFF;"> 
               <table cellpadding="0" cellspacing="0" width="100%" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;"> 
               <hr>
                 <tr style="border-collapse:collapse;"> 
                  <td width="540" align="center" valign="top" style="padding:0;Margin:0;"> 
                   <table cellpadding="0" cellspacing="0" width="100%" role="presentation" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;"> 
                      
                     <tr style="border-collapse:collapse;"> 
                      <td align="center" style="padding:0;Margin:0;"><h3 style="Margin:0;line-height:30px;mso-line-height-rule:exactly;font-family:tahoma, verdana, segoe, sans-serif;font-size:20px;font-style:normal;font-weight:normal;color:#212121;text-align:center;"><br>' . $thank_msg . '</h3></td> 
                     </tr> 
                   </table></td> 
                 </tr> 
               </table></td> 
             </tr> 
     
           </table></td> 
         </tr> 
       </table> 
       <br>
       <table cellpadding="0" cellspacing="0" class="es-footer" align="center" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;table-layout:fixed !important;width:100%;background-color:#F6F6F6;background-repeat:repeat;background-position:center top;"> 
         <tr style="border-collapse:collapse;"> 
          <td align="center" style="padding:0;Margin:0;background-image:url(https://eibgtd.stripocdn.email/content/guids/CABINET_cf1df54b4dff5544a5d226764700442f/images/31751560930679125.jpg);background-position:left bottom;background-repeat:no-repeat;" background="https://eibgtd.stripocdn.email/content/guids/CABINET_cf1df54b4dff5544a5d226764700442f/images/31751560930679125.jpg"> 
           <table bgcolor="#31cb4b" class="es-footer-body" align="center" cellpadding="0" cellspacing="0" width="600" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-color:transparent;"> 
             <tr style="border-collapse:collapse;"> 
              <td align="left" bgcolor="#efefef" style="padding:0;Margin:0;padding-left:30px;padding-right:30px;background-color:#EFEFEF;"> 
               <table cellpadding="0" cellspacing="0" width="100%" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;"> 
                 <tr style="border-collapse:collapse;"> 
                  <td width="540" align="center" valign="top" style="padding:0;Margin:0;"> 
                   <table cellpadding="0" cellspacing="0" width="100%" role="presentation" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;"> 
                     <tr style="border-collapse:collapse;"> 
                      <td align="center" style="padding:10px;Margin:0;"><p style="Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-size:16px;font-family:roboto, "helvetica neue", helvetica, arial, sans-serif;line-height:24px;color:#131313;">Solutions By <strong><a target="_blank" style="-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:roboto, "helvetica neue", helvetica, arial, sans-serif;font-size:16px;text-decoration:underline;color:#1740E2;text-align:center;" href="https://www.UXlanka.com">UX Lanka</a></strong></p></td> 
                     </tr> 
                   </table></td> 
                 </tr> 
               </table></td> 
             </tr> 
             <tr style="border-collapse:collapse;"> 
              <td align="left" style="padding:0;Margin:0;background-position:left top;"> 
               <table cellpadding="0" cellspacing="0" width="100%" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;"> 
                 <tr style="border-collapse:collapse;"> 
                  <td width="600" align="center" valign="top" style="padding:0;Margin:0;"> 
                   <table cellpadding="0" cellspacing="0" width="100%" role="presentation" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;"> 
                     <tr style="border-collapse:collapse;"> 
                      <td align="center" height="40" style="padding:0;Margin:0;"></td> 
                     </tr> 
                   </table></td> 
                 </tr> 
               </table></td> 
             </tr> 
           </table></td> 
         </tr> 
       </table></td> 
     </tr> 
   </table> 
  </div>  
 </body>
</html>

';


  //  $send = mail($to, $subject, $body, $headers);

  if(isset($_POST['email'])) {
    // print_r($_POST);
    $url = "https://www.google.com/recaptcha/api/siteverify";
    $data = [
      'secret' => "{$secret_key}",
      'response' => $_POST['token'],
      // 'remoteip' => $_SERVER['REMOTE_ADDR']
    ];
    $options = array(
        'http' => array(
          'header'  => "Content-type: application/x-www-form-urlencoded\r\n",
          'method'  => 'POST',
          'content' => http_build_query($data)
        )
      );
    $context  = stream_context_create($options);
      $response = file_get_contents($url, true, $context);
    $res = json_decode($response, true);

   // if($res['success'] == true) {    
    if(1) {
    
      // Perform you logic here for ex:- save you data to database
        $send = mail($to, $subject, $body, $headers);
        if($send){
          $status = "1";
          echo "1";
          $send = mail($from, $subject, $body1, $headers);
        }else{
          $status = "2";
          echo '2';
        }
    } else {
          $status = "0";
          echo '0';
    }
  }

 ?>