// Cstom Scripts Here
$(document).ready(function () {
    $('#dataTable').DataTable();
    $('.select2').select2();

});

function toggleDisplay() {
    var element = document.getElementById('dropdown');
    if (element.style.display === 'none') {
        element.style.display = 'block';
    } else {
        element.style.display = 'none';
    }
    // alert("clicked");
}
function rightsboff() {
    var rgsb = document.getElementById('rgsb');
    var rsbtnon = document.getElementById('rsbtnon');
    rgsb.style.display = 'none';
    rsbtnon.style.display = 'block';
}
function rightsbon() {
    var rgsb = document.getElementById('rgsb');
    var rsbtnon = document.getElementById('rsbtnon');
    rgsb.style.display = 'block';
    rsbtnon.style.display = 'none';
}

// function fadeInBody() {
//     var deznav = document.querySelector('.deznav');
//     var opacity = 0;
//     var timer = setInterval(function() {
//       if (opacity >= 1) {
//         clearInterval(timer);
//       }
//       deznav.style.opacity = opacity;
//       deznav.style.filter = 'alpha(opacity=' + opacity * 100 + ')';
//       opacity += 0.01; // Adjust the increment value for the desired speed of the fade-in effect
//     }, 10); // Adjust the interval value for the desired smoothness of the fade-in effect
//   }
  
//   // Call the function immediately after defining it
//   fadeInBody();
  
  