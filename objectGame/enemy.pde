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
  
  boolean seePlayer;
  
  void display(){
    positionX = player.position.x - posX;
    positionY = player.position.y - posY;
    cx = positionX;
    cy = positionY;
    
    rectMode(CENTER);
    fill(255, 0, 141);
    rect(positionX, positionY, w, h);
    fill(150, 150, 150, 60);
    rect(cx, cy, cw, ch);
  }
  
  void sightlines(){
    if(player.pX - player.w/2 <= cx + cw/2 
    && player.pX + player.w/2 >= cx - cw/2 
    && player.pY - player.h/2 <= cy + ch/2 
    && player.pY + player.h/2 >= cy - ch/2){
      seePlayer = true;
      }else{
        seePlayer = false;
      }
    
    if(seePlayer == true){
      if(player.position.x <= positionX){
        positionX = positionX - 5;
      }
      if(player.position.x >= positionX){
        positionX = positionX + 5;
      }
    }
  }
  
  void collision(){
    
  }
}
