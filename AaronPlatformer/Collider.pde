
class Collider extends Component {
  float top, bottom, left, right;
  boolean still = false;
  Collider(GameObject prnt) {
    super(prnt, "Collider"); 
    updateSides();
  }

  void update() {
    updateSides();
  }

  void updateSides() {
    if (!still) {
      this.top    = parent.worldPos.y - parent.dim.y/2;
      this.bottom = parent.worldPos.y + parent.dim.y/2;
      this.left   = parent.worldPos.x - parent.dim.x/2;
      this.right  = parent.worldPos.x + parent.dim.x/2;
    }
  }
  public boolean checkCollide(Collider other) {
    if (
      (this.bottom >= other.top) &&
      (this.top    <= other.bottom) &&
      (this.left   <= other.right) &&
      (this.right  >= other.left)
      ) {
      return true;
    }
    return false;
  }//end of checkCollide()

  public boolean inCollider(PVector point) {
    if ( (point.x >= left) && (point.x <= right) && (point.y >= top) && (point.y <= bottom) ) {
      return true;
    } 
    return false;
  }

  //This only gets called after we know they are touching
  public boolean checkBottomOverlap(Collider other) {
    if (checkCollide(other)) {
      if ( (this.bottom <= other.bottom) && (this.bottom >= other.top) ) {
        return true;
      }
    }
    return false;
  }

  public float bottomOverlap(Collider other) {
    if (checkBottomOverlap(other) ) {
      return  other.top - this.bottom;
    }  
    return 0;
  }

  public boolean checkTopOverlap(Collider other) {

    if ( (this.top <= other.bottom) && (this.top >= other.top) ) {
      return true;
    } 
    return false;
  }

  public float topOverlap(Collider other) {
    if (checkBottomOverlap(other) ) {
      return other.bottom - this.top;
    }  
    return 0;
  } 
  public float leftOverlap(Collider other) {
    if (checkLeftOverlap(other) ) {
      return other.right - this.left;
    } 
    return 0;
  }
  public boolean checkLeftOverlap(Collider other) {
    if (checkCollide(other)) {
      if ( (this.left <= other.right) && (this.left >= other.left) ) {
        return true;
      }
    }
    return false;
  }

  public float rightOverlap(Collider other) {
    if (checkRightOverlap(other) ) {
      return other.left - this.right ;
    }  
    return 0;
  }
  public boolean checkRightOverlap(Collider other) {

    //println("bottom = " + this.bottom);
    //  println("other.bottom = " + other.bottom + "      and other.top = " + other.top);
    if (checkCollide(other)) {
      if ( (this.right >= other.left) && (this.right <= other.right) ) {
        return true;
      }
    }
    return false;
  }
}//end of class