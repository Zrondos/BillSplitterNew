// When the user scrolls the page, execute myFunction 
window.onscroll = function() {myFunction()};

// Get the navbar
var navbar = document.getElementById("botton_nav");

// Get the offset position of the navbar
var sticky = botton_nav.offsetTop;

// Add the sticky class to the navbar when you reach its scroll position. Remove "sticky" when you leave the scroll position
function myFunction() {
  if (window.pageYOffset >= sticky) {
    botton_nav.classList.add("sticky")
  } else {
    botton_nav.classList.remove("sticky");
  }
}