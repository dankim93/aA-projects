Array.prototype.my_each = function(arg) {
  for(let i = 0; i < this.length; i++) {
    arg(this[i]);
  }
  return this;
};

const x = function(el) {
  console.log(el);
};

// [1,2,3].my_each(x);

Array.prototype.my_map = function(arg) {
  let arr = [];
  for (let i = 0; i < this.length; i++) {
    arr.push(arg(this[i]));
  }

  return arr;
};

const y = function(el) {
  return el * 2;
};

// console.log([1,2,3].my_map(y));

Array.prototype.my_inject = function(arg) {
  let acc = this[0];
  this.slice(1).my_each(
      el => acc = arg(acc, el));

  //
  //   function(el){
  //   acc = arg(acc, el);
  // });

  return acc;
};

console.log([1, 2, 3].my_inject((a, b) => a + b));
