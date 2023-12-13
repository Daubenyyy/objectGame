class gamestates{
  
  void startMenu(){
    //display for the main menu
    background(0);
    textMode(CENTER);
    textSize(50);
    fill(255);
    text("dungeon game", 50, 100);
    textSize(30);
    text("press WASD to move", 70, 200);
    text("press space to attack", 70, 250);
    textSize(15);
    fill(242, 242, 46);
    text("get the yellow key and unlock the blue door to win", 50, 300); 
    if(mousePressed == true){
      gameState = 2;
    }
  }
  
  void winMenu(){
    //display for the win menu
    background(0);
    textSize(50);
    text("win!", 150, 200);
    
    if(mousePressed == true){
      exit();
    }
  }
  
  void deathMenu(){
    background(0);
    textSize(50);
    text("you died", 120, 200);
    
    if(mousePressed == true){
      exit();
    }
  }
}
