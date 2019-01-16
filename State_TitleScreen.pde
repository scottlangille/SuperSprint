class State_TitleScreen implements State {
  Button button_startGame;

  State_TitleScreen() {
    button_startGame = new Button("Start Game", 18, width-250, height-100, 200, 50);
  }

  void update() {
    button_startGame.update();
  }

  void render() {
    pushStyle();

    background(0);
    imageMode(CENTER);
    image(img_TitleScreen, width/2, height/2);

    if (button_startGame.isHover()) {
      button_startGame.render(col_titleHoverButton);
    } else {
      button_startGame.render(col_defaultButton);
    }


    popStyle();
  }

  void processKey(char k, int code) {
  }

  void processClick() {
    if (button_startGame.isHover()) {
      gameStateManager.pushState(new State_Game());
    }
  }
}
