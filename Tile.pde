class Tile {
  /*
   00 barrier            color(255, 0, 0)
   01 road1              color(255, 255, 255)
   02 road2              color(255, 255, 255)
   03 road3              color(255, 255, 255)
   04 checkpoint         
   05 grass              
   06 oil                
   07 sand               
   08 ice                
   09 finish line        
   10 scenery            color(255, 0, 0)
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
  
  void drawCollision() {
    color col = color(100); // if none
      
    if (type == 0 || type == 10) { // Barrier/scenery
      col = col_collision_nothru;
    } else if (type == 1 || type == 2 || type == 3) { // Roads
      col = col_collision_road;
    } else if (type == 4) { // Checkpoint
      col = col_collision_checkpoint;
    } else if (type == 5) { // Grass
      col = col_collision_grass;
    } else if (type == 6) { // Oil
      col = col_collision_oil;
    } else if (type == 7) { // Sand
      col = col_collision_sand;
    } else if (type == 8) { // Ice
      col = col_collision_ice;
    } else if (type == 9) { // Finish Line
      col = col_collision_finish;
    }
    
    pushStyle();
    
    rectMode(CORNER);
    fill(col);
    rect(x,y,30,30);
    
    popStyle();
  }
}
