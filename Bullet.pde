class Bullet extends Actor{
  
  Bullet(float px, float py, float vx, float vy, float ax, float ay){
    super(px, py, vx, vy, ax, ay);  
  }
  
  void update(){
    super.update();
    if(position.y > height){
      bullets.remove(this);
    }
  }
  
  void show(){
    stroke(255);
    strokeWeight(4);
    point(position.x, position.y);
  } 
}