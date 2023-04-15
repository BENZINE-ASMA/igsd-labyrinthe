int iposX =1;
int iposY = 0;

int posX = iposX;
int posY = iposY;
int level = 0;

int MdirX = 0;
int MdirY = 1;

int dirX = 0;
int dirY = 1;
int odirX = 0;
int odirY = 1;
int WALLD = 1;

int anim = 0;
boolean animT=false;
boolean animR=false;

boolean inLab = false;

int LAB_SIZE = 21;
int LAB_SIZE2 = 21;
int PYR_SIZE = LAB_SIZE/4;
char labyrinthe [][][];
//char[][] pyramide[];
char sides [][][][];

PShape laby0;
PShape ceiling0;

PShape ceiling1;

PImage  texture0;
PImage  texture1;
PImage  textSable;
PImage  ground;

float wallW = width/LAB_SIZE;
float wallH = height/LAB_SIZE;

PShape ovalDoor; // Declare PShape object for oval door
float centerX; // X-coordinate of the center of the door
float centerY; // Y-coordinate of the center of the door
float doorWidth; // Width of the door
float doorHeight; // Height of the door 
  
PShape desert;
float noiseVal = 0;
float angle = 0;

PShape sable(){
  desert = createShape();
  desert.beginShape(QUADS);
  noStroke();
  desert.texture(textSable);
  for (int j = -60; j < 60; j++) {
    for (int i = -60; i < 60; i++) {
      int t = 12;
      
      desert.fill(175, 139, 1);
      desert.vertex(j * t, i * t, noise(noiseVal + j * 0.1, noiseVal + i * 0.1) * 80,0,0);
      desert.fill(173, 140, 1);
      desert.vertex((j + 1) * t, i *t, noise(noiseVal + (j + 1) * 0.1, noiseVal + i * 0.1) * 80,400,0);
      desert.fill(174, 136, 0);
      desert.vertex((j + 1) *t, (i + 1) * t, noise(noiseVal + (j + 1) 
                    * 0.1, noiseVal + (i + 1) * 0.1) * 80,400,400);
      desert.fill(173, 135, 0);
      desert.vertex(j * t, (i + 1) *t, noise(noiseVal + j * 0.1, noiseVal + (i + 1) * 0.1) * 80,0,400);
    }
  }
  //desert.rotateY(PI/2);
  desert.endShape();
  //x z y
  desert.translate(0,-10,-80);
  return desert;
  
}




void setup() { 
  pixelDensity(2);
  randomSeed(2);
  boussole = loadImage("boussole.jpg");
  boussole.resize(70,70);
  
  hand1 = loadShape("hand1.obj");
  hand2 = loadShape("hand2.obj");
 texture0 = loadImage("stones.jpg");
 texture1 = loadImage("stonewall.jpg");
 textSable = loadImage("sable.jpg");
 ground  = loadImage("ground.jpg");
  size(1000, 1000, P3D);
  centerX = 1340;
  centerY = 1340;
  doorWidth = 47;
  doorHeight = 50;
    ovalDoor = createDoor(centerX, centerY, doorWidth, doorHeight); // Create the oval door PShape

  
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
            labyrinthe[k][j][i-1]=='#' && labyrinthe[k][j][i+1]=='#')
            sides[k][j-1][i][0] = 1;// c'est un bout de couloir vers le haut 
          if (labyrinthe[k][j-1][i]==' ' && labyrinthe[k][j+1][i]=='#' &&
            labyrinthe[k][j][i-1]=='#' && labyrinthe[k][j][i+1]=='#')
            sides[k][j+1][i][3] = 1;// c'est un bout de couloir vers le bas 
          if (labyrinthe[k][j-1][i]=='#' && labyrinthe[k][j+1][i]=='#' &&
            labyrinthe[k][j][i-1]==' ' && labyrinthe[k][j][i+1]=='#')
            sides[k][j][i+1][1] = 1;// c'est un bout de couloir vers la droite
          if (labyrinthe[k][j-1][i]=='#' && labyrinthe[k][j+1][i]=='#' &&
            labyrinthe[k][j][i-1]=='#' && labyrinthe[k][j][i+1]==' ')
            sides[k][j][i-1][2] = 1;// c'est un bout de couloir vers la gauche
        }
      }
    }labSizeDecrease-=4;
 }



 //printLevel(level);

}
