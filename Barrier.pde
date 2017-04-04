class Shield extends Actor{
  
  float high = 12;
  float wid = 100;
  
  Shield(float px, float py, float vx, float vy, float ax, float ay){
   super(px, py, vx, vy, ax, ay);
  }
  
  void update(){
    for(int i = bullets.size()-1; i >=0; i--){
      impact(bullets.get(i));
    }
    
    
  }
  
  void show(){
    rectMode(CENTER);
    rect(position.x, position.y, wid, high);
  }
  
  void impact(Bullet b){
    if (b.position.x > position.x - wid/2 && b.position.x < position.x+wid/2 && b.position.y > position.y){
     wid *= .9;
     position.x+=.40;
     bullets.remove(b);
    }
  }
}