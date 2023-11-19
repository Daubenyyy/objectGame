class Player{
  States state;
  PVector position = new PVector(200, 200);
  PVector velocity = new PVector(0, 0);
  PVector acceleration = new PVector(0, 0);
  
  
  boolean walking = false;
  boolean attacking = false;
  boolean shooting = false;
  int facing = 1;
  
  void display(){
    rectMode(CENTER);
    fill(198, 0 ,0);
    rect(width/2, height/2, 20, 20);
  }
  
  void movement(){
    if (walking){
      state = States.WALK;
      if(facing == 1){
        acceleration.x = -0.3;
        if(velocity.x < -5){
          acceleration.x = 0;
          velocity.x = -5;
        }
      }
      if(facing == 2){
        acceleration.x = 0.3;
        if(velocity.x > 5){
          acceleration.x = 0;
          velocity.x = 5;
        }
      }
      if(facing == 3){
        acceleration.y = 0.3;
        if(velocity.y > 5){
          acceleration.y = 0;
          velocity.y = 5;
        }
      }
      if(facing == 4){
        acceleration.y = -0.3;
        if(velocity.y < -5){
          acceleration.y = 0;
          velocity.y = -5;
        }
      }
    } else{
      state = States.IDLE;
      velocity.x = 0;
      acceleration.x = 0;
      velocity.y = 0;
      acceleration.y = 0;
    }
    
    velocity.add(acceleration);
    position.add(velocity);
  }

}
