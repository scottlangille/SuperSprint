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

void keyPressed() {
  if (keyCode == ESC && gameStateManager.stackSize() > 1) { // If title screen, exit game. Otherwise:
    key = 0; // Do not exit
    gameStateManager.popState(); // Remove the top state
    return; // Exit the the keyPressed() method
  }

  gameState.processKey(str(key).toUpperCase().charAt(0), keyCode); // Sends uppercase key and keyCode information.

  if (keyCode < 223)
    keyboard.pressKey(keyCode); // Store key position in Keyboard object
}

void keyReleased() {
  if (keyCode < 223)
    keyboard.releaseKey(keyCode); // Store key position in Keyboard object
}
