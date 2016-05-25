

class PlayerScript extends Component {
  Physics physics;
  Collider collider;
  float jumpSpeed = -5;
  boolean iJumped = false;
  int LEFT = -1; 
  int RIGHT = 1;
  float walkSpeed = 3;

  PlayerScript(GameObject prnt) {
    super(prnt, "PlayerScript");
    physics = (Physics) parent.getComponent("Physics");
    collider = (Collider) parent.getComponent("Collider");
  }

  void update() {
    this.checkGrounds();
  }//end update




  void checkGrounds() {
    boolean hitGroundDown = false;     
    boolean hitGroundUp = false;     
    boolean hitGroundLeft = false;     
    boolean hitGroundRight = false;     
    float upDist = 0;
    float downDist = 0;
    float leftDist = 0;
    float rightDist = 0;
    boolean hitSomething = false;
    for (int i = 0; i < ground.size(); i++) {
      Platform p = (Platform) ground.get(i);
      Collider other = (Collider) p.platform.getComponent("Collider");                
      if (this.collider.checkCollide(other)) {
        hitSomething = true;

        float tempUpDist =  collider.bottomOverlap(other);
        float tempDownDist = collider.topOverlap(other);
        float tempRightDist = collider.leftOverlap(other);
        float tempLeftDist = collider.rightOverlap(other);  

        if ((tempDownDist != 0) && (tempDownDist < downDist)) {
          downDist = tempDownDist;
        }

        if ((tempUpDist != 0) && (tempUpDist > upDist)) {
          upDist = tempUpDist;
        }
        if ((tempLeftDist != 0) && (tempLeftDist < leftDist)) {
          upDist = tempUpDist;
        }
        if ((tempRightDist != 0) && (tempUpDist > rightDist)) {
          rightDist = tempRightDist;
        }
      }
      if (((downDist != 0) && (upDist !=0)) || ((leftDist !=0) &&(rightDist)) {
        this.die();
      } else {
        if (downDist !=0) {
        }
      }
    }

    /*  if (hitGroundDown ) {
     physics.haltDown();
     this.iJumped = false;
     hitGroundDown = true;
     } else {
     physics.applyForce (new PVector(0, gravity) );
     }
     }
     */
  }

  void positionAdjust(Collider other, boolean hitDown, boolean hitUp, boolean hitLeft, boolean hitRight) {
    float dist = this.collider.bottomOverlap(other);
    println("dist = " + dist);
    physics.moveObject("y", dist * -1);
  }

  public void jump() {
    if (!iJumped) {
      println("Am I jumping?");
      physics.applyVelocity(new PVector(0, jumpSpeed));
      iJumped = true;
    }
  }

  public void walk(int direction) {
    //if (direction == LEFT){
    physics.moveObject("x", walkSpeed * (float) direction);
    //}
  }
  void die() {
  }
}