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

void createLab(int size, int z){
  // laby0.fill(32+z/, 255, 45);

  float wallW = width/LAB_SIZE;
  float wallH = height/LAB_SIZE;
    for (int j=0; j<size; j++) {
      for (int i=0; i<size; i++) {
        if (labyrinthe[z/100][j][i]=='#') {
          laby0.fill(i*25, j*25, 255-i*10+j*10);
         //laby0.fill(32+z/2, 255-z/3, 45*z);
        if (j==0 || labyrinthe[z/100][j-1][i]==' ') {
          laby0.normal(0, -1, 0);
          for (int k=0; k<WALLD; k++)
            for (int l=-WALLD; l<WALLD; l++) {
              laby0.vertex(i*wallW-wallW/2+(k+0)*wallW/WALLD, j*wallH-wallH/2, (l+0)*50/WALLD, k/(float)WALLD*texture0.width, (0.5+l/2.0/WALLD)*texture0.height);
              laby0.vertex(i*wallW-wallW/2+(k+1)*wallW/WALLD, j*wallH-wallH/2, (l+0)*50/WALLD, (k+1)/(float)WALLD*texture0.width, (0.5+l/2.0/WALLD)*texture0.height);
              laby0.vertex(i*wallW-wallW/2+(k+1)*wallW/WALLD, j*wallH-wallH/2, (l+1)*50/WALLD, (k+1)/(float)WALLD*texture0.width, (0.5+(l+1)/2.0/WALLD)*texture0.height);
              laby0.vertex(i*wallW-wallW/2+(k+0)*wallW/WALLD, j*wallH-wallH/2, (l+1)*50/WALLD, k/(float)WALLD*texture0.width, (0.5+(l+1)/2.0/WALLD)*texture0.height);
            }
        }
//lower
        if (j==size-1 || labyrinthe[z/100][j+1][i]==' ') {
          laby0.normal(0, 1, 0);
          for (int k=0; k<WALLD; k++)
            for (int l=-WALLD; l<WALLD; l++) {
              laby0.vertex(i*wallW-wallW/2+(k+0)*wallW/WALLD, j*wallH+wallH/2, (l+1)*50/WALLD, (k+0)/(float)WALLD*texture0.width, (0.5+(l+1)/2.0/WALLD)*texture0.height);
              laby0.vertex(i*wallW-wallW/2+(k+1)*wallW/WALLD, j*wallH+wallH/2, (l+1)*50/WALLD, (k+1)/(float)WALLD*texture0.width, (0.5+(l+1)/2.0/WALLD)*texture0.height);
              laby0.vertex(i*wallW-wallW/2+(k+1)*wallW/WALLD, j*wallH+wallH/2, (l+0)*50/WALLD, (k+1)/(float)WALLD*texture0.width, (0.5+(l+0)/2.0/WALLD)*texture0.height);
              laby0.vertex(i*wallW-wallW/2+(k+0)*wallW/WALLD, j*wallH+wallH/2, (l+0)*50/WALLD, (k+0)/(float)WALLD*texture0.width, (0.5+(l+0)/2.0/WALLD)*texture0.height);
            }
        }
//right walls
        if (i==0 || labyrinthe[z/100][j][i-1]==' ') {
          laby0.normal(-1, 0, 0);
          for (int k=0; k<1; k++)
            for (int l=-WALLD; l<WALLD; l++) {
             laby0.vertex(i*wallW-wallW/2, j*wallH-wallH/2+(k+0)*wallW/WALLD, (l+1)*50/WALLD, (k+0)/(float)WALLD*texture0.width, (0.5+(l+1)/2.0/WALLD)*texture0.height);
              laby0.vertex(i*wallW-wallW/2, j*wallH-wallH/2+(k+1)*wallW/WALLD, (l+1)*50/WALLD, (k+1)/(float)WALLD*texture0.width, (0.5+(l+1)/2.0/WALLD)*texture0.height);
              laby0.vertex(i*wallW-wallW/2, j*wallH-wallH/2+(k+1)*wallW/WALLD, (l+0)*50/WALLD, (k+1)/(float)WALLD*texture0.width, (0.5+(l+0)/2.0/WALLD)*texture0.height);
              laby0.vertex(i*wallW-wallW/2, j*wallH-wallH/2+(k+0)*wallW/WALLD, (l+0)*50/WALLD, (k+0)/(float)WALLD*texture0.width, (0.5+(l+0)/2.0/WALLD)*texture0.height);
            }
        }
//left
        if (i==size-1 || labyrinthe[z/100][j][i+1]==' ') {
          laby0.normal(1, 0, 0);
          for (int k=0; k<1; k++)
            for (int l=-WALLD; l<WALLD; l++) {
              laby0.vertex(i*wallW+wallW/2, j*wallH-wallH/2+(k+0)*wallW/WALLD, (l+0)*50/WALLD, (k+0)/(float)WALLD*texture0.width, (0.5+(l+0)/2.0/WALLD)*texture0.height);
              laby0.vertex(i*wallW+wallW/2, j*wallH-wallH/2+(k+1)*wallW/WALLD, (l+0)*50/WALLD, (k+1)/(float)WALLD*texture0.width, (0.5+(l+0)/2.0/WALLD)*texture0.height);
              laby0.vertex(i*wallW+wallW/2, j*wallH-wallH/2+(k+1)*wallW/WALLD, (l+1)*50/WALLD, (k+1)/(float)WALLD*texture0.width, (0.5+(l+1)/2.0/WALLD)*texture0.height);
              laby0.vertex(i*wallW+wallW/2, j*wallH-wallH/2+(k+0)*wallW/WALLD, (l+1)*50/WALLD, (k+0)/(float)WALLD*texture0.width, (0.5+(l+1)/2.0/WALLD)*texture0.height);
            }
        }
        ceiling1.fill(32, 255, 0);
        ceiling1.vertex(i*wallW-wallW/2, j*wallH-wallH/2, 50);
        ceiling1.vertex(i*wallW+wallW/2, j*wallH-wallH/2, 50);
        ceiling1.vertex(i*wallW+wallW/2, j*wallH+wallH/2,50);
        ceiling1.vertex(i*wallW-wallW/2, j*wallH+wallH/2, 50);        
      } 
//      //else si ce n est pas un mur
      else {
        laby0.texture(ground);
        
        laby0.fill(20); // ground
        laby0.vertex(i*wallW-wallW/2, j*wallH-wallH/2, -50, 0, 0);
        laby0.vertex(i*wallW+wallW/2, j*wallH-wallH/2, -50, 0, 500);
        laby0.vertex(i*wallW+wallW/2, j*wallH+wallH/2, -50, 500,500);
        laby0.vertex(i*wallW-wallW/2, j*wallH+wallH/2, -50, 500,0);
        laby0.texture(texture0);
        
          ceiling0.beginShape(QUADS); // begin new shape for each ceiling
          ceiling0.fill(100); // top of walls
          ceiling0.vertex(i*wallW-wallW/2, j*wallH-wallH/2, 50);
          ceiling0.vertex(i*wallW+wallW/2, j*wallH-wallH/2, 50);
          ceiling0.vertex(i*wallW+wallW/2, j*wallH+wallH/2, 50);
          ceiling0.vertex(i*wallW-wallW/2, j*wallH+wallH/2, 50);
          ceiling0.endShape(); // end shape for each ceiling
          
        }
      }
    }
  
}
 
