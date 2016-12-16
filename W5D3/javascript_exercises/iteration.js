const bubble_sort = function(array) {
  let n = 0;
  while (n < array.length){
    for (let i = 0; i < array.length - 1; i++) {
      if (array[i] > array[i+1]) {
        let temp = array[i];
        array[i] = array[i+1];
        array[i+1] = temp;
      }
    }
    n++;
  }
  return array;
};

// console.log(bubble_sort([4,3,1,6,2]));


function substrings(string) {
  let arr = string.split("");
  let results = [];
  for (let i = 0; i < arr.length; i++) {
    for (let j = i + 1; j < arr.length + 1; j++) {
      results.push(arr.slice(i, j).join(""));
    }
  }
  return results;
}

console.log(substrings("hello"));
