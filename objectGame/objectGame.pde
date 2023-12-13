enum States {IDLE, WALK, ATTACK, SHOOT} //player states
Player player; //player class
gamestates gamestate; //gamestate class
door door; //door class
Key Key; // key class
enemy enemy;
enemy enemy2;
enemy enemy3;
enemy enemy4;
enemy enemy5;

import processing.sound.*;
SoundFile bgm;

Background[] Background = new Background[15]; //array for background objects

int gameState; //game state number

boolean playMusic; //music player

void setup(){ //initializing everything
  size(400, 400);
  frameRate(60);
  
  gameState = 1;
  
  player = new Player();
  gamestate = new gamestates();
  door = new door();
  Key = new Key();
  
  Background[0] = new Background(100, 100, 40, 500);
  Background[1] = new Background(70, 150, 520, 40);
  Background[2] = new Background(-170, 150, 40, 290);
  Background[3] = new Background(-590, -100, 40, 120);
  Background[4] = new Background(-430, -140, 1100, 40);
  Background[5] = new Background(-380, 20, 460, 40);
  Background[6] = new Background(-990, 90, 40, 500);
  Background[7] = new Background(-450, 230, 300, 40);
  Background[8] = new Background(-655, 359, 710, 40);
  Background[9] = new Background(-320, 350, 40, 210);
  Background[10] = new Background(-10, 470, 660, 40);
  Background[11] = new Background(300, 300, 40, 320);
  
  enemy = new enemy(-50, 300);
  enemy2 = new enemy(-800, 200);
  enemy3 = new enemy(-650, 100);
  enemy4 = new enemy(200, 250);
  enemy5 = new enemy(-750, 220);
  
  Key.getKey = false;
  
  bgm = new SoundFile(this, "Dungeon_Theme.wav");
  
}

void draw(){
  if(gameState == 1){ //draw main menu
    gamestate.startMenu();
  }
  if(gameState == 2){ //run the game
    background(150);
    Background[0].display();
    Background[0].collision();
    Background[1].display();
    Background[1].collision();
    Background[2].display();
    Background[2].collision();
    Background[3].display();
    Background[3].collision();
    Background[4].display();
    Background[4].collision();
    Background[5].display();
    Background[5].collision();
    Background[6].display();
    Background[6].collision();
    Background[7].display();
    Background[7].collision();
    Background[8].display();
    Background[8].collision();
    Background[9].display();
    Background[9].collision();
    Background[10].display();
    Background[10].collision();
    Background[11].display();
    Background[11].collision();
    
    enemy.display();
    enemy.sightlines();
    enemy.collision();
    enemy2.display();
    enemy2.sightlines();
    enemy2.collision();
    enemy3.display();
    enemy3.sightlines();
    enemy3.collision();
    enemy4.display();
    enemy4.sightlines();
    enemy4.collision();
    enemy5.display();
    enemy5.sightlines();
    enemy5.collision();
    
    if(playMusic == false){ //play the music when the tract ends
      bgm.play();
    }
    
    if(bgm.isPlaying()){ //makes sure that the program doesn't play the song every frame
      playMusic = true;
    } else{
      playMusic = false;
    }
    
    door.display();
    door.collision();
    Key.display();
    Key.collision();
    player.display();
    player.movement();
    player.attacking();
    player.death();
    println(player.position.x);
    println(player.position.y);
  }
  if(gameState == 3){ //win menu
    gamestate.winMenu();
    bgm.stop();
  }
  
  if(gameState == 4){
    gamestate.deathMenu();
    bgm.stop();
  }
}

void keyPressed(){ //player controls
  
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
}
