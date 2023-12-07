class Player{
  States state;
  PVector position = new PVector(200, 200);
  PVector velocity = new PVector(0, 0);
  PVector acceleration = new PVector(0, 0);
  
  
  boolean walking = false;
  boolean attacking = false;
  boolean shooting = false;
  
  int facing = 1;
  int lastFacing;
  
  float pX = width/2;
  float pY = width/2;
  float w = 20;
  float h = 20;
  
  void display(){
    rectMode(CENTER);
    fill(198, 0 ,0);
    rect(pX, pY, w, h);
  }
  
  void movement(){
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
  
    } else{
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
    if(attacking){
      state = States.ATTACK;
      if(facing == 1){
        rect((width/2) + 20, height/2, 20, 5);
      }
      if(facing == 2){
        rect((width/2) - 20, height/2, 20, 5);
      }
      if(facing == 3){
        rect(width/2, (height/2) - 20, 5, 20);
      }
      if(facing == 4){
        rect(width/2, (height/2) + 20, 5, 20);
      }
    } else{
      state = States.IDLE;
    }
  }

}
