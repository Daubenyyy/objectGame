class gamestates{
  
  void startMenu(){
    background(0);
    textSize(50);
    text("menu", 150, 200);
    if(mousePressed == true){
      gameState = 2;
    }
  }
}