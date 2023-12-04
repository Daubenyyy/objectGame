class Background{
  float rectX;
  float rectY;
  float w;
  float h;
  float positionX;
  float positionY;
  
  boolean hit;
  
  void display(){
    positionX = player.position.x - rectX; 
    positionY = player.position.y - rectY; 
    
    rectMode(CENTER);
    fill(0);
    rect(positionX, positionY, w, h);
  }
  
  void collision(){
    if(player.pX - player.w/2 <= positionX + w/2 
    && player.pX + player.w/2 >= positionX - w/2 
    && player.pY - player.h/2 <= positionY + h/2 
    && player.pY + player.h/2 >= positionY - h/2){
      hit = true;
    } else{
      hit = false;
    }
    
    if(hit == true){
      if(player.facing == 1){
        player.position.x = player.position.x + 1;
        player.walking = false;
      }
      if(player.facing == 2){
        player.position.x = player.position.x - 1;
        player.walking = false;
      }
      if(player.facing == 3){
        player.position.y = player.position.y - 1;
        player.walking = false;
      }
      if(player.facing == 4){
        player.position.y = player.position.y + 1;
        player.walking = false;
      }
    }
  }
}
