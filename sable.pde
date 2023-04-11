//PShape desert;
//float noiseVal = 0;
//float angle = 0;

//void setup() {
//  size(800, 800, P3D);
  
//  //noStroke();
//  desert = createShape();
//  desert.beginShape(QUADS);
//  desert.stroke(1);
//  for (int j = -20; j < 20; j++) {
//    for (int i = -20; i < 20; i++) {
//      int t = 12;
//      desert.fill(175, 139, 1);
//      desert.vertex(j * t, i * t, noise(noiseVal + j * 0.1, noiseVal + i * 0.1) * 80);
//      desert.fill(173, 140, 1);
//      desert.vertex((j + 1) * t, i *t, noise(noiseVal + (j + 1) * 0.1, noiseVal + i * 0.1) * 80);
//      desert.fill(174, 136, 0);
//      desert.vertex((j + 1) *t, (i + 1) * t, noise(noiseVal + (j + 1) 
//                    * 0.1, noiseVal + (i + 1) * 0.1) * 80);
//      desert.fill(173, 135, 0);
//      desert.vertex(j * t, (i + 1) *t, noise(noiseVal + j * 0.1, noiseVal + (i + 1) * 0.1) * 80);
//    }
//  }
//  desert.endShape();
//}

//void draw() {
//  background(255);
//  // Set the camera to a top-down view
//  camera(400, 800, 0, 0, 0, 0, 0, 1, 0);
//  // Rotate the shape to be viewed from the top
//  rotateY(PI/2);
//  // Translate the shape to the center of the screen
//  translate(70, 70); 
//  // Draw the shape
//  shape(desert);
//  // Increment the noise value and angle for animation
//  noiseVal += 25;
//  angle += 0.01;
//}
