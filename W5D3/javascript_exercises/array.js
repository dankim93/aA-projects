Array.prototype.my_uniq = function() {
  let arr = [];
  for(let i=0;i<this.length;i++){
    if (!arr.includes(this[i])){
      arr.push(this[i]);
    }
  }
  return arr;
};


Array.prototype.two_sum = function(){
  let arr = [];
  for(let i=0;i<this.length-1;i++){
    for(let j=i+1;j<this.length;j++){
      if(this[i] + this[j] === 0){
        arr.push([i , j]);
      }
    }
  }
  return arr;
};

Array.prototype.my_transpose = function(){
  let arr = [];
  for(let i=0;i<this[0].length;i++){
    let sub_arr = [];
    for(let j=0;j<this.length;j++){
      sub_arr.push(this[j][i]);
    }
    arr.push(sub_arr);
  }
  return arr;
};


console.log([[0, 1, 2],
  [3, 4, 5],
  [6, 7, 8]].my_transpose());
