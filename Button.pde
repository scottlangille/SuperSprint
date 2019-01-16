class Button {
  String text;
  int textSize;
  int x, y, w, h;
  int top, bot, left, right;
  
  boolean hover = false;

  Button(String text, int textSize, int x, int y, int w, int h) {
    this.text = text;
    this.textSize = textSize;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    
    top = y;
    bot = y+h;
    left = x;
    right = x+w;
  }
  
  void update() {
    if (mouseX > left &&
        mouseX < right &&
        mouseY > top &&
        mouseY < bot) {
          hover = true;
        } else {
          hover = false;
        }
  }
  
  void render(color col) {
    pushStyle();
    
    // Border
    strokeWeight(3);
    stroke(col);
    fill(0);
    rectMode(CORNER);
    rect(x,y,w,h);
    
    // Text
    fill(255);
    textFont(font_atari);
    textSize(textSize);
    textAlign(CENTER, CENTER);
    text(text, x+w/2, y+h/2);
    
    
    popStyle();
  }
  
  boolean isHover() {
    return hover;
  }
}
