class Player{
  //varibles
  States state;
  PVector position = new PVector(200, 200);
  PVector velocity = new PVector(0, 0);
  PVector acceleration = new PVector(0, 0);
  
  
  boolean walking = false;
  boolean attacking = false;
  boolean shooting = false;
  boolean dead = false;
  
  int facing = 1;
  int counter = 0;
  int health = 3;
  
  float pX = width/2;
  float pY = width/2;
  float w = 20;
  float h = 20;
  
  void display(){
    //draws the object
    rectMode(CENTER);
    fill(198, 0 ,0);
    rect(pX, pY, w, h);
  }
  
  void movement(){
    //makes the player move
    if (walking){
      state = States.WALK;
      if(facing == 1){
        acceleration.x = -0.3;
        if(velocity.x < -3){
          acceleration.x = 0;
          velocity.x = -3;
        }
      }
      if(facing == 2){
        acceleration.x = 0.3;
        if(velocity.x > 3){
          acceleration.x = 0;
          velocity.x = 3;
        }
      }
      if(facing == 3){
        acceleration.y = 0.3;
        if(velocity.y > 3){
          acceleration.y = 0;
          velocity.y = 3;
        }
      }
      if(facing == 4){
        acceleration.y = -0.3;
        if(velocity.y < -3){
          acceleration.y = 0;
          velocity.y = -3;
        }
      }
  
    } else{ //makes the player stop when no longer walking
      state = States.IDLE;
      velocity.x = 0;
      acceleration.x = 0;
      velocity.y = 0;
      acceleration.y = 0;
    }
    
    velocity.setMag(5);
    velocity.add(acceleration);
    position.add(velocity);
  }
  
  void attacking(){
    //makes the player attack in all directions
    if(attacking){
      state = States.ATTACK;
      if(facing == 1){
        for(int i = 0; i <= 10; i++){
          rect((width/2) + 20, height/2, 20, 5);
          counter = counter + 1;
        }
        if(counter >= 120){
          attacking = false;
          counter = 0;
        }
      }
      if(facing == 2){
        for(int i = 0; i <= 10; i++){
          rect((width/2) - 20, height/2, 20, 5);
          counter = counter + 1;
        }
        if(counter >= 120){
          attacking = false;
          counter = 0;
        }
      }
      if(facing == 3){
        for(int i = 0; i <= 10; i++){
          rect(width/2, (height/2) - 20, 5, 20);
          counter = counter + 1;
        }
        if(counter >= 120){
          attacking = false;
          counter = 0;
        }
      }
      if(facing == 4){
        for(int i = 0; i <= 10; i++){
          rect(width/2, (height/2) + 20, 5, 20);
          counter = counter + 1;
        }
        if(counter >= 120){
          attacking = false;
          counter = 0;
        }
      }
    } else{
      state = States.IDLE;
    }
  }
  
  void death(){
    if(health <= 0){
      gameState = 4;
    }
  }

}
