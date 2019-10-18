//midterm
//Chris Wells helped with organizing and wrote some code such as the PVectors and Recursion
Player players;

//Enemies declared
int numberOfEnemies = 3;
ArrayList<Foe> enemies = new ArrayList<Foe>();

Boolean gameEnd;

void setup(){
  //fullScreen();
  size(1000, 700);
  background(0);
  gameEnd = false;
  players=new Player(100);
  //array of enemies
  for (int i = 0; i < numberOfEnemies; i++){
    enemies.add(new Foe(random(50,width),random(50,height)));
  }
}


void draw(){
  if (!gameEnd){
    background(0);
    ////Player stuff
    players.movement();
    players.display("normal");
    if (mousePressed){
      players.display("Attack!");
    }
    
    ////Loops through every Foe object, from bottom to top.          1) naming scheme, 2) Boolean detection, 3) Move(), misc. methods, Display()
    for (int i = 0; i < enemies.size(); i++){
      ////1) naming scheme
      Foe singleFoe = enemies.get(i);
      
      ////2) Boolean Detection
      //Damage to player from Foe, given it's level
      if (PlayerDamage(players.xPos, players.yPos,singleFoe.location.x, singleFoe.location.y, players.radius, singleFoe.radius)){
        players.hp -= (singleFoe.level*2);
        if (players.hp <= 0){
          gameEnd = true;
        }
      }
      //Damage to Foe from player
      if (mousePressed && FoeDamage(players.xPos, players.yPos,singleFoe.location.x, singleFoe.location.y, players.radius, singleFoe.radius)){
        singleFoe.health -= 2;
        if (singleFoe.health <= 0){
          enemies.remove(singleFoe);
        }
      }
      
      ////3) Object methods
      singleFoe.movement();
      singleFoe.display();
    }
  }
  else{
    background(255);
    textSize(50);
    fill(0);
    text("Game Over",width/2,height/2);
  }
}
