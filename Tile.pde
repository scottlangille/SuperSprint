class Tile {
  /*
   00 barrier
   01 track1
   02 track2  
   03 track3
   04 checkpoint
   05 grass
   06 oil
   07 sand
   08 ice
   09 finish line
   10 scenery
   */
  float x, y, w;
  float left, right, top, bot;
  Tile(int type, float x, float y) {
    this.x = x;
    this.y = y;
    w = 50;
    left = x;
    right = x+w;
    top = y;
    bot = y+w;
  }

  void render(int tint) {
    
    tint(map(timeOfDay, 00, 23, 
    
    fill(255, 255, 0);
    rect(x, y, w, w);
  }
}
