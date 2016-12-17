
Function.prototype.inherits = function(BaseClass) {
  function Surrogate() {}
  console.log(this);
  Surrogate.prototype = BaseClass.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
};

function Animal(name) {
  this.name = name ;
}

Animal.prototype.sleep = function () {
  console.log("sleep");
};

function Dog(name) {
  this.name = name ;
}

Dog.prototype.bark = function () {
  console.log("bark");
};
function Dog(name) {
  // this.name = name ;
  Animal.call(this, name);
}

Dog.inherits(Animal);
const dog = new Dog('kkkk');
console.log(dog.sleep());


// Dog.inherits(Dog);
// Cat.inherits(Animal);
// const dog = new Dog('dog', 'breed');
// const cat = new Cat('cat', 'black');
// console.log(dog.sleep);
// console.log(dog.bark());
// dog.sleep();
// // console.log(dog.meow());
// console.log(Dog.prototype);
