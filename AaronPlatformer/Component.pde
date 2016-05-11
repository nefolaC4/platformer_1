

class Component {
  GameObject parent;
  String type;

  Component(GameObject prnt, String tp) {
    this.parent = prnt;
    this.type = tp;
  }

  void begin() {
  }

  void update() {
  }

  void updateEarly() {
  }

  void updateLate() {
  }
}//end of Component 