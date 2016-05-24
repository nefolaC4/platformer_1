
class Player {
  GameObject player;

  Player(SpawnPoint spawnPoint) {
    player = new GameObject("Player");
    player.worldPos = new PVector( spawnPoint.worldPos.x, spawnPoint.worldPos.y) ;
    player.dim = new PVector(10, 25);

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