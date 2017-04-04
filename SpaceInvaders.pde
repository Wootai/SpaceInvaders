Enemy e;
Player p;
color[] colors = {color(255, 0, 0), color(0,0,255), color(255,0,150), color(0,150,0), color(0,0,110), color(110, 50, 0)};
Shield s;


Bullet playerBullet;
ArrayList<Shield> shields;
ArrayList<Enemy> enemies;
ArrayList<Bullet> bullets;

void setup(){
  size(800, 600);
  int xSpace = (width-275)/10;
  int ySpace = (height-300)/6;
  enemies = new ArrayList<Enemy>();
  bullets = new ArrayList<Bullet>();
  shields = new ArrayList<Shield>();
     
  for(int x = 0; x < 10; x++){
    for(int y = 0; y < 6; y++){
      e = new Enemy(30+x*xSpace, 30+y*ySpace, 1, 0, 0, 0, colors[y]);
      enemies.add(e);
    }
  }
  
  for(int x = 0; x < 3; x++){
    for(int y = 0; y < 3; y++){
      s = new Shield(100+(720/3)*x, height-(y*16)-60, 0,0,0,0);
      shields.add(s);
    }
  }
  
  p = new Player(width/2, height-30, 0, 0, 0 ,0);
}

void draw(){
  background(172);
  
  for(Shield s: shields){
    s.show();
    s.update();
  }
  
  if(bullets.size()>0){
    for(int x = bullets.size()-1; x >= 0; x--){
      bullets.get(x).show();
      bullets.get(x).update();
    }
  }
  
  for(int x = enemies.size()-1; x >= 0; x--){
    enemies.get(x).show();
    enemies.get(x).update();
  }

  p.update();
  p.show();
}