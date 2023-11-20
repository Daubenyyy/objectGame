enum States {IDLE, WALK, ATTACK, SHOOT}
Player player;
background background;
gamestates gamestate;

int gameState;

void setup(){
  size(400, 400);
  frameRate(60);
  
  gameState = 1;
  
  player = new Player();
  background = new background();
  gamestate = new gamestates();
}

void draw(){
  if(gameState == 1){
    gamestate.startMenu();
  }
  if(gameState == 2){
    background(255);
    background.display();
    player.display();
    player.movement();
    player.attacking();
    println(player.facing);
    println(player.walking);
    println(player.attacking);
  }
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
  
  if(key == ' '){
    player.attacking = true;
  }
}

void keyReleased(){
  if(key == 'd' || key == 'D'){
    player.walking = false;
  }
  
  if(key == 'a' || key == 'A'){
    player.walking = false;
  }
  
  if(key == 'w' || key == 'W'){
    player.walking = false;
  }
  
  if(key == 's' || key == 'S'){
    player.walking = false;
  }
  
  if(key == ' '){
    player.attacking = false;
  }
}
