enum States {IDLE, WALK, ATTACK, SHOOT}
Player player;
gamestates gamestate;
door door;
Key Key;
enemy enemy;

int gameState;

void setup(){
  size(400, 400);
  frameRate(60);
  
  gameState = 1;
  
  player = new Player();
  gamestate = new gamestates();
  door = new door();
  Key = new Key();
  enemy = new enemy();
  
  Key.getKey = false;
  
}

void draw(){
  if(gameState == 1){
    gamestate.startMenu();
  }
  if(gameState == 2){
    background(255);
    door.display();
    door.collision();
    Key.display();
    Key.collision();
    enemy.display();
    enemy.sightlines();
    player.display();
    player.movement();
    player.attacking();
    println(enemy.seePlayer);
    println(player.position.x);
    println(enemy.positionX);
  }
  if(gameState == 3){
    gamestate.winMenu();
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
