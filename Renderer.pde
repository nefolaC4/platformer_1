
class Renderer extends Component{
  PVector screenPos;//position on the screen
  color clr;

  Renderer(GameObject prnt, color colr) {
    super(prnt, "Renderer");
    this.clr = colr;
    this.screenPos = new PVector(0, 0);
  }

  void updateScreenPos() {
    this.screenPos = new PVector(parent.worldPos.x - cam.worldPos.x, parent.worldPos.y - cam.worldPos.y);
  }
  

  void drawMe() {
    fill(clr);//set color of rectangle.
    rect(this.screenPos.x, this.screenPos.y, parent.dim.x, parent.dim.y);

  }
  
  void updateLate(){
    updateScreenPos();
    drawMe();
  }
}