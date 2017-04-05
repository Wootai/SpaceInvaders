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
    
    if(playerHit(bullets)){
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
      for(int i = shields.size()-1; i >= 0; i--){
        Shield r = shields.get(i);
        if (b.position.x > shields.get(i).position.x - wid/2 && b.position.x < shields.get(i).position.x+wid/2 && b.position.y > shields.get(i).position.y){
          r.shrink();
          return true;
        }
      }
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

  boolean playerHit(ArrayList<Bullet> b){
    for(int i = b.size()-1; i >= 0; i--){
      Bullet eb = b.get(i);
      if (eb.position.x > position.x - wid/2 && eb.position.x < position.x+wid/2 && eb.position.y > position.y - high/2){
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