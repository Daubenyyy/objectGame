class background{
  float rectX = 30;
  float rectY = 50;
  float positionX;
  float positionY;
  float w = 30;
  float h = 300;
  
  void display(){
    positionX = player.position.x - rectX; 
    positionY = player.position.y - rectY; 
    
    rectMode(CENTER);
    fill(0);
    rect(positionX, positionY, w, h);
  }
  
  void collision(){
    if(player.position.x - (player.w/2) >= positionX + (w/2) && player.position.x + (player.w/2) <= positionX - (w/2)){
      player.velocity.x = 0;
    }
  }
}
