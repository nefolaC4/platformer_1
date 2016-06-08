
class Collider extends Component {
  float top, bottom, left, right;

  Collider(GameObject prnt) {
    super(prnt, "Collider"); 
    updateSides();
  }

  void update() {
    updateSides();
  }

  void updateSides() {
    this.top    = parent.worldPos.y - parent.dim.y/2;
    this.bottom = parent.worldPos.y + parent.dim.y/2;
    this.left   = parent.worldPos.x - parent.dim.x/2;
    this.right  = parent.worldPos.x + parent.dim.x/2;
  }

  public boolean checkCollide(Collider other) {
    if (
      (this.bottom >= other.top) &&
      (this.top    <= other.bottom) &&
      (this.left   <= other.right) &&
      (this.right  >= other.left)
      ) {
      return true;
    } else {
      return false;
    }
  }//end of checkCollide()

  public boolean inCollider(PVector point) {
    if ( (point.x >= left) && (point.x <= right) && (point.y >= top) && (point.y <= bottom) ) {
      return true;
    } else {
      return false;
    }
  }

  //This only gets called after we know they are touching
  public boolean checkBottomOverlap(Collider other) {
    //println("bottom = " + this.bottom);
    //println("other.bottom = " + other.bottom + "      and other.top = " + other.top);
    if (checkCollide(other) ) {
      if ( (this.bottom <= other.bottom) && (this.bottom >= other.top) ) {
        return true;
      }
    }
    return false;
  }

  public float bottomOverlap(Collider other) {
    println("other is: " + other.parent.type);
    if (checkBottomOverlap(other) ) {
      return this.bottom - other.top;
    }
    return 0;
  }

  //This only gets called after we know they are touching
  public boolean checkTopOverlap(Collider other) {
    //println("top = " + this.bottom);
    //println("other.bottom = " + other.bottom + "      and other.top = " + other.top);
    if (checkCollide(other) ) {
      if ( (this.top >= other.bottom) && (this.top <= other.top) ) {
        return true;
      }
    }
    return false;
  }

  public float topOverlap(Collider other) {
    //println("other is: " + other.parent.type);
    if (checkTopOverlap(other) ) {
      return other.bottom - this.top;
    }
    return 0;
  }
}//end of class