
class Player {
  GameObject player;

  Player(PVector pos, PVector size) {
    player = new GameObject("Player");
    player.worldPos = pos;
    player.dim = size;

    player.components.add(new Physics(player) );
    player.components.add(new Renderer(player, color(255, 0, 0) ) );
    player.components.add(new Collider(player) );
    player.components.add(new PlayerScript(player));
  }

  void updateEarly() {
    this.player.updateEarly();
  }
  void update() {
    this.player.update();
  }

  void updateLate() {
    this.player.updateLate();
  }
}