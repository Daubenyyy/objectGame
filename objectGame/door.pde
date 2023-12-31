class door{
  //varibles
  float posX = -60;
  float posY = 50;
  float positionX;
  float positionY;
  float w = 30;
  float h = 50;
  
  void display(){
    //draw the object
    positionX = player.position.x - posX;
    positionY = player.position.y - posY;
    
    rectMode(CENTER);
    fill(70, 131, 232);
    rect(positionX, positionY, w, h);
  }
  
  void collision(){
    //checks if the player is touching the door and has the key
    if(player.pX - player.w/2 <= positionX + w/2 
    && player.pX + player.w/2 >= positionX - w/2 
    && player.pY - player.h/2 <= positionY + h/2 
    && player.pY + player.h/2 >= positionY - h/2
    && Key.getKey == true){
      gameState = 3;
    }
  }
}
