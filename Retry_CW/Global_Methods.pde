////Boolean Detection methods!!
//Did player take damage?
Boolean PlayerDamage(float pXPos, float pYPos, float fXPos, float fYPos, float pRadius, float fRadius){
  if (dist(pXPos, pYPos, fXPos, fYPos) <= (pRadius + fRadius - 35)){
    return true;
  }
  return false;
}
//Did Foe take damage?
Boolean FoeDamage(float pXPos, float pYPos, float fXPos, float fYPos, float pRadius, float fRadius){
  if (dist(pXPos, pYPos, fXPos, fYPos) <= (pRadius + fRadius - 25)){
    return true;
  }
  return false;
}
////Chris Wells wrote this code
//Recursive method that produces random coordinates that are at least a "noZone" distance from the player
float[] FoeSpawn(float FoeRadius, float noZone){
  float[] spawn = new float[]{random(FoeRadius, width - FoeRadius),random(FoeRadius, height - FoeRadius)};
  if (abs(spawn[0] - players.xPos) >= noZone && abs(spawn[1] - players.yPos) >= noZone){
    return spawn;
  }
  return FoeSpawn(FoeRadius, noZone);
}
