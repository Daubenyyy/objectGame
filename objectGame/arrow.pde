class arrow{
  PVector position = new PVector(200, 200);
  PVector velocity = new PVector();
  PVector acceleration = new PVector();
  
  void display(){
    rectMode(CENTER);
    fill(0, 255, 0);
    rect(player.position.x - position.x, player.position.y - position.y, 5, 10);
  }
}
