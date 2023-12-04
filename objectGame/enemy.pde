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
        }
        if(positionX >= player.pX){
          posX = posX + 1.0001;
        } 
        if(positionY <= player.pY){
          posY = posY - 1.0001;
        } 
        if(positionY >= player.pY){
          posY = posY + 1.0001;
        } 
      }
    }
  }
  
  void collision(){
    if(player.attacking){
      if(player.facing == 1 && posX <= player.pX + 20 && posX >= player.pX && posY <= player.pY/2 && posY >= player.pY/2){
        health = health - 1;
      }
    }
  }
}
