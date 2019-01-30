class Car {
  String displayName;

  float x, y, w, h;
  float dir;
  float speed;
  float speedX;
  float speedY;

  float wheelDir;

  float maxSpeed, acceleration, traction, durability, weight, handling;
  float friction;
  Tile tileOn;

  // Hitbox variables
  float top, bot, left, right;
  //float topL, topR, botL, botR;

  color col;

  boolean drivingForward;
  boolean drivingBackward;

  boolean nitro;

  Car(float x, float y, color col) {
    this.x = x;
    this.y = y;
    this.col = col;

    dir = PI+HALF_PI; // facing up
    wheelDir = dir;
    speed = 0;

    drivingForward = false;
    drivingBackward = false;

    //  update();
  }

  void mapProperties() {
    maxSpeed = map(maxSpeed, 1, 9, 1.8, 3);
    acceleration = map(acceleration, 1, 9, 0.03, 0.08); // tofix
    traction = map(traction, 1, 9, 0.995, 0.97); // tofix
    durability = map(durability, 1, 9, 1, 3); // todo
    weight = map(weight, 1, 9, 1, 3); // todo
    handling = map(handling, 1, 9, PI/64, PI/128); // todo
  }

  void update() {
    // calculating friction
    friction = traction*tileOn.mu;

    // add "-maxSpeed*0.6" to 1, 2, 4th constrain()s
    if (drivingForward) {
      // fix
      // speed += map(0.05, 0, 0.99, 0, 0.99);
      speed += acceleration * friction;
      //speed += map(acceleration, 0, tileOn.mu, 0, 0.99);
      speed = constrain(speed, -maxSpeed, maxSpeed);
    }
    if (drivingBackward) {
      speed -= acceleration * friction;
      //speed -= map(acceleration, 0, tileOn.mu, 0, 0.99);
      speed = constrain(speed, -maxSpeed, maxSpeed);
    }

    // slowing down
    if ((!drivingForward && !drivingBackward) || (drivingForward && drivingBackward)) {
      if (speed > 0) {
        //speed -= 0.01; // Ff var
        speed *= friction;
        speed = constrain(speed, 0, maxSpeed);
      } else if (speed < 0) {
        //speed += 0.01;
        speed *= friction;
        speed = constrain(speed, -maxSpeed, 0);
      }
    }

    if (abs(speed) < 0.01)
      speed = 0;

    //println("speed = " + speed + "; dir = " + dir + "; wheelDir = " + wheelDir);
    wheelDir = constrain(wheelDir, dir-QUARTER_PI, dir+QUARTER_PI);
  }
  
  void move() { // Actually move the car
    x += speed * cos(wheelDir);
    y += speed * sin(wheelDir);

    dir += alignBodyWithWheels();

    pushMatrix();
    translate(x, y);
    rotate(dir);
    top = 0-h/2;
    bot = 0+h/2;
    left = 0-w/2;
    right = 0+w/2;
    popMatrix();
  }
  
  Float[] checkMove() { // Hypothetical move
    float x_ = x + speed * cos(wheelDir);
    float y_ = y + speed * sin(wheelDir);
    float dir_ = dir + alignBodyWithWheels();

    Float[] returnFloat = {x_, y_, dir_};
    return returnFloat;
  }

  float alignBodyWithWheels() {
    float incrementDir;
    
    if (drivingBackward && !drivingForward) {
      incrementDir = (-(dir-wheelDir)/4 * (speed/8))/2;
    } else {
      incrementDir = -(dir-wheelDir)/4 * (speed/8);
    }
    
    return incrementDir;
  }

  void updateTile(Tile tile) {
    tileOn = tile;
  }

  void drive(boolean forward) {
    if (forward)
      drivingForward = true;
    else
      drivingBackward = true;
  }

  void unDrive(boolean forward) {
    if (forward)
      drivingForward = false;
    else
      drivingBackward = false;
  }

  //float findTurn(int direction) {


  //}

  void turnWheels(int direction) {
    if (direction == 0) { // Turn LEFT
      wheelDir -= handling;
    } else if (direction == 1) { // Turn RIGHT
      wheelDir += handling;
    }

    //wheelDir = constrain(wheelDir, dir-QUARTER_PI, dir+QUARTER_PI);
  }

  void turn(int direction) {
    if (direction == 0) { // Turn LEFT
      //dir -= handling*(speed/8);
      //speed *= 0.97;
    } else if (direction == 1) { // Turn RIGHT
      //dir += handling*(speed/8);
      //speed *= 0.97;
    }
  }

  void render() { // leave empty
  }

  void drawCollision(color col) { // leave empty
  }

  void nitro() {
    maxSpeed *= 2;
    acceleration *= 3;
    traction = 1;
    handling /= 1.5;

    nitro = true;
  }

  void disableNitro() {
  }
}

class RedCar extends Car {

  RedCar(float x, float y, color col) {
    super(x, y, col);

    w = 30;
    h = 20;

    //maxSpeed = 3;
    //acceleration = 0.05;
    //traction = 1;
    //durability = 6;
    //weight = 1;
    //handling = 9;

    maxSpeed = 5;
    acceleration = 5;
    traction = 5;
    durability = 5;
    weight = 5;
    handling = 5;

    mapProperties();

    displayName = "Red Car";
  }

  void render() {
    pushStyle();
    pushMatrix();

    translate(x, y);

    rotate(dir);

    // Body
    rectMode(CENTER);
    rect(0, 0, w, h);

    popMatrix();

    // Wheels
    pushMatrix();
    translate(x, y);
    rotate(dir);
    translate(w/2, h/2);
    rotate(wheelDir-dir);
    rect(0, 0, w/4, h/4);
    popMatrix();

    pushMatrix();
    translate(x, y);
    rotate(dir);
    translate(w/2, -h/2);
    rotate(wheelDir-dir);
    rect(0, 0, w/4, h/4);
    popMatrix();

    popStyle();
  }

  void drawCollision(color col) {
    pushStyle();

    rectMode(CENTER);
    fill(col);

    pushMatrix();

    translate(x, y);

    rotate(dir);

    // Body
    rect(0, 0, w, h);

    popMatrix();

    // Wheels
    pushMatrix();
    translate(x, y);
    rotate(dir);
    translate(w/2, h/2);
    rotate(wheelDir-dir);
    rect(0, 0, w/4, h/4);
    popMatrix();

    pushMatrix();
    translate(x, y);
    rotate(dir);
    translate(w/2, -h/2);
    rotate(wheelDir-dir);
    rect(0, 0, w/4, h/4);
    popMatrix();

    popStyle();
  }
}
