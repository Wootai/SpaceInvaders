class Enemy extends Actor{
  
  int size;
  color col;
  Bullet b;
  int shootChance = 2400;
  
  Enemy(float px, float py, float vx, float vy, float ax, float ay, color c){
     super(px, py, vx, vy, ax, ay);
     size = 30;
     col = c;
  }
  
  void update(){
    super.update();
    if(random(0, shootChance) < 1){
      shoot();
    }    
    if(position.x > width-size || position.x < 0+size){
      for(Enemy e: enemies){
        e.velocity.x *= -1;
        e.position.y += size/2;
     }
    }
   if(position.y > p.position.y){
      gameOver();
    }
  }
  
  void show(){
    fill(col);
    ellipse(position.x, position.y, size, size);
  }
  
  void shoot(){
    b = new Bullet(position.x, position.y, 0, 2, 0, 1);
    bullets.add(b);
  }
   
  void die(){
    enemies.remove(this); 
  }   
}