enum States {IDLE, WALK, ATTACK, SHOOT}
Player player;
gamestates gamestate;
door door;
Key Key;
enemy enemy;

import processing.sound.*;
SoundFile bgm;

Background[] Background = new Background[10];

int gameState;

boolean playMusic;

void setup(){
  size(400, 400);
  frameRate(60);
  
  gameState = 1;
  
  player = new Player();
  gamestate = new gamestates();
  door = new door();
  Key = new Key();
  enemy = new enemy();
  
  Background[0] = new Background();
  Background[1] = new Background();
  Background[2] = new Background();
  Background[3] = new Background();
  Background[4] = new Background();
  
  Background[0].rectX = 100;
  Background[0].rectY = 100;
  Background[0].w = 40;
  Background[0].h = 500;
  Background[1].rectX = 70;
  Background[1].rectY = 150;
  Background[1].w = 500;
  Background[1].h = 40;
  
  Key.getKey = false;
  
  bgm = new SoundFile(this, "Dungeon_Theme.wav");
  
}

void draw(){
  if(gameState == 1){
    gamestate.startMenu();
  }
  if(gameState == 2){
    background(255);
    Background[0].display();
    Background[0].collision();
    Background[1].display();
    Background[1].collision();
    
    if(playMusic == false){
      bgm.play();
    }
    
    if(bgm.isPlaying()){
      playMusic = true;
    } else{
      playMusic = false;
    }
    
    door.display();
    door.collision();
    Key.display();
    Key.collision();
    enemy.display();
    enemy.sightlines();
    enemy.collision();
    player.display();
    player.movement();
    player.attacking();
    println(enemy.facing);
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
