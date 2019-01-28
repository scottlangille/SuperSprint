class GameStateManager {
  private ArrayList<State> stack = new ArrayList();

  void reset() {
    stack.clear();
    stack.add(new State_Game()); // change to title screen later!!!!
    updateGameState();
  }

  private void updateGameState() {
    gameState = topState();
  }

  private State topState() {
    return(stack.get(stack.size()-1));
  }

  public int stackSize() {
    return(stack.size());
  }

  public void pushState(State newState) {
    stack.add(newState);
    updateGameState();
  }

  public void popState() {
    stack.remove(topState());
    updateGameState();
  }
}

interface State {
  void update();
  void render();
  void processClick();
  void processKey(char k, int code);
}
