 int iposX = 1;
int iposY = 0;

int posX = iposX;
int posY = iposY;
int level = 0;

int dirX = 0;
int dirY = 1;
int odirX = 0;
int odirY = 1;
int WALLD = 1;

int anim = 0;
boolean animT=false;
boolean animR=false;

boolean inLab = true;

int LAB_SIZE = 29;
int PYR_SIZE = LAB_SIZE/4;
char labyrinthe [][][];
char[][] pyramide[];
char sides [][][][];

PShape laby0;
PShape ceiling0;

PShape ceiling1;

PImage  texture0;
PImage  texture1;
float wallW = width/LAB_SIZE;
float wallH = height/LAB_SIZE;
  
void setup() { 
  pixelDensity(2);
  randomSeed(2);
 texture0 = loadImage("stones.jpg");
 texture1 = loadImage("stonewall.jpg");
 
  size(1000, 1000, P3D);
  
  labyrinthe = new char[PYR_SIZE][LAB_SIZE][LAB_SIZE];
  //pyramide = new char[PYR_SIZE][LAB_SIZE][LAB_SIZE];
  sides = new char[PYR_SIZE][LAB_SIZE][LAB_SIZE][4];
  int todig = 0;
  int labSizeDecrease = LAB_SIZE;
 for (int k=0; k< PYR_SIZE; k++){
  for (int j=0; j<labSizeDecrease; j++) {
    for (int i=0; i<labSizeDecrease; i++) {
      // FIXME: sides for levels > 1
      sides[k][j][i][0] = 0;
      sides[k][j][i][1] = 0;
      sides[k][j][i][2] = 0;
      sides[k][j][i][3] = 0;
      if (j%2==1 && i%2==1) {
        labyrinthe[k][j][i] = '.';
        todig ++;
      }else
        labyrinthe[k][j][i] = '#';
    }
  }
  int gx = 1;
  int gy = 1;
  while (todig>0 ) {
    int oldgx = gx;
    int oldgy = gy;
    int alea = floor(random(0, 4)); // selon un tirage aleatoire
    if      (alea==0 && gx>1)          gx -= 2; // le fantome va a gauche
    else if (alea==1 && gy>1)          gy -= 2; // le fantome va en haut
    else if (alea==2 && gx<labSizeDecrease-2) gx += 2; // .. va a droite
    else if (alea==3 && gy<labSizeDecrease-2) gy += 2; // .. va en bas

    if (labyrinthe[k][gy][gx] == '.') {
      todig--;
      labyrinthe[k][gy][gx] = ' ';
      labyrinthe[k][(gy+oldgy)/2][(gx+oldgx)/2] = ' ';
    }
  }
  labyrinthe[k][0][1]                   = ' '; // entree
  labyrinthe[k][labSizeDecrease-2][labSizeDecrease-1] = ' '; // sortie
    for (int j=1; j<labSizeDecrease-1; j++) {
      for (int i=1; i<labSizeDecrease-1; i++) {
        if (labyrinthe[k][j][i]==' ') {
          if (labyrinthe[k][j-1][i]=='#' && labyrinthe[k][j+1][i]==' ' &&
            labyrinthe[level][j][i-1]=='#' && labyrinthe[k][j][i+1]=='#')
            sides[k][j-1][i][0] = 1;// c'est un bout de couloir vers le haut 
          if (labyrinthe[k][j-1][i]==' ' && labyrinthe[k][j+1][i]=='#' &&
            labyrinthe[k][j][i-1]=='#' && labyrinthe[k][j][i+1]=='#')
            sides[k][j+1][i][3] = 1;// c'est un bout de couloir vers le bas 
          if (labyrinthe[k][j-1][i]=='#' && labyrinthe[k][j+1][i]=='#' &&
            labyrinthe[level][j][i-1]==' ' && labyrinthe[k][j][i+1]=='#')
            sides[k][j][i+1][1] = 1;// c'est un bout de couloir vers la droite
          if (labyrinthe[k][j-1][i]=='#' && labyrinthe[k][j+1][i]=='#' &&
            labyrinthe[k][j][i-1]=='#' && labyrinthe[k][j][i+1]==' ')
            sides[k][j][i-1][2] = 1;// c'est un bout de couloir vers la gauche
        }
      }
    }labSizeDecrease-=4;
 }



  // un affichage texte pour vous aider a visualiser le labyrinthe en 2D
  // for (int j=0; j<LAB_SIZE; j++) {
  //   for (int i=0; i<LAB_SIZE; i++) {
  //     print(labyrinthe[j][i]);
  //   }
  //   println("");
  // }
  
  //float wallW = width/LAB_SIZE;
  //float wallH = height/LAB_SIZE;

  //ceiling0 = createShape();
  //ceiling1 = createShape();
  
  //ceiling1.beginShape(QUADS);
  //ceiling0.beginShape(QUADS);
  
  //laby0 = createShape();
  //laby0.beginShape(QUADS);
  //laby0.texture(texture0);
  //laby0.noStroke();
  ////laby0.stroke(255, 32);
  ////laby0.strokeWeight(0.5);
}
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
        ceiling1.vertex(i*wallW-wallW/2+z, j*wallH-wallH/2+z, z+50);
        ceiling1.vertex(i*wallW+wallW/2+z, j*wallH-wallH/2+z, z+50);
        ceiling1.vertex(i*wallW+wallW/2+z, j*wallH+wallH/2+z,z+50);
        ceiling1.vertex(i*wallW-wallW/2+z, j*wallH+wallH/2+z, z+50);        
      } 
