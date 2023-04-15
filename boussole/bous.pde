float angle;
PImage boussole; 
float posX = 0.0;
float posY = 0.0;

void setup() {
  size(400, 400);
  angle = 0;
  boussole = loadImage("boussole.jpg");
  boussole.resize(70, 70);
}

void draw() {
  background(255);
  translate(width/2, height/2);
  
  //-------------------------------------boussole
  float theta = getPlayerAngle();
  pushMatrix();  // sauvegarder la matrice de transformation actuelle
  translate(0, 5);  // centrer la boussole
  rotate(theta);  // faire tourner la boussole en fonction de l'angle
  imageMode(CENTER);
  image(boussole, 0, 0);  // afficher l'image de la boussole centrée et tournée
  popMatrix();  // restaurer la matrice de transformation
  
  posX += 1;
  posY += 1;
  
  if (keyPressed) {
  if (keyCode == LEFT) {
    posX -= 1;
  } else if (keyCode == RIGHT) {
    posX += 1;
  } else if (keyCode == UP) {
    posY -= 1;
  } else if (keyCode == DOWN) {
    posY += 1;
  }
}

}

float getPlayerAngle() {
  float centerX = width / 2;  // x-coordinate of the center of the screen
  float centerY = height / 2;  // y-coordinate of the center of the screen
  float deltaX = posX - centerX;  // distance between player's x-coordinate and center of the screen
  float deltaY = posY - centerY;  // distance between player's y-coordinate and center of the screen
  return atan2(deltaY, deltaX);  // compute the angle between the two points
}
