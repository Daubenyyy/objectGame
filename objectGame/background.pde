class Background{
  //varibles for properties
  float rectX;
  float rectY;
  float w;
  float h;
  float positionX;
  float positionY;
  
  boolean hit;
  boolean hitEnemy;
  
  Background(float rectX, float rectY, float w, float h) //constricters for varibles
  {
   this.rectX = rectX;
   this.rectY = rectY;
   this.w = w;
   this.h = h;
  }
  
  Background(){
    
  }
  
  void display(){ //draws the object
    positionX = player.position.x - rectX; 
    positionY = player.position.y - rectY; 
    
    rectMode(CENTER);
    fill(0);
    rect(positionX, positionY, w, h);
  }
  
  void collision(){
    //checks if the player has collided with the object
    if(player.pX - player.w/2 <= positionX + w/2 
    && player.pX + player.w/2 >= positionX - w/2 
    && player.pY - player.h/2 <= positionY + h/2 
    && player.pY + player.h/2 >= positionY - h/2){
      hit = true;
    } else{
      hit = false;
    }
    
    //checks if the enemy has collided with the object
    if(enemy.positionX - enemy.w/2 <= positionX + w/2 
    && enemy.positionX + enemy.w/2 >= positionX - w/2 
    && enemy.positionY - enemy.h/2 <= positionY + h/2 
    && enemy.positionY + enemy.h/2 >= positionY - h/2){
      hitEnemy = true;
    } else{
      hitEnemy = false;
    }
    
    //pushes back the player so they can't clip through the wall
    if(hit == true){
      if(player.pX + player.w/2 <= positionX + w/2){
        player.position.x = player.position.x + 1;
        player.walking = false;
      }
      if(player.pX - player.w/2 >= positionX - w/2){
        player.position.x = player.position.x - 1;
        player.walking = false;
      }
      if(player.pY - player.h/2 >= positionY - h/2){
        player.position.y = player.position.y - 1;
        player.walking = false;
      }
      if(player.pY + player.h/2 <= positionY + h/2){
        player.position.y = player.position.y + 1;
        player.walking = false;
      }
    }
    
    //pushes back the enemy so they can't clip though the wall
    if(hitEnemy == true){
      if(enemy.posX + enemy.w/2 <= positionX + w/2){
        enemy.posX = enemy.posX + 1;
      }
      if(enemy.posX - enemy.w/2 >= positionX - w/2){
        enemy.posX = enemy.posX - 1;
      }
      if(enemy.posY - enemy.h/2 >= positionY - h/2){
        enemy.posY = enemy.posY - 1;
      }
      if(enemy.posY + enemy.h/2 <= positionY + h/2){
        enemy.posY = enemy.posY + 1;
      }
    }
  }
}
