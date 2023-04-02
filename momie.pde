PShape Momie;
PShape straps, tete , leftHand, rightHand, leftEye, rightEye, leftIris, rightIris;
color c;
void setup() {
  noStroke();
  size(800, 800, P3D);
  pixelDensity(2);
  
  Momie = createShape(GROUP);
  fill(0);
  leftIris = createShape(ELLIPSE,-10, -30, 3, 6);
  leftIris.translate(0,0,91.5);
  leftIris.fill(0);
  leftIris.endShape();
  
  rightIris = createShape(ELLIPSE,20, -30, 3, 6);
  rightIris.translate(0,0,91.5);
  rightIris.endShape();

  noFill();
  fill(255,255,255);
  leftEye = createShape(ELLIPSE,-10, -33, 15, 10);
  leftEye.translate(0,0,90.5);
  leftEye.fill(255, 255, 255);
  leftEye.endShape();
  
  rightEye = createShape(ELLIPSE,20, -33, 15, 10);
  rightEye.translate(0,0,90.5);
  rightEye.fill(255, 255, 255);
  rightEye.endShape();
  
  
  
  straps = createShape();
  straps.beginShape(QUAD_STRIP);
  for (int i = -300; i <= 300; i++) {
    float a = -100 + abs(i) / 13.02 * 3.5 * PI;
    float n = noise(abs(i) / 200.0);
    float r2 = 70 - ((25 + abs(i) / 10.0) * acos(sin(abs(i) / 100.0))) + 10 * n;
    float r3 = -300 + 45 * (abs(i) / 35.0);
    float c = 180 + 10 * noise(abs(i) / 10.0);
    straps.fill(c + 20, c + 5, 20);
    straps.vertex(r2 * cos(a) + 250 - 5 * n, r2 * sin(a) + 250 - 5 * n, r3 - 5 * n);
    straps.fill(c, c - 20, -700);
    
    straps.vertex(r2 * cos(a) + 250 + 10 * n, r2 * sin(a) + 250 - 10 * n, r3 + 17 + 5 * n);
  }
  straps.endShape();
  
  //move straps 
  
  tete = createShape();
  tete.beginShape(QUAD_STRIP);
  for (int i = 50; i < 250; i++) {
    float a = i / 13.02 * 3 * PI;
    float n = noise(i / 200.0);
    float r2 = 47 - ((15 + i / 10.0) * acos(sin(i / 100.0))) + 5 * n;
    float r3 = -200 + 20 * (i / 35.0);
    float c = 180 + 10 * noise(abs(i) / 10.0);
    tete.fill(c + 20, c + 5, 20);
    tete.vertex(r2 * cos(a), r2 * sin(a), r3);
    tete.fill(c, c - 20, -700);
    tete.vertex(r2 * cos(a), r2 * sin(a), r3 + 17);
  }
  tete.endShape();
  
  leftHand = createShape();
  leftHand.beginShape(QUAD_STRIP);
  
  for(int i=-70;i<70;i++){
    float a = abs(i)/11.02*4*PI;
    noStroke();
    float n = noise(i/200.);
    float r2 = 20-(12+abs(i)/10.)*cos(sin((i)/100.))+5*n;
    float r3 = 112*(abs(i)/35.)+n;;
    float c = 180 + 10 * noise(abs(i) / 10.0);
    leftHand.fill(c + 20, c + 5, 20);
    leftHand.vertex(r2 * cos(a), r2 * sin(a), r3);
    leftHand.fill(c, c - 20, -700);
    leftHand.vertex(r2 * cos(a), r2 * sin(a), r3 + 17);
  }
  
  leftHand.endShape();
  
  rightHand = createShape();
  rightHand.beginShape(QUAD_STRIP);
  
  for(int i=-70;i<70;i++){
    float a = abs(i)/11.02*4*PI;
    noStroke();
    float n = noise(i/200.);
    float r2 = 20-(12+abs(i)/10.)*cos(sin((i)/100.))+5*n;
    float r3 = 112*(abs(i)/35.)+n;;
    float c = 180 + 10 * noise(abs(i) / 10.0);
    rightHand.fill(c + 20, c + 5, 20);
    rightHand.vertex(r2 * cos(a), r2 * sin(a), r3);
    rightHand.fill(c, c - 20, -700);
    rightHand.vertex(r2 * cos(a), r2 * sin(a), r3 + 17);
  }
  
  rightHand.endShape();
  
  Momie.addChild(straps);
  Momie.addChild(tete);
  Momie.addChild(leftHand);
  Momie.addChild(rightHand);
  Momie.addChild(leftEye);
  Momie.addChild(rightEye);
  Momie.addChild(leftIris);
  Momie.addChild(rightIris);
  
   
    //(x,z,y)
   straps.translate(-250,-200,-50);
   straps.rotateX(PI/2);
   tete.translate(4.5,50,156);
   tete.rotateX(PI / 2);
  //hands
  //(x,y,z) -5 -15 0.5
  leftHand.translate(25,94,90);
  float angleDegrees = -5; // rotate by 45 degrees
  float angleRadians = radians(angleDegrees); // convert to radians
  leftHand.rotateX(angleRadians);
  
  float angleDegrees2 = -15; // rotate by 45 degrees
  float angleRadians2 = radians(angleDegrees2); // convert to radians
 leftHand.rotateZ(angleRadians2);
 
  float angleDegrees3 = 0.5; 
  float angleRadians3 = radians(angleDegrees3); // convert to radians
  leftHand.rotateY(angleRadians3);
  
  //----------------------------------------------------------------
  float angleDegrees4 = -5; // rotate by 45 degrees
  float angleRadian4 = radians(angleDegrees4); // convert to radians
  
  
  float angleDegrees5 = 15; // rotate by 45 degrees
  float angleRadian5 = radians(angleDegrees5); // convert to radians

 
  float angleDegrees6 = 0.5; 
  float angleRadian6 = radians(angleDegrees6); // convert to radians
  
  
  rightHand.translate(-25,94,90);
  rightHand.rotateX(angleRadian4);
  rightHand.rotateZ(angleRadian5);
  rightHand. rotateY(angleRadian6);
 
 
  
}


void draw() {
  background(255, 192, 255);
 translate(width / 2, height / 3);
 //rotateY(PI/2);
  shape(Momie);
  
}
