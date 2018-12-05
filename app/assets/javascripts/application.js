// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

array=[]
function dragstart_handler(event){
    sub_array=[(event.target.id)]
    array.push(event.target.id)
    event.dataTransfer.setData("text", event.target.id);
    event.dataTransfer.dropEffect="copy"
}
function dragover_handler(event) {
    event.preventDefault();
   }
function drop_handler(event){
    event.preventDefault();
    var data = event.dataTransfer.getData("text");
    var nodeCopy = document.getElementById(data).cloneNode(true);
    nodeCopy.id = data+"newId"; 
    nodeCopy.setAttribute("class","user");
    event.target.appendChild(nodeCopy);
    nodeCopy.children[0].setAttribute("class","initials")

    children = document.querySelectorAll('.parent .child1');

    array.push(event.target.id+"/");
    document.getElementById("array_of_data").value+=array

    array=[]
}

function myreceipt() {
    var element = document.getElementById("loading_button");
    element.style.display="inline-block"
}

