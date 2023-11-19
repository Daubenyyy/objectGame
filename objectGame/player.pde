class Player{
  PVector position = new PVector(200, 200);
  PVector velocity = new PVector(0, 0);
  PVector acceleration = new PVector(0, 0);
  
  void display(){
    rectMode(CENTER);
    fill(198, 0 ,0);
    rect(position.x, position.y, 20, 20);
  }
  
  void movement(){
    
  }

}
