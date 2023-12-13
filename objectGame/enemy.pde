class enemy{
  //varibles
  float posX;
  float posY;
  float positionX;
  float positionY;
  float w = 20;
  float h = 20;
  float cx;
  float cy;
  float cw = 250;
  float ch = 250;
  
  int health = 3;
  
  boolean seePlayer;
  boolean dead = false;
  
  enemy(float posX, float posY){
    this.posX = posX;
    this.posY = posY;
  }
  
  enemy(){
    
  }
  
  void display(){
    //draws the object
    positionX = player.position.x - posX;
    positionY = player.position.y - posY;
    cx = positionX;
    cy = positionY;
    
    rectMode(CENTER);
    if(dead == false){ //only works if the enemy is not dead
      fill(255, 0, 141);
      rect(positionX, positionY, w, h);
      noStroke();
      fill(150, 150, 150, 0);
      rect(cx, cy, cw, ch);
    }
    
  }
  
  void sightlines(){
    //checks to see if the enemy can see the player
    if(dead == false){
      if(player.pX - player.w/2 <= cx + cw/2 
      && player.pX + player.w/2 >= cx - cw/2 
      && player.pY - player.h/2 <= cy + ch/2 
      && player.pY + player.h/2 >= cy - ch/2){
      seePlayer = true;
      }else{
        seePlayer = false;
      }
    
    //moves towards the player if they see it
      if(seePlayer == true){
        if(positionX <= player.pX + player.w/2){
          posX = posX - 1;
        }
        if(positionX >= player.pX - player.w/2){
          posX = posX + 1;
        } 
        if(positionY <= player.pY + player.h/2){
          posY = posY - 1;
        } 
        if(positionY >= player.pY - player.h/2){
          posY = posY + 1;
        } 
      }
    }
  }
  
  void collision(){
    //checks if the player has hit the enemy with the sword
    if(dead == false){
      if(player.attacking){
        if(player.facing == 1 
        && (player.pX + 20) - player.w/2 <= positionX + w/2 
        && (player.pX + 20) + player.w/2 >= positionX - w/2 
        && player.pY - player.h/2 <= positionY + h/2 
        && player.pY + player.h/2 >= positionY - h/2){
          health = health - 1;
          posX = posX - 30;
      }
      
      if(player.facing == 2 
        && (player.pX - 20) - player.w/2 <= positionX + w/2 
        && (player.pX - 20) + player.w/2 >= positionX - w/2 
        && player.pY - player.h/2 <= positionY + h/2 
        && player.pY + player.h/2 >= positionY - h/2){
          health = health - 1;
          posX = posX + 30;
      }
      
      if(player.facing == 3 
        && player.pX - player.w/2 <= positionX + w/2 
        && player.pX + player.w/2 >= positionX - w/2 
        && (player.pY - 20) - player.h/2 <= positionY + h/2 
        && (player.pY - 20) + player.h/2 >= positionY - h/2){
          health = health - 1;
          posY = posY + 30;
      }
      
      if(player.facing == 4
        && player.pX - player.w/2 <= positionX + w/2 
        && player.pX + player.w/2 >= positionX - w/2 
        && (player.pY + 20) - player.h/2 <= positionY + h/2 
        && (player.pY + 20) + player.h/2 >= positionY - h/2){
          health = health - 1;
          posY = posY - 30;
        }
      }
    
    if(player.pX - player.w/2 <= positionX + w/2 
      && player.pX + player.w/2 >= positionX - w/2 
      && player.pY - player.h/2 <= positionY + h/2 
      && player.pY + player.h/2 >= positionY - h/2){
        player.health = player.health - 1;
      }
   }
    
    if(health <= 0){
      //kills enemy when they run out of health
      dead = true;
    }
  }
}
