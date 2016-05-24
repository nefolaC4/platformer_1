//setup the game camera and player
Camera cam;
Player player;
SpawnPoint spawn;
float gravity;

ArrayList ground;
Controller controller;

void setup() {
  size (500, 500);
  background(255);

  rectMode (CENTER);

  spawn = new SpawnPoint(new PVector(0, 30));
  player = new Player( spawn);
  player.player.dim = new PVector(10, 25);

  cam = new Camera();

  controller = new Controller(player);

  gravity = .1;//positive gravity, pulls down in code.

  ground = new ArrayList();
  ground.add(new Platform(new PVector(0, 50), new PVector(200, 10) ));
  ground.add(new Platform(new PVector(100, 100), new PVector(50, 10) ));//<--------added this, caused problems.
  ground.add(new Platform(new PVector(-100, 25 ), new PVector(10, 50 ) ));
  player.player.beginComponents();
  for (int i = 0; i < ground.size(); i++) {
    Platform g = (Platform) ground.get(i);
    g.platform.beginComponents();
  }
}

void draw() {
  background(255);
  updateEarly();
  cam.followPlayer();
//frameRate(5);
  update();
  updateLate();
}

void updateEarly() {
  player.updateEarly();
  spawn.updateEarly();
  for (int i = 0; i < ground.size(); i++) {
    Platform g = (Platform) ground.get(i);
    g.updateEarly();
  }
}

void update() {
  controller.update();
  player.update();
  spawn.update();
  for (int i = 0; i < ground.size(); i++) {
    Platform g = (Platform) ground.get(i);
    g.update();
  }
}

void updateLate() {
  player.updateLate();
  spawn.updateLate();
  for (int i = 0; i < ground.size(); i++) {
    Platform g = (Platform) ground.get(i);
    g.updateLate();
  }
}