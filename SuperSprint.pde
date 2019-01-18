// SUPER SPRINT
// Created by Scott Langille & Jacob Kloepper
// Last updated January 18, 2019

/* TODO:
 - 
 - 
 - 
 */

Settings gameSettings;
Keyboard keyboard;
State gameState;
GameStateManager gameStateManager;

import ddf.minim.*;
Minim minim;

void setup() {
  size(1080, 720);

  keyboard = new Keyboard();
  gameStateManager = new GameStateManager();
  gameSettings = new Settings();

  setupAudio();
  setupFonts();
  setupImages();
  setupColors();

  newGame();
}

void newGame() {
  gameSettings = new Settings();
  gameStateManager.reset();
}

void draw() {
  pushStyle();

  gameState.update();  
  gameState.render();

  popStyle();
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

void mousePressed() {
  gameState.processClick();
}

////////////////////////


// AUDIO ///////////////
AudioPlayer sfx_1;

void setupAudio() {
  minim = new Minim(this);


  //sfx_1 = minim.loadFile("sfx1.wav");
}
////////////////////////

// FONTS ///////////////
PFont font_atari;

void setupFonts() {
  font_atari = createFont("atari.ttf", 32);
}
////////////////////////

// IMAGES //////////////
PImage img_TitleScreen;

void setupImages() {
  img_TitleScreen = loadImage("titlescreen.jpg");
}
////////////////////////

// COLORS //////////////
color col_titleHoverButton;
color col_defaultButton;

void setupColors() {
  col_titleHoverButton = color(241, 240, 0);
  col_defaultButton = color(255);
}
////////////////////////
