function range(a, b){
  if(a === b){
    return [a];
  }
 return [a].concat(range((a+1), b));
}

// console.log(range(1,5));

function exponent(base, n){
  if( n === 0 ){
    return 1;
  }
  return base * (exponent(base, (n-1)));
}

// console.log(exponent(2, 3));

function fibonacci(n){
  if(n === 2 ){
    return [1, 1];
  }
  let fib = fibonacci(n-1);
  let l = fib.length - 1;
  // let last_two = fibonacci(n-1).slice(-2);
  return fib.concat(fib[l] + fib[l - 1]);
}

// console.log(fibonacci(4));

function bsearch(arr, target) {
  let mid_idx = Math.floor(arr.length / 2);
  let mid_num = arr[mid_idx];

  if(mid_num === target){
    return mid_idx;
  }
  else if(arr.length <= 1 ){
    return null;
  }

  if(mid_num > target){
    return bsearch(arr.slice(0, mid_idx), target);
  }
  else
  {
    return mid_idx +
    bsearch(arr.slice(mid_idx, arr.length), target);
  } }
// console.log(bsearch([1, 2, 3, 4, 5, 6], 6));


function make_change(target, coins){
  if (target ===  0) {
    return [];
  } else if (coins.length <= 0) {
    return null;
  }

  let best_change;
    for(let i = 0; i < coins.length; i++) {
      if (coins[i] > target) {
        continue;
      }
      let remainder = target - coins[i];
      let best_remainder = make_change(remainder, coins.slice(i, coins.length));

      if (best_remainder == false) {
        continue;
      }
      let this_change = [coins[i]] + best_remainder;

      if (best_change === undefined || (this_change.length < best_change.length)) {
        best_change = this_change;
      }
    }

  return best_change;
}

// console.log(make_change(14, [10, 7, 1]));
function merge_sort(arr){
  if(arr.length < 2 ){
    return arr;
  }

  let mid_idx = Math.floor(arr.length / 2);
  debugger;
  let left = merge_sort(arr.slice(0, mid_idx));
  let right = merge_sort(arr.slice(mid_idx, arr.length));
  debugger;
  return merge(left, right);
}

function merge(left, right){
  let sorted_arr = [];
  while(left.length >= 1 && right.length >= 1){
    if (left[0] < right[0]) {
      sorted_arr.push(left.shift());
    }
    else {
      sorted_arr.push(right.shift());
    }
  }

return sorted_arr.concat(left).concat(right);
}

// console.log(merge_sort([3,4,2,1,6,5]));


function subset(arr) {
  if(arr.length<1){
    return [[]];
  }
  let new_arr = [];
  let x = arr[0];
  let sub_arr = subset(arr.slice(1, arr.length));
  sub_arr.forEach(function(el) {
    console.log(el);
      let el_dup = el.concat([x]);
      new_arr.push(el_dup);
    });

  return sub_arr.concat(new_arr);

}

console.log(subset([1,5,3]));
