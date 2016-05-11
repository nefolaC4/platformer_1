
class Camera {
  PVector worldPos;
  Player p;
  

  Camera() {
    p = player;
    //println("player is " + p);
    worldPos = new PVector(0, 0);
  }

  //simple follow, stays at same location as player
  void followPlayer() {
    this.worldPos = new PVector(p.player.worldPos.x - width/2, p.player.worldPos.y - height/2);
  }
}