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
    rect(position.x, position.y, 3, 10);
  }
  
}