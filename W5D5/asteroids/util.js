
// Function.prototype.inherits = function(ParentClass) {
//   function Surrogate() {}
//   console.log(this);
//   Surrogate.prototype = ParentClass.prototype;
//   this.prototype = new Surrogate();
//   this.prototype.constructor = this;
// };

const Util = {
  inherits (childClass, parentClass){
      function Surrogate() { this.constructor = childClass;}
       Surrogate.prototype = parentClass.prototype;
      childClass.prototype = new Surrogate();
  }
};


module.exports = Util;
