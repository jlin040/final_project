
class Obstacle {
  float w;
  float x;
  boolean safe;
  boolean ison;

  Obstacle(float x, float w, boolean s, boolean i) {
    this.x = x;
    safe = s;
    ison=i;
    this.w=w;
  }
  
  void print() {
  }
}
