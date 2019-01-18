class State_Game implements State {
  
  int track;
  int timeOfDay;
  
  State_Game() {
    track = 1;
  }

  void update() {
  }

  void render() {
    pushStyle();
    
    background(0);
 
    popStyle();
  }

  void processKey(char k, int code) {
  }

  void processClick() {
  }
}
