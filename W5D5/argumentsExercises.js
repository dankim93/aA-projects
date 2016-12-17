// function sum(...numbers){
//   let total = 0;
//   for(let i = 0; i< numbers.length; i++){
//     total += numbers[i];
//   }
//   return total;
// }
//
// // console.log(sum(1,2,3,4));
//
// function sum2(){
//   let total = 0 ;
//   for(let i = 0; i < arguments.length; i++){
//     total += arguments[i];
//   }
//   return total;
// }
// console.log(sum2(1,2,3,4,5));

// Function.prototype.myBind = function () {
//   let outerThis = this;
//   let outerArgs = Array.from(arguments);
//   // console.log(outerArgs);
//   return function () {
//     let context = outerArgs[0];
//
//       let remainingArgs = outerArgs.slice(1);
//       let innerArgs = Array.from(arguments);
//       // console.log(innerArgs);
//       return outerThis.apply(context, remainingArgs.concat(innerArgs));
//
//   } ;
//
// };




// class Cat {
//   constructor(name) {
//     this.name = name;
//   }
//
//   says(sound, person) {
//     console.log(`${this.name} says ${sound} to ${person}!`);
//     return true;
//   }
// }
//
// const markov = new Cat("Markov");
// const breakfast = new Cat("Breakfast");
//
// markov.says("meow", "Ned");
// markov.says.myBind(breakfast, "meow", "Kush")();
// markov.says.myBind(breakfast)("meow", "a tree");
// markov.says.myBind(breakfast, "meow")("Markov");
// const notMarkovSays = markov.says.myBind(breakfast);
// notMarkovSays("meow", "me");

// Function.prototype.myBindRest = function (...args) {
//   let outerThis = this;
//   let outerArgs = Array.from(args);
//   // console.log(outerArgs);
//   return function (...args2) {
//     let context = outerArgs[0];
//
//       let remainingArgs = outerArgs.slice(1);
//       let innerArgs = Array.from(args2);
//       // console.log(innerArgs);
//       return outerThis.apply(context, remainingArgs.concat(innerArgs));
//
//   } ;
//
// };

// class Cat {
//   constructor(name) {
//     this.name = name;
//   }
//
//   says(sound, person) {
//     console.log(`${this.name} says ${sound} to ${person}!`);
//     return true;
//   }
// }
//
// const markov = new Cat("Markov");
// const breakfast = new Cat("Breakfast");
//
// markov.says("meow", "Ned");
// markov.says.myBindRest(breakfast, "meow", "Kush")();
// markov.says.myBindRest(breakfast)("meow", "a tree");
// markov.says.myBindRest(breakfast, "meow")("Markov");
// const notMarkovSays = markov.says.myBind(breakfast);
// notMarkovSays("meow", "me");



// function curriedSum(numArgs) {
//   let numbers = [];
//   function _curriedSum(newNum){
//     // let args = Array.from(arguments);
//       numbers.push(newNum);
//       if (numbers.length === numArgs) {
//         let total = numbers.reduce((acc, el) =>  acc + el );
//         return total;
//       } else  {
//         return _curriedSum;
//       }
//
//   }
//   return _curriedSum;
// }
//
//
// const sum = curriedSum(4);
// console.log(sum(5)(30)(20)(1));

Function.prototype.curry = function(numArgs) {
  let numbers = [];
  let outerThis = this;
  function currySum(args) {
    numbers.push(args);
    if (numbers.length === numArgs) {
      return outerThis(...numbers);
    } else {
      return currySum;
    }
  }
  return currySum;
};


Function.prototype.curry = function(numArgs) {
  let numbers = [];
  let outerThis = this;
  function currySum(args) {
    numbers.push(args);
    if (numbers.length === numArgs) {
      return outerThis.apply(null, numbers);
    } else {
      return currySum;
    }
  }
  return currySum;
};

const checkCurry = function(...args) {
  console.log(args);
};

checkCurry.curry(4)(3)(3)(2)(2);
