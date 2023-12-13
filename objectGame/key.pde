class Key{
  //varibles
  float posX = 200;
  float posY = 200;
  float positionX;
  float positionY;
  float w = 10;
  float h = 10;
  
  boolean getKey;
  
  void display(){
    //draws object
    positionX = player.position.x - posX;
    positionY = player.position.y - posY;
    
    rectMode(CENTER);
    fill(239, 255, 21);
    //hides the key if the player grabs it
    if(getKey == false){
      rect(positionX, positionY, w, h);
    }
  }
  
  void collision(){
    //checks if the player has grabbed the key
    if(player.pX - player.w/2 <= positionX + w/2 
    && player.pX + player.w/2 >= positionX - w/2 
    && player.pY - player.h/2 <= positionY + h/2 
    && player.pY + player.h/2 >= positionY - h/2){
      getKey = true;
    }
  }
}
