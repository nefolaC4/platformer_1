

class Physics extends Component {
  PVector vel;//velocity
  PVector accel;//acceleration

  Physics(GameObject prnt) {
    super(prnt, "Physics");
    this.vel   = new PVector(0, 0);
    this.accel = new PVector(0, 0);
  }

  void updateEarly() {
    this.vel.add(accel);
    this.moveObject(vel);
  }

  //this function is wrong, applyforce should not replace accel
  public void applyForce(PVector force) {
    this.accel.add(force);
  }

  public void applyVelocity(PVector speedBy) {
    this.vel.add(speedBy);
  }

  public void halt() {
    vel = new PVector(0, 0);
    accel = new PVector(0,0);
  }

  public void haltRight() {
    if (vel.x > 0) {
      vel.x = 0;
      accel.x = 0;
    }
  }

  public void haltLeft() {
    if (vel.x < 0) {
      vel.x = 0;
      accel.x = 0;
    }
  }

  public void haltUp() {
    if (vel.y < 0) {
      vel.y = 0;
      accel.y = 0;
    }
  }

  public void haltDown() {
    if (vel.y > 0) {
      vel.y = 0;
      accel.y = 0;
    }
  }

  public void moveObject(PVector distance) {
    this.parent.worldPos.add(distance);
  }

  public void moveObject(String direction, float distance) {
    if (direction == "y") {
      this.parent.worldPos.y += distance;
    }
    if (direction == "x") {
      this.parent.worldPos.x += distance;
    }
  }
}