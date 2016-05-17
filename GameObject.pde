
class GameObject {
  PVector worldPos;//position in the world
  PVector dim; //width and height of player
  ArrayList<Component> components;
  String type;

  GameObject(String tp) {
    this.worldPos = new PVector(0, 0);
    this.dim = new PVector(0, 0);
    components = new ArrayList<Component>();
    type = tp;
  }

  void update() {
    for (int i=0; i< components.size(); i++) {
      Component comp = components.get(i);
      comp.update();
    }
  }
  
  void updateEarly(){
    for (int i=0; i< components.size(); i++) {
      Component comp = components.get(i);
      comp.updateEarly();
    }
  }
  
  void updateLate(){
    for (int i=0; i< components.size(); i++) {
      Component comp = components.get(i);
      comp.updateLate();
    }
  }

  public boolean hasComponent(String kind) {
    for (int i=0; i< components.size(); i++) {
      Component c = (Component) components.get(i);
      if (c.type == kind) {
        return true;
      }
    }//end of for loop
    return false;
  }//end of hasComponent()


  public Component getComponent(String kind) {
    for (int i=0; i< components.size(); i++) {
      Component c = (Component) components.get(i);
      if (c.type == kind) {
        return c;
      }
    }
    return null;
  }//end of getComponent
  
  public void beginComponents(){
    for (int i=0; i< components.size(); i++) {
      Component c = (Component) components.get(i);
      c.begin();
    }
  }
  
  
}//end of Class