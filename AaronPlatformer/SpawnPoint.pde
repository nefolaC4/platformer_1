class SpawnPoint extends GameObject {

  SpawnPoint(PVector pos) {
    super("SpawnPoint");
    this.worldPos = pos;
    this.components.add(new Renderer(this, 75) );
    this.dim = new PVector(10, 25) ;
  }
}