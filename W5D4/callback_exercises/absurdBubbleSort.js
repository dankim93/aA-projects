const readline = require('readline');
const reader = readline.createInterface({

  input: process.stdin,
  output: process.stdout
});


// let absurdBubbleSort = function(arr, sortCompletionCallback) {


  let askIfGreaterThan = function(el1, el2, callback) {
      reader.question(`${el1} greater than ${el2}? (yes/no)`, function(res) {
        if (res === "yes") {
          callback(true);
        }
        else if (res === "no") {
          callback(false);
        }
        else {
          console.log("Response not valid, please reply 'yes' or 'no'");
          askIfGreaterThan(el1, el2, callback);
        }
      });
  };

  let innerBubbleSortLoop = function(array, i, madeAnySwaps, outerBubbleSortLoop) {
    console.log(array);


    if (i < array.length - 1) {
      askIfGreaterThan(array[i], array[i+1], (isGreaterThan) => {
        if (isGreaterThan) {
          [array[i], array[i+1]] = [array[i+1], array[i]];
          madeAnySwaps = true;
          console.log(array);
        }
        innerBubbleSortLoop(array, i + 1, madeAnySwaps, outerBubbleSortLoop);
      });
    }
    else if (i === (array.length - 1)) {
      outerBubbleSortLoop(madeAnySwaps);
    }

  };

  let absurdBubbleSort = function(arr, sortCompletionCallback) {
    let outerBubbleSortLoop = function(madeAnySwaps){
      if (madeAnySwaps === true) {
        innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
      }
      else {
        sortCompletionCallback(arr);
      }
    };
    outerBubbleSortLoop(true);
  };

let sortCompletionCallback = function(arr) {
  reader.close();
  console.log(`${arr} is now sorted!`);
};

absurdBubbleSort([15,3,6], sortCompletionCallback);
