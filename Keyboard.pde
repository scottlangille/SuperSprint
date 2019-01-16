class Keyboard {
  boolean left, right; // True = key is currently pressed down
  // False = key is NOT currently pressed down

  Boolean[] keyCodesDown = new Boolean[223];

  Keyboard() {
    // Set all keyDown values to false
    for (int i = 0; i < keyCodesDown.length; i++) {
      keyCodesDown[i] = false;
    }
  }

  void pressKey(int code) {
    keyCodesDown[code] = true;
  }

  void releaseKey(int code) {
    keyCodesDown[code] = false;
  }

  void pressKey(char k) {
    int code = int(str(k).toUpperCase().charAt(0));
    keyCodesDown[code] = true;
  }
  
  void releaseKey(char k) {
    int code = int(str(k).toUpperCase().charAt(0));
    keyCodesDown[code] = false;
  }
  
  boolean checkKey(int code) {
    return(keyCodesDown[code]);
  }
  
  boolean checkKey(char k) {
    int code = int(str(k).toUpperCase().charAt(0));
    return(keyCodesDown[code]);
  }
}
