class Player{
  //variables
  float xPos = 100;
  float yPos = 100;
  float xSpeed = 0;
  float ySpeed = xSpeed;
  float radius = 50;
  int hp;
  int level;
  //constructor for player
  Player(int health){
    hp = health;
    level = int(random(1,5));
  }
  
  
  //movement for wasd
  void movement(){
    //Calculates position
    if(keyPressed && (key == 'a' || key == 'A')){
      xSpeed = -3;
    }   
    if(keyPressed && (key == 'd' || key == 'D')){
      xSpeed = 3;
    }
    if(keyPressed && (key == 'w' || key == 'W')){
      ySpeed = -3;
    }
    if(keyPressed && (key == 's' || key == 'S')){
      ySpeed = 3;
    }
    //Checks if would be off screen
    if((xPos + radius) <= 0 || (xPos + radius) >= width) {
      xSpeed *= -1;
    }
    else if ((yPos + radius) <= 0 || (yPos + radius) >= height){
      ySpeed *= -1;
    }
    //Apply position to player
    xPos += xSpeed;
    yPos += ySpeed;
  }
    
  
  //display for character
  void display(String status){
    //Normal display
    if (status == "normal"){
      stroke(1);
      fill(#a19d94);
      ellipse(xPos,yPos,50,50);
      //Health bar
      textSize(20);
      fill(0,255,0);
      text(hp,xPos,yPos);
    }
    //Sword attack
    else if (status == "Attack!"){
      fill(255,0,0);
      rect(xPos+10, yPos+0, 25, 3);
    }
  }
}
