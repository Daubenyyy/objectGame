class enemy{
  float posX = -50;
  float posY = 300;
  float positionX;
  float positionY;
  float w = 20;
  float h = 20;
  float cx;
  float cy;
  float cw = 250;
  float ch = 250;
  
  int health = 3;
  int facing;
  
  boolean seePlayer;
  boolean dead = false;
  
  void display(){
    
    positionX = player.position.x - posX;
    positionY = player.position.y - posY;
    cx = positionX;
    cy = positionY;
    
    rectMode(CENTER);
    if(dead == false){
      fill(255, 0, 141);
      rect(positionX, positionY, w, h);
      fill(150, 150, 150, 60);
      rect(cx, cy, cw, ch);
    }
    
  }
  
  void sightlines(){
    if(dead == false){
      if(player.pX - player.w/2 <= cx + cw/2 
      && player.pX + player.w/2 >= cx - cw/2 
      && player.pY - player.h/2 <= cy + ch/2 
      && player.pY + player.h/2 >= cy - ch/2){
      seePlayer = true;
      }else{
        seePlayer = false;
      }
    
      if(seePlayer == true){
        if(positionX <= player.pX){
          posX = posX - 1.0001;
          facing = 1;
        }
        if(positionX >= player.pX){
          posX = posX + 1.0001;
          facing = 2;
        } 
        if(positionY <= player.pY){
          posY = posY - 1.0001;
          facing = 3;
        } 
        if(positionY >= player.pY){
          posY = posY + 1.0001;
          facing = 4;
        } 
      }
    }
  }
  
  void collision(){
    if(player.attacking){
      if(player.facing == 1 
      && (player.pX + 20) - player.w/2 <= positionX + w/2 
      && (player.pX + 20) + player.w/2 >= positionX - w/2 
      && player.pY - player.h/2 <= positionY + h/2 
      && player.pY + player.h/2 >= positionY - h/2){
        health = health - 1;
      }
      
      if(player.facing == 2 
      && (player.pX - 20) - player.w/2 <= positionX + w/2 
      && (player.pX - 20) + player.w/2 >= positionX - w/2 
      && player.pY - player.h/2 <= positionY + h/2 
      && player.pY + player.h/2 >= positionY - h/2){
        health = health - 1;
      }
      
      if(player.facing == 3 
      && player.pX - player.w/2 <= positionX + w/2 
      && player.pX + player.w/2 >= positionX - w/2 
      && (player.pY - 20) - player.h/2 <= positionY + h/2 
      && (player.pY - 20) + player.h/2 >= positionY - h/2){
        health = health - 1;
      }
      
      if(player.facing == 4
      && player.pX - player.w/2 <= positionX + w/2 
      && player.pX + player.w/2 >= positionX - w/2 
      && (player.pY + 20) - player.h/2 <= positionY + h/2 
      && (player.pY + 20) + player.h/2 >= positionY - h/2){
        health = health - 1;
      }
    }
    
    if(health <= 0){
      dead = true;
    }
  }
}
