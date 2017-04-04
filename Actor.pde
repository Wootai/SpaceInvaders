class Actor{
  PVector position;
  PVector velocity;
  PVector acceleration;
  
  Actor(float px, float py, float vx, float vy, float ax, float ay){
    position = new PVector(px, py);
    velocity = new PVector(vx, vy);
    acceleration = new PVector(ax, ay);
  }
 
 void update(){
   velocity.add(acceleration);
   position.add(velocity);
   acceleration.mult(0);
 }
}
 