const readline = require('readline');
const reader = readline.createInterface({

  input: process.stdin,
  output: process.stdout
});

let addNumbers = function(sum, numsLeft, completionCallback) {
  if (numsLeft > 0) {
    reader.question('Give me a number!', function(res) {
      console.log(`You replied ${res}`);
      const num = parseInt(res, 10);
      sum += num;
      numsLeft -= 1;
      addNumbers(sum, numsLeft, completionCallback);
    });
  }
  else {
  return completionCallback(sum);
}
};

addNumbers(1,6 , (sum) => {
  console.log(sum);
  reader.close();
});
