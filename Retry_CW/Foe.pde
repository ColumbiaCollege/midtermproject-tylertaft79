class Foe{
  ////variables
  //controls movement
  PVector location;
  PVector velocity;
  PVector acceleration;
  //float seekerTopSpeed = players.xSpeed/2;
  
  float seekerTopSpeed = 2;
  
  int level = 1;
  int health;
  float xPos;
  float yPos;
  float radius = 50;
  
  
  //constructor
  Foe(float _x, float _y){
    health = 10;
    xPos = _x;
    yPos = _y;
    
    velocity = new PVector(0,0);
    //spawns randomly as long as it is more than 80 pixels from the player
    location = new PVector(FoeSpawn(radius, 80)[0],FoeSpawn(radius, 80)[1]);
  }
  
  ////Chris Wells helped with movement his code
  void movement(){
    //determines direction towwards player
    PVector path = new PVector(players.xPos,players.yPos);
    PVector direction = PVector.sub(path,location);
    direction.normalize();
    //alters magnitude of tangential extrapolation
    direction.mult(1);
    acceleration = direction;
    //vector summations
    velocity.add(acceleration);
    velocity.limit(seekerTopSpeed);
    location.add(velocity);
    println(acceleration);
    //bounces off edges of screen
    //if (location.x <= (players.xPos + radius) || location.x >= (width - (players.xPos + radius))){
    //  velocity.x *= -1;
    //}
    //else if (location.y <= (players.yPos + radius) || location.y >= (height - (players.yPos + radius))){
    //  velocity.y *= -1;
    //}
  }
  
  void display(){
    //Default appearance
    stroke(1);
    fill(#ff0000);
    ellipse(location.x, location.y, 50, 50);
    //Health bar
    textSize(20);
    fill(0,255,0);
    text(health,location.x,location.y);
  }
}
