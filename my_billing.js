// When the user scrolls the page, execute myFunction 
window.onscroll = function() {myFunction()};

// Get the navbar
var navbar = document.getElementById("container8");

// Get the offset position of the navbar
var sticky = container8.offsetTop;

// Add the sticky class to the navbar when you reach its scroll position. Remove "sticky" when you leave the scroll position
function myFunction() {
  if (window.pageYOffset >= sticky) {
    container8.classList.add("sticky")
  } else {
    navbar.classList.remove("sticky");
  }
}