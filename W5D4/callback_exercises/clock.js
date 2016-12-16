
class Clock {
  constructor() {
    const time = new Date();
    this.hours = time.getHours();
    this.minutes = time.getMinutes();
    this.seconds = time.getSeconds();
    // while (true) {
    //   this.printTime();
    //   this._tick();
      setInterval(() => this._tick(), 1000);
    // }

  }

  printTime() {
    console.log(`${this.prettyTime(this.hours)}:${this.prettyTime(this.minutes)}:${this.prettyTime(this.seconds)}`);
  }

  prettyTime(time) {
    if (time < 10) {
      return `0${time}`;
    }
    else {
      return `${time}`;
    }
  }

  _tick() {
    console.log(this);
    this.seconds += 1;
    if (this.seconds === 60) {
      this.seconds = 0;
      this.minutes += 1;
      if (this.minutes === 60) {
        this.minutes = 0;
        this.hours += 1;
        if (this.hours === 24) {
          this.hours = 0;
        }
      }
    }
  }
}
let c = new Clock();