//      //else si ce n est pas un mur
      else {
        laby0.fill(20); // ground
        laby0.vertex(i*wallW-wallW/2+z, j*wallH-wallH/2+z, z-50, 0, 0);
        laby0.vertex(i*wallW+wallW/2+z, j*wallH-wallH/2+z, z-50, 0, 1);
        laby0.vertex(i*wallW+wallW/2+z, j*wallH+wallH/2+z, z-50, 1, 1);
        laby0.vertex(i*wallW-wallW/2+z, j*wallH+wallH/2+z, z-50, 1, 0);
        
          ceiling0.beginShape(QUADS); // begin new shape for each ceiling
          ceiling0.fill(100); // top of walls
          ceiling0.vertex(i*wallW-wallW/2+z, j*wallH-wallH/2+z, z);
          ceiling0.vertex(i*wallW+wallW/2+z, j*wallH-wallH/2+z, z);
          ceiling0.vertex(i*wallW+wallW/2+z, j*wallH+wallH/2+z, z);
          ceiling0.vertex(i*wallW-wallW/2+z, j*wallH+wallH/2+z, z);
          ceiling0.endShape(); // end shape for each ceiling
          
        }
      }
    }
  
}
 
//dispaly the pyramid and walls if the player is out side 
void empileLab(){
  ceiling0 = createShape();
  ceiling1 = createShape();
  ceiling1.beginShape(QUADS);
  ceiling0.beginShape(QUADS);
  laby0 = createShape();
  laby0.beginShape(QUADS);
  laby0.texture(texture0);
  laby0.noStroke();
  int size = 29;
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
  for (int z=0; z <14; z++){
    pushMatrix();
   // rotateX(PI/4);
   createPyr(size , z*50);
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
    //printMap(l);
  ceiling0 = createShape();
  ceiling1 = createShape();
  ceiling1.beginShape(QUADS);
  ceiling0.beginShape(QUADS);
  laby0 = createShape();
  laby0.beginShape(QUADS);
  laby0.texture(texture0);
  laby0.noStroke();
  createLab(29-(l*4), l*100);
  laby0.endShape();
  ceiling0.endShape();
  ceiling1.endShape();
}

//void createHeadPyr(int size){
//  float wallH = height/LAB_SIZE;
//  fill(127,52,36);
//  beginShape(TRIANGLES);
  
//    vertex(405,0,500);
//    vertex(360,0,360);
//    vertex(360,size*wallH - 360,0);
//  endShape();
    //vertex(45,0,45);
    //vertex(0,-90,0);
    //vertex(45,0,-45);
  
    //vertex(-45,0,45);
    //vertex(0,-90,0);
    //vertex(-45,0,-45);
  
    //vertex(-45,0,-45);
    //vertex(0,-90,0);
    //vertex(45,0,-45);
    
//}
  
void createPyr(int size, int z) {
  tint(188, 187, 136);
  float wallW = width/LAB_SIZE;
  float wallH = height/LAB_SIZE;
  
  // mur face +losange
  
  beginShape(QUADS);
  texture(texture1);
  vertex(0+z, size*wallW+z, 0+z-50, 0, 0);
  vertex(size*wallW+z, size*wallW+z, 0+z-50, 0, 910);
  vertex(size*wallW+z, size*wallW+z, 90+z, 90, 910);
  vertex(0+z, size*wallW+z, 90+z, 90, 0);
  endShape();
  
  beginShape(QUADS);
  texture(texture1);
  vertex(0+z, size*wallW+z, 90+z, 0, 0);
  vertex(size*wallW+z, size*wallW+z, 90+z, 0, 910);
  vertex(size*wallW+z-90, size*wallW+z-90, 90+z, 90, (910-90));
  vertex(0+z+90, size*wallW+z-90, 90+z, 90, 90);
  
  endShape();


 // mur gauche+ losange
  beginShape(QUADS);
  texture(texture1);
  vertex(z, z, z-50,0, 0);
  vertex(z, size*wallW+z,0+z-50,0, 910);
  vertex(z, size*wallW+z,90+z, 90, 910);
  vertex(z, z,90+z,90, 0);
  endShape();
  beginShape(QUADS);
  texture(texture1);
  vertex(0+z, size*wallW+z,90+z, 0, 0);
  vertex(0+z, 0+z,90+z, 0, 910);
  vertex(0+z+90, 0+z+90,90+z, 90, (910-90));
  vertex(0+z+90, size*wallW+z-90,90+z, 90, 90);
  endShape();

   //mur arrier + losange
  beginShape(QUADS);
  texture(texture1);
  vertex(0+z, 0+z, 0+z-50,0, 0);
  vertex(size*wallW+z, 0+z,0+z-50,0, 910);
  vertex(size*wallW+z, 0+z,90+z, 90, 910);
  vertex(0+z, 0+z,90+z,90, 0);
  endShape();
  beginShape(QUADS);
  texture(texture1);
  vertex(size*wallW+z, 0+z,90+z, 0, 0);
  vertex(0+z, 0+z,90+z, 0, 910);
  vertex(0+z+90, 0+z+90,90+z, 90, (910-90));
  vertex(size*wallW+z-90,z+90,90+z, 90, 90);
  endShape();

  //mur droite + losange
  beginShape(QUADS);
  texture(texture1);
  vertex(size*wallW+z, 0+z,0+z-50,0, 0);
  vertex(size*wallW+z, size*wallW+z,0+z-90,0, 910);
  vertex(size*wallW+z, size*wallW+z,90+z, 90, 910);
  vertex(size*wallH+z, 0+z,90+z,90, 0);
  endShape();
  beginShape(QUADS);
  texture(texture1);
  vertex(size*wallH+z, size*wallH+z,90+z, 0, 0);
  vertex(size*wallH+z, 0+z,90+z, 0, 910);
  vertex(size*wallH+z-90, 0+z+90,90+z, 90, (910-90));
  vertex(size*wallH+z-90, size*wallH+z-90,90+z, 90, 90);
  

  //endShape();

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

void light()
{
 for (int j=0; j<LAB_SIZE; j++) {
    for (int i=0; i<LAB_SIZE; i++) {
      pushMatrix();
      translate(i*wallW, j*wallH, 0);
      if (labyrinthe[level][j][i]=='#') {
        beginShape(QUADS);
        if (sides[level][j][i][3]==1) {
          pushMatrix();
          translate(0, -wallH/2, 40);
          if (i==posX || j==posY) {
            fill(i*25, j*25, 255-i*10+j*10);
            sphere(5);              
            spotLight(i*25, j*25, 255-i*10+j*10, 0, -15, 15 + level*100, 0, 0, -1, PI/4, 1);
          } else {
            fill(128);
            sphere(15);
          }
          popMatrix();
        }

        if (sides[level][j][i][0]==1) {
          pushMatrix();
          translate(0, wallH/2, 40);
          if (i==posX || j==posY) {
            fill(i*25, j*25, 255-i*10+j*10);
            sphere(5);              
            spotLight(i*25, j*25, 255-i*10+j*10, 0, -15, 15 + level*100, 0, 0, -1, PI/4, 1);
          } else {
            fill(128);
            sphere(15);
          }
          popMatrix();
        }
         
         if (sides[level][j][i][1]==1) {
          pushMatrix();
          translate(-wallW/2, 0, 40);
          if (i==posX || j==posY) {
            fill(i*25, j*25, 255-i*10+j*10);
            sphere(5);              
            spotLight(i*25, j*25, 255-i*10+j*10, 0, -15, 15 + level*100, 0, 0, -1, PI/4, 1);
          } else {
            fill(128);
            sphere(15);
          }
          popMatrix();
        }
         
        if (sides[level][j][i][2]==1) {
          pushMatrix();
          translate(0, wallH/2, 40);
          if (i==posX || j==posY) {
            fill(i*25, j*25, 255-i*10+j*10);
            sphere(5);              
            spotLight(i*25, j*25, 255-i*10+j*10, 0, -15, 15 + level*100, 0, 0, -1, PI/4, 1);
          } else {
            fill(128);
            sphere(15);
          }
          popMatrix();
        }
      } 
      popMatrix();
    }
  }
  
}

void draw() {
  LAB_SIZE = 29 -level*4;
   int imgWidth = texture1.width;
  int imgHeight = texture1.height;

  //println(imgWidth,imgHeight);
  background(192);
 
  sphereDetail(6);
  if (anim>0) anim--;

  float wallW = width/LAB_SIZE;
  float wallH = height/LAB_SIZE;
  if (isInLab(posX, posY))
     {
       printLevel(level);
       //light();
     }
   else
     empPyr();
  

  perspective();
  camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
  //camera(width/2.0, height/2.0, 2000, width/2.0, height/2.0, 0, 0, 1, 0);
 //camera(width/2.0, height,3000, width/2.0, height/2.0, 0, 0,1,0);
  noLights();
  stroke(0);
  for (int j=0; j<LAB_SIZE; j++) {
    for (int i=0; i<LAB_SIZE; i++) {
      if (labyrinthe[level][j][i]=='#') {
        fill(i*25, j*25, 255-i*10+j*10);
        pushMatrix();
        translate(50+i*wallW/8, 50+j*wallH/8, 50);
        box(wallW/10, wallH/10, 5);
        popMatrix();
      }
    }
  }
  
  //printing a level with it map
   //printLevel(1);
   //printMap(1, wallW, wallH);

  pushMatrix();
  fill(0, 255, 0);
  noStroke();
  translate(50+posX*wallW/8, 50+posY*wallH/8, 50);
  sphere(3);
  popMatrix();


  stroke(0);
  if (!inLab) {
    //empPyr();
    perspective(2*PI/3, float(width)/float(height), 1, 1000);
    if (animT)
      camera((posX-dirX*anim/20.0)*wallW,      (posY-dirY*anim/20.0)*wallH,      -15+2*sin(anim*PI/5.0), 
             (posX-dirX*anim/20.0+dirX)*wallW, (posY-dirY*anim/20.0+dirY)*wallH, -15+4*sin(anim*PI/5.0), 0, 0, -1);
    else if (animR)
      camera(posX*wallW, posY*wallH, -15, 
            (posX+(odirX*anim+dirX*(20-anim))/20.0)*wallW, (posY+(odirY*anim+dirY*(20-anim))/20.0)*wallH, -15-5*sin(anim*PI/20.0), 0, 0, -1);
    else {
      camera(posX*wallW, posY*wallH, -15, 
             (posX+dirX)*wallW, (posY+dirY)*wallH, -15, 0, 0, -1);
    }
    //camera((posX-dirX*anim/20.0)*wallW, (posY-dirY*anim/20.0)*wallH, -15+6*sin(anim*PI/20.0), 
    //  (posX+dirX-dirX*anim/20.0)*wallW, (posY+dirY-dirY*anim/20.0)*wallH, -15+10*sin(anim*PI/20.0), 0, 0, -1);

    lightFalloff(0.0, 0.01, 0.0001);
    pointLight(255, 255, 255, posX*wallW, posY*wallH, 15);
  } else{
    lightFalloff(0.0, 0.05, 0.0001);
    pointLight(255, 255, 255, posX*wallW, posY*wallH, 15);
  }

  noStroke();
  //light();
  
  for (int j=0; j<LAB_SIZE; j++) {
    for (int i=0; i<LAB_SIZE; i++) {
      pushMatrix();
      translate(i*wallW, j*wallH, 0);
      if (labyrinthe[level][j][i]=='#') {
        beginShape(QUADS);
        if (sides[level][j][i][3]==1) {
          pushMatrix();
          translate(0, -wallH/2, 40);
          if (i==posX || j==posY) {
            fill(i*25, j*25, 255-i*10+j*10);
            sphere(5);              
            spotLight(i*25, j*25, 255-i*10+j*10, 0, -15, 15 + level*100, 0, 0, -1, PI/4, 1);
          } else {
            fill(128);
            sphere(15);
          }
          popMatrix();
        }

        if (sides[level][j][i][0]==1) {
          pushMatrix();
          translate(0, wallH/2, 40);
          if (i==posX || j==posY) {
            fill(i*25, j*25, 255-i*10+j*10);
            sphere(5);              
            spotLight(i*25, j*25, 255-i*10+j*10, 0, -15, 15 + level*100, 0, 0, -1, PI/4, 1);
          } else {
            fill(128);
            sphere(15);
          }
          popMatrix();
        }
         
         if (sides[level][j][i][1]==1) {
          pushMatrix();
          translate(-wallW/2, 0, 40);
          if (i==posX || j==posY) {
            fill(i*25, j*25, 255-i*10+j*10);
            sphere(5);              
            spotLight(i*25, j*25, 255-i*10+j*10, 0, -15, 15 + level*100, 0, 0, -1, PI/4, 1);
          } else {
            fill(128);
            sphere(15);
          }
          popMatrix();
        }
         
        if (sides[level][j][i][2]==1) {
          pushMatrix();
          translate(0, wallH/2, 40);
          if (i==posX || j==posY) {
            fill(i*25, j*25, 255-i*10+j*10);
            sphere(5);              
            spotLight(i*25, j*25, 255-i*10+j*10, 0, -15, 15 + level*100, 0, 0, -1, PI/4, 1);
          } else {
            fill(128);
            sphere(15);
          }
          popMatrix();
        }
      } 
      popMatrix();
    }
  }
  
 //rotateX(PI/4);

  shape(laby0, 0, 0);
  if (inLab)
    shape(ceiling0, 0, 0);
   else
    shape(ceiling1, 0, 0);
    
}
boolean isInLab(int dirx, int diry){
  if ((keyCode==40 && posX==1 && posY==0) )
      return (false);
   //else if(level != 0)
   //  {
   //    println("heree ");
   //    return (true);
   //  }
   else 
   return (posX+dirx>=0 && posX+dirx<LAB_SIZE && posY+diry>=0 && posY+diry<LAB_SIZE);
  }

boolean isOutLab(int posX, int posY){
   if(level != 0)
     return (false);
   else 
   return (posX>=0 && posX<LAB_SIZE && posY>=0 && posY<LAB_SIZE);
  }

void movPlayerCoor(int x, int y)
{
  posX+=x; 
  posY+=y;
  //anim=20;
}
void keyPressed() {
  
  if (key=='l') 
    //true shows the inside
    //false shows the top
    inLab = !inLab;
  //up
  if (anim==0 && keyCode==38) {
    if (isInLab(dirX, dirY) ){
      if( labyrinthe[level][posY+dirY][posX+dirX]!='#') {
      //movPlayerCoor(dirX, dirY);
      posX+=dirX; 
      posY+=dirY;
      anim=20;
      animT = true;
      animR = false;
      //inLab = true;
    }
    }
    else //if (!isInLab(posX, posY))
    {
      movPlayerCoor(dirX, dirY);
      //posX+=dirX; 
      //posY+=dirY;
      anim=20;
      animT = true;
      animR = false;
    }
   
  }
  //down
  if (anim==0 && keyCode==40 ){
    println(isInLab(posX, posY));
    println(posX);
    println(posY);
    if (isInLab(-dirX, -dirY) == false){
      //movPlayerCoor(-dirX, -dirY);
      println("here");
        posX-=dirX; 
        posY-=dirY;
    }else {
      if(labyrinthe[level][posY-dirY][posX-dirX]!='#') { 
        //inLab = true;
        posX-=dirX; 
        posY-=dirY;
      }
    }
  }
  //left
  if (anim==0 && keyCode==37) {
    odirX = dirX;
    odirY = dirY;
    anim = 20;
    int tmp = dirX; 
   // movPlayerCoor(dirY, -tmp);
    dirX=dirY; 
    dirY=-tmp;
    animT = false;
    animR = true;
  }
  
  //right
  if (anim==0 && keyCode==39) {
    odirX = dirX;
    odirY = dirY;
    anim = 20;
    animT = false;
    animR = true;
    int tmp = dirX; 
    //movPlayerCoor(-dirY, tmp);
    dirX=-dirY; 
    dirY=tmp;
  }
  

}
