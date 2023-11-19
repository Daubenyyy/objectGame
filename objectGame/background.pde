class background{
  
  void display(){
    rectMode(CENTER);
    fill(0);
    rect(player.position.x - 200, player.position.y - 30, 30, 300);
    rect(player.position.x - 200, player.position.y - 330, 300, 30);
  }
}
