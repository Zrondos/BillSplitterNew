//ones we open the brower we want those things to be there:
let DRAGGING_PERSON;
class Person {
  constructor(id, name,color){
    this.element = document.createElement('div');
    this.element.id = id;

    this.element.classList.add('person');
    this.element.style.backgroundColor = color;
    this.element.draggable=true;

    this.element.addEventListener("dragstart", this.startDrag.bind(this),false);

    this.name = name;
    this.id = id;
    this.color = color;

    document.querySelector('.container2').appendChild(this.element);
  }
  startDrag( ){
    console.log(this)
    //global variable that holds the person:
    DRAGGING_PERSON = this;
  }
}
// e => this.grab(name)
class Item {
  constructor(id, color){
  //generate random id for each new item
  //Creates an item:
    // console.log(person);
    // this.id= person.id;
    // var personid = id;
    // console.log(personid);

    this.element = document.createElement('div');
    this.element.id = id;
    this.element.classList.add('item');
    this.element.style.backgroundColor = color;
// adds addEventListeners:
    this.element.addEventListener("drop",this.addPerson.bind(this), false);
    this.element.addEventListener("dragenter",function(e){e.preventDefault();},false);
    this.element.addEventListener("dragover",function(e){e.preventDefault(); },false);
//Output to the page:
    document.querySelector('.container1').appendChild(this.element);
  }
  addPerson(e){

    console.log(DRAGGING_PERSON);
    // console.log(personid);
    e.target.innerText = DRAGGING_PERSON.name;
    // e.target.innerText = this.id;
    let circle = document.createElement('div');
    circle.draggable=true;
    let id = this.id;
    circle.classList.add(`circle`);
    circle.classList.add(`circle${DRAGGING_PERSON.id}`);
    e.target.appendChild(circle);
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
  const drink = new Item(1, 'orange',"rachel");
  const rich = new Person(2,'Chaler',"orange");
  const itemanother = new Item(2, 'tomato',"rich");
  const samanta = new Person(3,'Franklin',"green");
  const awesome = new Item(3, 'tomato',"bill");
;
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
  // var circle1 = '<div class="circle circle1" draggable="true" > </div>';
  // var circle2 = '<div class="circle circle2" draggable="true" > </div>';
  // var circle3 = '<div class="circle circle3" draggable="true" > </div>';
  // var circle4 = '<div class="circle circle4" > </div>';
  // var circle5 = '<div class="circle circle5" > </div>';
  // var circle6 = '<div class="circle circle6" > </div>';
  // var circle7 = '<div class="circle circle7" > </div>';
  // var circles = [circle1, circle2, circle3, circle4,circle5,circle6,circle7];

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
