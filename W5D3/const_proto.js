function Cat(name, owner){
  this.name = name;
  this.owner = owner;
}

Cat.prototype.cuteStatement = function() { return `${this.owner} loves ${this.name}` }

const cat1 = new Cat('Garfield', 'John');
const cat2 = new Cat('Katie', 'Sam');
// console.log(cat1.cuteStatement());
Cat.prototype.cuteStatement = function() { return `Everyone loves ${this.name}!` }
// console.log(cat1.cuteStatement());
cat1.meow = function() { console.log('Meow') };



function Student(firstname, lastname) {
  this.firstname = firstname;
  this.lastname = lastname;
  this.courses = [];
}

Student.prototype.name = function() { return this.firstname + ' ' + this.lastname };
Student.prototype.courses = function() { return this.courses};
Student.prototype.enroll = function(course) {
  let stud = this;
  if (!stud.courses.includes(course)) {
    stud.courses.push(course);
    course.students.push(stud);
  }
};

function Course(name, dept, credits, block, days){
  this.name = name;
  this.dept = dept;
  this.credits = credits;
  this.students = [];
  this.block = block;
  this.days = days;
}


Course.prototype.students = function(){
  return this.students;
};
Course.prototype.addStudent = function(student){
  student.enroll(this);
};
Student.prototype.show_course = function(){ this.courses.forEach( el => console.log(el.name))};
Course.prototype.show_stud = function(){ this.students.forEach( el => console.log(el.firstname))};

Course.prototype.conflictsWith = function(second_course){

  if(this.block === second_course.block) {
    debugger;
    for (let i = 0; i < this.days.length; i++) {
      if(second_course.days.includes(this.days[i])) {
      return true;
      }
    }
  }
  return false;
};

const student1 = new Student('Dan', 'Kim');
const student2 = new Student('SR', 'Hong');
const course1 = new Course('History', 'Hist', 2, 1, ['M', 'W']);
const course2 = new Course('bio', 'bio', 3, 1, ['W']);

console.log(course1.conflictsWith(course2));
