

class Platform {
  GameObject platform;

  Platform(PVector pos, PVector size) {
    platform = new GameObject("Platform");
    platform.worldPos = pos;
    platform.dim = size;

    platform.components.add(new Renderer(platform, color(0, 0, 255) ) );
    platform.components.add(new Collider(platform));
    Collider c = (Collider) platform.getComponent("Collider");
    c.still = true;
  }

  void updateEarly() {
    this.platform.updateEarly();
  }

  void update() {
    this.platform.update();
  }

  void updateLate() {
    this.platform.updateLate();
  }
}