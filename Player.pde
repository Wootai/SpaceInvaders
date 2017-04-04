class Player extends Actor{
  
  float wid;
  float high;
  Bullet playerBull;
  
  Player(float px, float py, float vx, float vy, float ax, float ay){
    super(px, py, vx, vy, ax, ay);  
    wid = 40;
    high = 20;
    playerBull = null;
  }
  
  void update(){
    super.update();
    
    if(playerHit()){
      println("hit");
      //die and reset player//
    }   
    
    if(playerBull != null){
      fill(0);
      playerBull.show();
      playerBull.update();
      if(playerBull.position.y < 0 || kill(playerBull)){
        playerBull = null;
      }
    }
  }
  
  void show(){
    fill(255);
    rect(position.x, position.y, wid, high);
  }
  
  void shoot(){
    if(playerBull == null){
      playerBull = new Bullet(position.x, position.y-20, 0, -4, 0, 0);
    }
  }
  
  boolean kill(Bullet b){
    if (b != null){
      for(int i = enemies.size()-1; i >= 0; i--){
        if(PVector.dist(b.position, enemies.get(i).position) < 20){
          enemies.get(i).die();
          for(Enemy e: enemies){
            e.velocity.x *= (1.01);
          }
          playerBull.position.y = -1;
          return true;
        }
      }
    }
  return false;
  }

  boolean playerHit(){
    for(int i = bullets.size()-1; i >= 0; i--){
      Bullet eb = bullets.get(i);
      if (eb.position.x > position.x && eb.position.x < position.x+wid && eb.position.y > position.y){
        bullets.remove(eb);
        return true;
      }
    } 
    return false;
  }

}

void keyPressed(){
  if(keyCode == RIGHT){
    p.position.x += 5;
  }
  if(keyCode == LEFT){
    p.position.x -= 5;
  }
  if(key == ' '){
    p.shoot();
  }
}