class Tile {
  /*
   00 barrier
   01 road1
   02 road2  
   03 road3
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
  float mu;

  int type;

  Tile(int type, float x, float y) {
    this.type = type;

    this.x = x;
    this.y = y;
    w = 50;
    left = x;
    right = x+w;
    top = y;
    bot = y+w;

    mu = 0.99; // track
    //mu = 0.95; // grass etc
    //mu = 0.90;
  }

  void update() {
  }

  void render(int timeOfDay) {
    pushStyle();

    tint(int(map(abs(timeOfDay-12), 0, 12, 255, 140))); // Make tile darker depending on time of day, 0-23

    imageMode(CORNER);
    //if (type == 0)
    //  image((img_tile0), x, y);
    if (type == 1)
      image((img_tile1), x, y);
    //if (type == 2)
    //  image((img_tile2), x, y);
    //if (type == 3)
    //  image((img_tile3), x, y);
    //if (type == 4)
    //  image((img_tile4), x, y);
    //if (type == 5)
    //  image((img_tile5), x, y);
    //if (type == 6)
    //  image((img_tile6), x, y);
    //if (type == 7)
    //  image((img_tile7), x, y);
    //if (type == 8)
    //  image((img_tile8), x, y);
    //if (type == 9)
    //  image((img_tile9), x, y);
    if (type == 10)
      image((img_tile10), x, y);

    // Draw grid
    noFill();
    stroke(0);
    rect(x, y, 30, 30);


    popStyle();
  }
}
