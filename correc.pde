int iposX = 1; //<>//
int iposY = -1;

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

int LAB_SIZE = 22;
int PYR_SIZE = 4;
char labyrinthe [][][];
char[][] pyramide[];
char sides [][][];

PShape laby0;
PShape ceiling0;

PShape ceiling1;

PImage  texture0;

void setup() { 
  pixelDensity(2);
  randomSeed(2);
 texture0 = loadImage("stones.jpg");
  size(1000, 1000, P3D);
  
  labyrinthe = new char[PYR_SIZE][LAB_SIZE][LAB_SIZE];
  //pyramide = new char[PYR_SIZE][LAB_SIZE][LAB_SIZE];
  sides = new char[LAB_SIZE][LAB_SIZE][4];
  int todig = 0;
 for (int k=0; k< PYR_SIZE; k++){
  for (int j=0; j<LAB_SIZE; j++) {
    for (int i=0; i<LAB_SIZE; i++) {
      // FIXME: sides for levels > 1
      sides[j][i][0] = 0;
      sides[j][i][1] = 0;
      sides[j][i][2] = 0;
      sides[j][i][3] = 0;
      if (j%2==1 && i%2==1) {
        labyrinthe[k][j][i] = '.';
        todig ++;
      } else
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
    else if (alea==2 && gx<LAB_SIZE-2) gx += 2; // .. va a droite
    else if (alea==3 && gy<LAB_SIZE-2) gy += 2; // .. va en bas

    if (labyrinthe[k][gy][gx] == '.') {
      todig--;
      labyrinthe[k][gy][gx] = ' ';
      labyrinthe[k][(gy+oldgy)/2][(gx+oldgx)/2] = ' ';
    }
  }
}

  labyrinthe[level][0][1]                   = ' '; // entree
  labyrinthe[level][LAB_SIZE-2][LAB_SIZE-1] = ' '; // sortie

//for (int k= 0; k < PYR_SIZE; k++) {
  for (int j=1; j<LAB_SIZE-1; j++) {
    for (int i=1; i<LAB_SIZE-1; i++) {
      if (labyrinthe[level][j][i]==' ') {
        if (labyrinthe[level][j-1][i]=='#' && labyrinthe[level][j+1][i]==' ' &&
          labyrinthe[level][j][i-1]=='#' && labyrinthe[level][j][i+1]=='#')
          sides[j-1][i][0] = 1;// c'est un bout de couloir vers le haut 
        if (labyrinthe[level][j-1][i]==' ' && labyrinthe[level][j+1][i]=='#' &&
          labyrinthe[level][j][i-1]=='#' && labyrinthe[level][j][i+1]=='#')
          sides[j+1][i][3] = 1;// c'est un bout de couloir vers le bas 
        if (labyrinthe[level][j-1][i]=='#' && labyrinthe[level][j+1][i]=='#' &&
          labyrinthe[level][j][i-1]==' ' && labyrinthe[level][j][i+1]=='#')
          sides[j][i+1][1] = 1;// c'est un bout de couloir vers la droite
        if (labyrinthe[level][j-1][i]=='#' && labyrinthe[level][j+1][i]=='#' &&
          labyrinthe[level][j][i-1]=='#' && labyrinthe[level][j][i+1]==' ')
          sides[j][i-1][2] = 1;// c'est un bout de couloir vers la gauche
      }
    }
  //}
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
  
  
  float wallW = width/LAB_SIZE;
  float wallH = height/LAB_SIZE;
  
  
    for (int j=0; j<size; j++) {
      for (int i=0; i<size; i++) {
        if (labyrinthe[level][j][i]=='#') {
          laby0.fill(i*25, j*25, 255-i*10+j*10);
          
          
         
          ceiling0.beginShape(QUADS); // begin new shape for each ceiling
          ceiling0.fill(32); // top of walls
          ceiling0.vertex(i*wallW-wallW/2+z, j*wallH-wallH/2+z, z);
          ceiling0.vertex(i*wallW+wallW/2+z, j*wallH-wallH/2+z, z);
          ceiling0.vertex(i*wallW+wallW/2+z, j*wallH+wallH/2+z, z);
          ceiling0.vertex(i*wallW-wallW/2+z, j*wallH+wallH/2+z, z);
          ceiling0.endShape(); // end shape for each ceiling
          
        }
      }
    }
    
  
  
 
}
void creatPyr(){
  ceiling0 = createShape();
  ceiling1 = createShape();
  
  ceiling1.beginShape(QUADS);
  ceiling0.beginShape(QUADS);
  
  laby0 = createShape();
  laby0.beginShape(QUADS);
  laby0.texture(texture0);
  laby0.noStroke();
  int size = 22;
  for (int z=0; z <400; z=z+100){
    
    createLab(size, z);
    size= size-5;
    
    
}
 laby0.endShape();
  ceiling1.endShape();
}



void draw() {
     creatPyr();
     
  background(192);
  sphereDetail(6);
  if (anim>0) anim--;

  float wallW = width/LAB_SIZE;
  float wallH = height/LAB_SIZE;

  perspective();
  //camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
 camera(width/2.0, height/2.0,2000, width/2.0, height/2.0, 0, 0,1,0);
  noLights();
  stroke(0);
  for (int j=0; j<LAB_SIZE; j++) {
    for (int i=0; i<LAB_SIZE; i++) {
      if (labyrinthe[level][j][i]=='#') {
        fill(i*25, j*25, 255-i*10+j*10);
        pushMatrix();
        //translate(50+i*wallW/8, 50+j*wallH/8, 50);
        translate(0,0,0);
        box(wallW/10, wallH/10, 5);
        popMatrix();
      }
    }
  }
  //pushMatrix();
  //fill(0, 255, 0);
  //noStroke();
  //translate(50+posX*wallW/8, 50+posY*wallH/8, 50);
  //sphere(3);
  //popMatrix();

  //stroke(0);
  //if (!inLab) {
  //  perspective(2*PI/3, float(width)/float(height), 1, 1000);
  //  if (animT)
  //    camera((posX-dirX*anim/20.0)*wallW,      (posY-dirY*anim/20.0)*wallH,      -15+2*sin(anim*PI/5.0), 
  //           (posX-dirX*anim/20.0+dirX)*wallW, (posY-dirY*anim/20.0+dirY)*wallH, -15+4*sin(anim*PI/5.0), 0, 0, -1);
  //  else if (animR)
  //    camera(posX*wallW, posY*wallH, -15, 
  //          (posX+(odirX*anim+dirX*(20-anim))/20.0)*wallW, (posY+(odirY*anim+dirY*(20-anim))/20.0)*wallH, -15-5*sin(anim*PI/20.0), 0, 0, -1);
  //  else {
  //    camera(posX*wallW, posY*wallH, -15, 
  //           (posX+dirX)*wallW, (posY+dirY)*wallH, -15, 0, 0, -1);
  //  }
  //  //camera((posX-dirX*anim/20.0)*wallW, (posY-dirY*anim/20.0)*wallH, -15+6*sin(anim*PI/20.0), 
  //  //  (posX+dirX-dirX*anim/20.0)*wallW, (posY+dirY-dirY*anim/20.0)*wallH, -15+10*sin(anim*PI/20.0), 0, 0, -1);

  //  lightFalloff(0.0, 0.01, 0.0001);
  //  pointLight(255, 255, 255, posX*wallW, posY*wallH, 15);
  //} else{
  //  lightFalloff(0.0, 0.05, 0.0001);
  //  pointLight(255, 255, 255, posX*wallW, posY*wallH, 15);
  //}

  noStroke();
  
  //for (int j=0; j<LAB_SIZE; j++) {
  //  for (int i=0; i<LAB_SIZE; i++) {
  //    pushMatrix();
  //    translate(i*wallW, j*wallH, 0);
  //    if (labyrinthe[level][j][i]=='#') {
  //      beginShape(QUADS);
  //      if (sides[j][i][3]==1) {
  //        pushMatrix();
  //        translate(0, -wallH/2, 40);
  //        if (i==posX || j==posY) {
  //          fill(i*25, j*25, 255-i*10+j*10);
  //          //sphere(5);              
  //          //spotLight(i*25, j*25, 255-i*10+j*10, 0, -15, 15 + level*100, 0, 0, -1, PI/4, 1);
  //        } else {
  //          fill(128);
  //          sphere(15);
  //        }
  //        popMatrix();
  //      }

  //      if (sides[j][i][0]==1) {
  //        pushMatrix();
  //        translate(0, wallH/2, 40);
  //        if (i==posX || j==posY) {
  //          fill(i*25, j*25, 255-i*10+j*10);
  //          sphere(5);              
  //          spotLight(i*25, j*25, 255-i*10+j*10, 0, -15, 15 + level*100, 0, 0, -1, PI/4, 1);
  //        } else {
  //          fill(128);
  //          sphere(15);
  //        }
  //        popMatrix();
  //      }
         
  //       if (sides[j][i][1]==1) {
  //        pushMatrix();
  //        translate(-wallW/2, 0, 40);
  //        if (i==posX || j==posY) {
  //          fill(i*25, j*25, 255-i*10+j*10);
  //          sphere(5);              
  //          spotLight(i*25, j*25, 255-i*10+j*10, 0, -15, 15 + level*100, 0, 0, -1, PI/4, 1);
  //        } else {
  //          fill(128);
  //          sphere(15);
  //        }
  //        popMatrix();
  //      }
         
  //      if (sides[j][i][2]==1) {
  //        pushMatrix();
  //        translate(0, wallH/2, 40);
  //        if (i==posX || j==posY) {
  //          fill(i*25, j*25, 255-i*10+j*10);
  //          sphere(5);              
  //          spotLight(i*25, j*25, 255-i*10+j*10, 0, -15, 15 + level*100, 0, 0, -1, PI/4, 1);
  //        } else {
  //          fill(128);
  //          sphere(15);
  //        }
  //        popMatrix();
  //      }
  //    } 
  //    popMatrix();
  //  }
  //}
  rotateX(PI/4);
  shape(laby0, 0, 0);
  if (inLab)
    shape(ceiling0, 0, 0);
   else
    shape(ceiling1, 0, 0);
    
}

void keyPressed() {

  if (key=='l') inLab = !inLab;

  if (anim==0 && keyCode==38) {
    if (posX+dirX>=0 && posX+dirX<LAB_SIZE && posY+dirY>=0 && posY+dirY<LAB_SIZE &&
      labyrinthe[level][posY+dirY][posX+dirX]!='#') {
      posX+=dirX; 
      posY+=dirY;
      anim=20;
      animT = true;
      animR = false;
    }
  }
  if (anim==0 && keyCode==40 && labyrinthe[level][posY-dirY][posX-dirX]!='#') {
    posX-=dirX; 
    posY-=dirY;
  }
  if (anim==0 && keyCode==37) {
    odirX = dirX;
    odirY = dirY;
    anim = 20;
    int tmp = dirX; 
    dirX=dirY; 
    dirY=-tmp;
    animT = false;
    animR = true;
  }
  if (anim==0 && keyCode==39) {
    odirX = dirX;
    odirY = dirY;
    anim = 20;
    animT = false;
    animR = true;
    int tmp = dirX; 
    dirX=-dirY; 
    dirY=tmp;
  }
}
