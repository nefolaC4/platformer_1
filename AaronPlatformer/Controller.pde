
class Controller {
  Player plr;
  PlayerScript pScript;
  int W=0;    
  int A = 1;    
  int S = 2; 
  int D = 3;
  int UP = 0; 
  int LEFT = 1; 
  int DOWN = 2; 
  int RIGHT = 3;
  int LEFTDIR = -1; 
  int RIGHTDIR = 1;
  boolean[] buttons;

  Controller(Player player) {
    buttons = new boolean[4];
    this.plr = player;
    this.pScript = (PlayerScript) plr.player.getComponent("PlayerScript");
  }

  void update() {
    if (buttons[W]) {
      pScript.jump();
    }

    if (buttons[A]) {
      pScript.walk(LEFTDIR);
    }
    if (buttons[D]) {
      pScript.walk(RIGHTDIR);
    }
  }
}


//Please Note that these functions are OUTSIDE the class

void keyPressed() {
  println("pushing button");
  if (key == 'w') {
    controller.buttons[controller.W] = true;
  }
  if (key == 'a') {
    controller.buttons[controller.A] = true;
  }
  if (key == 's') {
    controller.buttons[controller.S] = true;
  }
  if (key == 'd') {
    controller.buttons[controller.D] = true;
  }
}

void keyReleased() {
  if (key == 'w') {
    controller.buttons[controller.W] = false;
  }
  if (key == 'a') {
    controller.buttons[controller.A] = false;
  }
  if (key == 's') {
    controller.buttons[controller.S] = false;
  }
  if (key == 'd') {
    controller.buttons[controller.D] = false;
  }
}