class State_Game implements State {

  int track;
  int timeOfDay;

  float startTime;

  ArrayList<Tile> tiles = new ArrayList();
  ArrayList<Car> cars = new ArrayList();

  State_Game() {
    track = 1;
    timeOfDay = 12;

    setupTiles();

    cars.add(new RedCar(width/2, height/2, color(127, 127, 0)));
    cars.get(0).updateTile(tiles.get(0));
  }

  void collisionCheck() {
    // SET COLOURS
    background(100); // set background colour so no interference.
    for (Tile tile : tiles) { // Draw tile collision colours
      tile.drawCollision();
    }
    for (Car car : cars) { // Draw car over-top.
      car.drawCollision(col_collision_car);
    }
    
  }

  void update() {
    for (Tile t : tiles) {
      t.update();
    }

    for (Car c : cars) {
      c.update();
    }

    collisionCheck();
    
    for (Car c : cars) {
      println(c.checkMove());
      
    }

    if (keyboard.checkKey((int)gameSettings.getProperty("upKey"))) {
      cars.get(0).drive(true); // Move forward
    } else {
      cars.get(0).unDrive(true); // Don't move forward
    }
    if (keyboard.checkKey((int)gameSettings.getProperty("downKey"))) {
      cars.get(0).drive(false); // Move backward
    } else {
      cars.get(0).unDrive(false); // Don't move backward
    }

    // Turn car

    if (keyboard.checkKey((int)gameSettings.getProperty("leftKey"))) {
      cars.get(0).turnWheels(0); // Turn left
    }
    if (keyboard.checkKey((int)gameSettings.getProperty("rightKey"))) {
      cars.get(0).turnWheels(1); // Turn right
    }

    //if (keyboard.checkKey((int)gameSettings.getProperty("upKey2"))) {
    //  cars.get(1).drive(true);
    //} else {
    //  cars.get(1).unDrive(true);
    //}
    //if (keyboard.checkKey((int)gameSettings.getProperty("downKey2"))) {
    //  cars.get(1).drive(false);
    //} else {
    //  cars.get(1).unDrive(false);
    //}
  }

  void render() {
    pushStyle();

    background(127);


    for (Tile t : tiles) {
      t.render(timeOfDay);
    }

    for (Car c : cars) {
      c.render();
    }

    //println(str((millis() - startTime)/1000).split(".")[0] + str((millis() - startTime)/1000).split(".")[1].substring(1));



    popStyle();
  }

  void processKey(char k, int code) {
    if (k == 'Q') {
     cars.get(0).nitro(); 
    }
  }

  void processClick() {
  }

  void setupTiles() {
    tiles.clear();

    String[] lines = loadStrings("track-" + track + ".txt");
    int cols = 36;
    int rows = 24;

    timeOfDay = int(lines[0]);
    int x = 0;
    int y = 0;

    for (int i = 2; i < 2+rows; i++) {
      for (int j = 0; j < cols; j++) {
        String cellText = lines[i].substring(j*3, j*3+2);

        tiles.add(new Tile(int(cellText), x, y));
        x += 30;
      }
      x = 0;
      y += 30;
    }
  }

  void startRace() {
    startTime = millis();
  }

  //void checkCollision(Car car) {
  //  if (get(int(car.x), int(car.y)) == color(255, 255, 254)) {
  //    car.nitro();
  //    car.mapProperties();
  //  }
  //}

}
