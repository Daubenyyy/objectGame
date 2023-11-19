enum States {IDLE, WALK, ATTACK, SHOOT}
Player player;

void setup(){
  size(400, 400);
  
  player = new Player();
}

void draw(){
  background(255);
  player.display();
  player.movement();
  
}

void keyPressed(){
  if(key == 'd' || key == 'D'){
    player.facing = 1;
    player.walking = true;
  }
  
  if(key == 'a' || key == 'A'){
    player.facing = 2;
    player.walking = true;
  }
  
  if(key == 'w' || key == 'W'){
    player.facing = 3;
    player.walking = true;
  }
  
  if(key == 's' || key == 'S'){
    player.facing = 4;
    player.walking = true;
  }
}

void keyReleased(){
  if(key == 'd' || key == 'D'){
    player.facing = 1;
    player.walking = false;
  }
  
  if(key == 'a' || key == 'A'){
    player.facing = 2;
    player.walking = false;
  }
  
  if(key == 'w' || key == 'W'){
    player.facing = 3;
    player.walking = false;
  }
  
  if(key == 's' || key == 'S'){
    player.facing = 4;
    player.walking = false;
  }
}
