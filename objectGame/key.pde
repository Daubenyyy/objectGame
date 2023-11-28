class Key{
  float posX = -50;
  float posY = 100;
  float positionX;
  float positionY;
  float w = 10;
  float h = 10;
  
  boolean getKey;
  
  void display(){
    positionX = player.position.x - posX;
    positionY = player.position.y - posY;
    
    rectMode(CENTER);
    fill(239, 255, 21);
    if(getKey == false){
      rect(positionX, positionY, w, h);
    }
  }
  
  void collision(){
    if(player.pX - player.w/2 <= positionX + w/2 
    && player.pX + player.w/2 >= positionX - w/2 
    && player.pY - player.h/2 <= positionY + h/2 
    && player.pY + player.h/2 >= positionY - h/2){
      getKey = true;
    }
  }
}
