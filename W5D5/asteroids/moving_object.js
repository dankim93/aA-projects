function MovingObject(pos, vel, radius,color){
  this.pos = pos;
  this.vel = vel;
  this.radius = radius ;
  this.color = color;
}

MovingObject.prototype.draw = function (ctx) {
  ctx.arc(this.pos[0],this.pos[1],this.radius,0,2*Math.PI);
  ctx.fillStyle = this.color;
};

MovingObject.prototype.move = function (position, velocity){
  this.postion[0] = this.postion[0] + this.velocity[0];
  this.postion[1] = this.postion[1] + this.velocity[1];
};
