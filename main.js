//ones we open the brower we want those things to be there:
let DRAGGING_PERSON="Helllloooo!!!! ";
class Person {
  constructor(id, name,color){
    this.element = document.createElement('div');
    this.element.id = id;
    this.element.classList.add('person');
    this.element.style.backgroundColor = color;
    this.element.draggable=true;

    this.element.addEventListener("dragstart", this.startDrag,false);
    this.name = name;
    document.querySelector('.container2').appendChild(this.element);
  }
  startDrag( ){
    DRAGGING_PERSON = "Heeeeellllllooooooo!!!";
  }
}
// e => this.grab(name)
class Item {
  constructor(id, color){
  //generate random id for each new item
  //Creates an item:
    this.element = document.createElement('div');
    this.element.id = id;
    console.log(id);
    this.element.classList.add('item');
    this.element.style.backgroundColor = color;
// adds addEventListeners:
    this.element.addEventListener("drop",this.addPerson, false);
    this.element.addEventListener("dragenter",function(e){e.preventDefault();},false);
    this.element.addEventListener("dragover",function(e){e.preventDefault(); },false);
//Output to the page:
    document.querySelector('.container1').appendChild(this.element);
  }
  addPerson(e){

    // e.target.innerText = DRAGGING_PERSON;
    // circles.class = "this.id";
    // e.target.innerText = this.id;
    // this.element = document.createElement('div');
    // this.element.draggable=true;
    // let id = this.id;
    // circles[id].setAttribute("id", id);
    e.target.innerHTML += circles[this.id];
  //create circle id and pass it
  }
  //if they add two people to one item


}
// class Circle {
//   constructor(id, name){
//     this.element = document.createElement('div');
//     this.element.id = id;
//     this.element.draggable=true;
//
//     this.element.addEventListener("dragstart", this.startDrag,false);
//     this.name = name;
//     document.querySelector('.container1').appendChild(this.element);
//   }
//   startDrag( ){
//     firstIcon = "Heeeeellllllooooooo!!!";
//   }
// }
// Item color goes by Person ID:
function doFirst(){

  const bill = new Person(1,'Bill',"red");
  const drink = new Item(1, 'orange');
  const rich = new Person(2,'Bill',"orange");
  const itemanother = new Item(2, 'tomato');
  const samanta = new Person(0,'Bill',"green");
  const awesome = new Item(5, 'tomato');
  console.log(bill,drink,rich,itemanother,samanta,awesome);
  }
  // firstPerson = document.getElementById("person1");
  // firstPerson.style = "background-color: blue";
  // firstPerson.addEventListener("dragstart", startDrag, false);
  // firstItem = document.getElementById('item1');
  // firstItem.style = "background-color: red";
  // firstItem.addEventListener("dragenter",function(e){e.preventDefault();},false);
  // firstItem.addEventListener("dragover",function(e){e.preventDefault(); },false);
  // firstItem.addEventListener("drop",dropped, false);

// }
  // var circles = [];
  //
  // for(let i = 0; i < 10; i++) {
  //   var circle[i] = '<div class="circle circle[i]" draggable="true" > </div>';
  //   circles.push(circle[i]);
  // }
  //
  var circle1 = '<div class="circle circle1" draggable="true" > </div>';
  var circle2 = '<div class="circle circle2" draggable="true" > </div>';
  var circle3 = '<div class="circle circle3" draggable="true" > </div>';
  var circle4 = '<div class="circle circle4" > </div>';
  var circle5 = '<div class="circle circle5" > </div>';
  var circle6 = '<div class="circle circle6" > </div>';
  var circle7 = '<div class="circle circle7" > </div>';
  var circles = [circle1, circle2, circle3, circle4,circle5,circle6,circle7];

window.addEventListener("load",doFirst, false);
// function startDrag(e){
//   e.dataTransfer.setData("Text",circle1);
// }
//Ones we drop the item we want person icon to appear next to the item
//and drag item to disappear:
// function dropped(e){
//   e.preventDefault();
//   firstItem.innerHTML += circle1;
//   secondItem.innerHTML += circle2;
//     firstItem.style = "background-color: yellow";
//   e.dataTransfer.getData("Text",
//   console.log(e);
// }


//Must have features:
// Ability to drug element to multiple items
//Each item has array of people

//Adge cases:
// 1. In case they change mind and want to drag element back
// 2. Delete item
// 3. Edit item
// Things to keep on mind:

// create function to create users of the form or smth
// remove person add person
//
