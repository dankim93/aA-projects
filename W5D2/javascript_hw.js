function madLib(verb, adj, noun) {
  console.log(`We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}.`);
}
// madLib('run', 'quickly', 'dog');

function isSubstring(phrase, string) {
  console.log(phrase.includes(string));
}
// isSubstring("time to program", 'time');

function fizzBuzz(array) {
  var answer = [];

  for (var i = 0; i < array.length; i++) {
    if ( (array[i] % 3 === 0 && array[i] % 5 !== 0) || (array[i] % 3 !== 0 && array[i] % 5 === 0)) {

      answer.push(array[i]);
    }
  }

  console.log(answer);
}
// fizzBuzz([1,2,3,4,5,15]);

function isPrime (number) {
  if (number < 2) { return false; }

  for (let i = 2; i < number; i++) {
    if (number % i === 0) {
      return false;
    }
  }

  return true;
}
// console.log(isPrime(2));

function sumOfNPrimes(n) {
  let num = 2;
  let sum = 0;
  let count = 0;

  while (count < n) {
    if (isPrime(num)) {
       sum += num;
       count += 1;
    }
    num += 1;
  }

  return sum;
}
// console.log(sumOfNPrimes(4));

function allOrNothing(mod, ...numbers) {
  for (let i = 0; i < numbers.length; i++){
    if (numbers[i] % mod !== 0) { return false; }
  }
  return true;
}
console.log(allOrNothing(2,4,8,2));