//dispaly the pyramid and walls if the player is out side 
void emempileLab(){
  ceiling0 = createShape();
  ceiling1 = createShape();
  ceiling1.beginShape(QUADS);
  ceiling0.beginShape(QUADS);
  laby0 = createShape();
  laby0.beginShape(QUADS);
  laby0.texture(texture0);
  laby0.noStroke();
  int size = 21;
  for (int z=0; z <PYR_SIZE; z++){
    createLab(size, z*90);
    size= size-4;
    }
   laby0.endShape();
   ceiling0.endShape();
   ceiling1.endShape();

}
void empPyr(){
  ceiling0 = createShape();
  ceiling1 = createShape();
  ceiling1.beginShape(QUADS);
  ceiling0.beginShape(QUADS);
  laby0 = createShape();
  laby0.beginShape(QUADS);
  laby0.texture(texture0);
  laby0.noStroke();
  int size = 29;
  for (int z=0; z <=564; z+=47){
    pushMatrix();
   // rotateX(PI/4);
   createPyr(size , z, z);
   popMatrix();
    size= size-2;
    
}
//createHeadPyr(size);

 laby0.endShape();
 ceiling0.endShape();
  ceiling1.endShape();
}

// print only one level will be called if the player is in the pyr 
void printLevel(int l){
    printMap(l);
  ceiling0 = createShape();
  ceiling1 = createShape();
  ceiling1.beginShape(QUADS);
  ceiling0.beginShape(QUADS);
  laby0 = createShape();
  laby0.beginShape(QUADS);
  laby0.texture(texture0);
  laby0.noStroke();
  createLab(21-(l*4), l*100);
  laby0.endShape();
  ceiling0.endShape();
  ceiling1.endShape();
}
void createPyr(int size, int z, float h) {
  //z=z/2;
  int t = z;
  int p = z;
  tint(188, 187, 136);
  float wallW = width/LAB_SIZE;
  float wallH = height/LAB_SIZE;
  int new_z =z+47;
  
  // mur face +losange
  
  beginShape(QUADS);
  texture(texture1);
  vertex(0+p, size*wallW+t, 0+z-50, 0, 0);
  vertex(size*wallW+p, size*wallW+t, 0+z-50, 0, 910);
  vertex(size*wallW+p, size*wallW+t, 47+z*2, 35, 910);
  vertex(0+p, size*wallW+t, 47+z*2, 35, 0);
  endShape();
  
  beginShape(QUADS);
  texture(texture1);
  vertex(0+p, size*wallW+t, 47+z, 0, 0);
  vertex(size*wallW+p, size*wallW+t, 47+z, 0, 910);
  vertex(size*wallW+p-90, size*wallW+t-90, 47+z, 35, (910-35));
  vertex(0+p+90, size*wallW+t-90, 47+z, 35, 35);
  
  endShape();


 // mur gauche+ losange
  beginShape(QUADS);
  texture(texture1);
  vertex(p, t, z-50,0, 0);
  vertex(p, size*wallW+t,0+z-50,0, 910);
  vertex(p, size*wallW+t,47+z*2, 35, 910);
  vertex(p, t,47+z*2,35, 0);
  endShape();
  beginShape(QUADS);
  texture(texture1);
  vertex(0+p, size*wallW+t,47+z, 0, 0);
  vertex(0+p, 0+t,47+z, 0, 910);
  vertex(0+p+90, 0+t+90,47+z, 35, (910-35));
  vertex(0+p+90, size*wallW+t-90,47+z, 35, 35);
  endShape();

   //mur arrier + losange
  beginShape(QUADS);
  texture(texture1);
  vertex(p, 0+t, z-50,0, 0);
  vertex(size*wallW+p, 0+t,z-50,0, 910);

  vertex(size*wallW+p, 0+t,47+z*2, 35, 910);
  vertex(0+p, 0+t,47+z*2,35, 0);
  endShape();
  beginShape(QUADS);
  texture(texture1);
  vertex(size*wallW+p, 0+t,47+z, 0, 0);
  vertex(0+p, 0+t,47+t, 0, 910);
  vertex(0+p+90, 0+t+90,47+z, 35, (910-35));
  vertex(size*wallW+p-90,t+90,47+z, 35, 35);
  endShape();

  //mur droite + losange
  beginShape(QUADS);
  texture(texture1);
  vertex(size*wallW+p, 0+t,0+z-50,0, 0);
  vertex(size*wallW+p, size*wallW+t,0+z-50,0, 910);
  vertex(size*wallW+p, size*wallW+t,47+z*2, 35, 910);
  vertex(size*wallH+p, 0+t,47+z*2,35, 0);
  endShape();
  beginShape(QUADS);
  texture(texture1);
  vertex(size*wallH+p, size*wallH+t,47+z, 0, 0);
  vertex(size*wallH+p, 0+t,47+z, 0, 910);
  vertex(size*wallH+p-90, 0+t+90,47+z, 35, (910-35));
  vertex(size*wallH+p-90, size*wallH+t-90,47+z, 35, 35);
  

  endShape();

}

// print the little map up left 
void printMap(int level)
{
  
  float wallW = width/LAB_SIZE;
  float wallH = height/LAB_SIZE;
    for (int j=0; j<LAB_SIZE; j++) {
    for (int i=0; i<LAB_SIZE; i++) {
      if (labyrinthe[level][j][i]=='#') {
        fill(i*25, j*25, 255-i*10+j*10);
        pushMatrix();
        translate(50+i*wallW/8, 50+j*wallH/8, 50);
        translate(79,width,0);
        box(wallW/10, wallH/10, 5);
        popMatrix();
      }
    }
  }
}
boolean isInLab(int dirX, int diry){
  if ((keyCode==40 && posX==1 && posY==-1) )
   {
      return (false);}
     else if (level!=0)
     return (true);
   else {
   return (posX+odirX>=0 && posX+odirX<21 && posY+odirY>=0 && posY+odirY<21);}
  }
  
