PShape straps, tete;

void setup() {
  noStroke();
  size(800, 800, P3D);
  pixelDensity(2);

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
}
void drawEyes(){
  stroke(255, 255, 255);
  fill(255, 255, 255);
  ellipse(200, 200, 15, 10);
  fill(0, 0, 0);
  ellipse(200, 200, 4, 7);
  fill(255, 255, 255);
  ellipse(228, 200, 15, 10);
  fill(0, 0, 0);
  ellipse(225, 200, 4, 7);
}
void cylindre(){
   int r = 26;
   int r1 =10;
float c1 = 190 + 10 * noise(abs(-300) / 10.0);
beginShape(QUAD_STRIP);
noStroke();
for (int i=-45; i<=25; i++) {
    float x1 = r*sin((i*PI/25.0));
    float y1 = r*cos((i*PI/25.0));
    float x2 = r1*sin((i*PI/25.0));
    float y2 = r1*cos((i*PI/25.0));
    
    
    fill(c1,c1-20,-0);
    vertex(x1, y1, 0);
    vertex(x2, y2, 500);
    
    
}
endShape();

}
void drawHands(){
  float c1 = 180 + 10 * noise(abs(-300) / 10.0);
  beginShape(QUAD_STRIP); // start the main shape
  for(int i=-70;i<70;i++){
    float a = (i)/12.02*3*PI;
    noStroke();
                               
      float n = noise(i/200.);
      float r2 = 20-(14+(i)/10.)*(sin(abs(i)/100.))+5*n;
      float r3 = 200*((i)/35.);
      //float c = 210 + 10 * noise(abs(i) / 10.0);

      //println(r3);
      fill(c1,c1-20,-700);
      vertex(r2*cos(a), r2*sin(a), r3);
      //stroke(10,25,55);
      fill(c1,c1-20,-700);
      vertex(r2*cos(a), r2*sin(a), r3+17);

    }
  
  endShape(); // end the main shape
}

void Hands(){
  pushMatrix();
  translate(width/2, height/2);
  //rotateY(2*PI/3);
  //rotateZ(PI/8);
 float angleDegrees = -7; // rotate by 45 degrees
float angleRadians = radians(angleDegrees); // convert to radians

rotateX(angleRadians);
float angleDegrees2 = 10; // rotate by 45 degrees
float angleRadians2 = radians(angleDegrees2); // convert to radians
  rotateZ(angleRadians2);
 
  drawHands();
  popMatrix();
  
  pushMatrix();
  translate(width/2, height/2);
  translate(0,0,-150);
   float angleDegrees5 = -7; // rotate by 45 degrees
float angleRadians5 = radians(angleDegrees5); // convert to radians

rotateX(angleRadians5);
  cylindre();
  popMatrix();
}

void draw() {
  background(255, 192, 255);
  
  pushMatrix();
  translate(width / 2, height / 3);
  rotateX(PI / 2);
  rotateZ(PI / 2);
  translate(-300, -240);
  shape(straps);
  popMatrix();
  
  pushMatrix();
  translate(width / 2, height / 3);
  rotateX(PI / 2);
  rotateZ(PI / 2);
  translate(-40, 5.15, 210.5);
  shape(tete);
  popMatrix();
  
  pushMatrix();
  translate(180,-22,70);
  drawEyes();
  popMatrix();
  pushMatrix();
  translate(100,-22,70);
  Hands();
  popMatrix();
  
}
