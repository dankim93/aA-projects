// simple timeout
window.setTimeout(() => alert('HAMMERTIME!'), 5000);

//timeout + closure
var hammerTime = function(time) {
  window.setTimeout(() => {
    alert(`${time} is HAMMER TIME!`);
  });
};

//some tea? some biscuits?
const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function teaAndBiscuits() {
  reader.question('Would you like some tea?', function(res) {
    console.log(`You replied ${res}`);

    reader.question('Would you like some biscuits?', function(res2) {
      console.log(`You replied ${res2}`);
      const first = (res === 'yes') ? 'do' : 'do not';
      const second = (res2 === 'yes') ? 'do' : 'do not';

      console.log(`So you ${first} want tea and you ${second} want biscuits`);
      reader.close();

    });
  });
}
