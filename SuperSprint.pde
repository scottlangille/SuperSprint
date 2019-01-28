// SUPER SPRINT
// Created by Scott Langille & Jacob Kloepper
// Last updated January 28, 2019

/* TODO:
 - Car turn/move
 - Design a few tiles
 - 
 */

Settings gameSettings;
Keyboard keyboard;
State gameState;
GameStateManager gameStateManager;

import ddf.minim.*;
Minim minim;

void setup() {
  size(1080, 720); // 36x24 tiles; each tile is 30x30 pixels

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

PImage img_tile0;
PImage img_tile1;
PImage img_tile2;
PImage img_tile3;
PImage img_tile4;
PImage img_tile5;
PImage img_tile6;
PImage img_tile7;
PImage img_tile8;
PImage img_tile9;
PImage img_tile10;

/*
   00 barrier
 01 road1
 02 road2  
 03 road3
 04 checkpoint
 05 grass
 06 oil
 07 sand
 08 ice
 09 finish line
 10 scenery
 */

void setupImages() {
  img_TitleScreen = loadImage("titlescreen.jpg");

  // img_tile0 = loadImage("tile_barrier.jpg");
  img_tile1 = loadImage("tile_road1.jpg");
  //img_tile2 = loadImage("tile_road2.jpg");
  //img_tile3 = loadImage("tile_road3.jpg");
  //img_tile4 = loadImage("tile_checkpoint.jpg");
  //img_tile5 = loadImage("tile_grass.jpg");
  //img_tile6 = loadImage("tile_oil.jpg");
  //img_tile7 = loadImage("tile_sand.jpg");
  //img_tile8 = loadImage("tile_ice.jpg");
  //img_tile9 = loadImage("tile_finishline.jpg");
  img_tile10 = loadImage("tile_scenery.jpg");
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
