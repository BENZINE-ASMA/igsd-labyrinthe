//PShader firstProgrammeShader; 
//PShader myProgrammeShader; 

//void setup(){
//  firstProgrammeShader = loadShader("firstFragmentShader.glsl", "firstVertexShader.glsl");
//  myProgrammeShader = loadShader("myFragmentShader.glsl", "myVertexShader.glsl");
//  size(1000, 1000, P3D);
//}

//void draw(){
//  pointLight(255, 255, 255, mouseX, mouseY, 400);
//  noStroke();
//  fill(192, 128, 64);
  
//  translate(width/2, height/2);
//  shader(myProgrammeShader);
//  sphereDetail(30);
//  sphere(300);
  
//  shader(firstProgrammeShader);
//  sphereDetail(5);
//  for(float a = -6*PI; a<6*PI; a+=PI/100) {
//    pushMatrix();
//    translate(310*cos(a), a*10, 310*sin(a));
//    sphere(6);
//    popMatrix(); 
//  }
//}
//Pour celles et ceux qui voudraient coller les petites sphères à la grosse 
//Column 1

PShader firstProgrammeShader; 
PShader myProgrammeShader; 

void setup(){
  firstProgrammeShader = loadShader("firstFragmentShader.glsl", "firstVertexShader.glsl");
  myProgrammeShader = loadShader("myFragmentShader.glsl", "myVertexShader.glsl");
  size(1000, 1000, P3D);
}

void draw(){
  pointLight(255, 255, 255, mouseX, mouseY, 400);
  noStroke();
  fill(192, 128, 64);
  
  translate(width/2, height/2);
  //shader(myProgrammeShader);
  //sphereDetail(30);
  //sphere(300);
  
  shader(firstProgrammeShader);
  sphereDetail(5);
  for (int i=0; i<50; i++){
    for (int j=0; j<50; j++){
    pushMatrix();
    //float dy = a/PI*30;
    float rr = 6;
    translate(rr*i, rr*j,50);
    sphere(6);
    popMatrix(); 
    }
  }
}
