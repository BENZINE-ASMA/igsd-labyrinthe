int LAB_SIZE = 11;
char labyrinthe [][];
char sides [][][];
float posX, posY, posZ;
float dirX,dirY, dirZ;
float sizeBox = 30.;


void setup() {
posX = 45.0;
posY = 0.;
posZ = 20.;
dirX = 45.;
dirY = 100.;
dirZ = 20.;
  frameRate(20);
  randomSeed(2);
  size(1000, 1000, P3D);
  labyrinthe = new char[LAB_SIZE][LAB_SIZE];
  sides = new char[LAB_SIZE][LAB_SIZE][4];
  int todig = 0;
  for (int j=0; j<LAB_SIZE; j++) {
    for (int i=0; i<LAB_SIZE; i++) {
      sides[j][i][0] = 0;
      sides[j][i][1] = 0;
      sides[j][i][2] = 0;
      sides[j][i][3] = 0;
      if (j%2==1 && i%2==1) {
        labyrinthe[j][i] = '.';
        todig ++;
      } else
        labyrinthe[j][i] = '#';
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

    if (labyrinthe[gy][gx] == '.') {
      todig--;
      labyrinthe[gy][gx] = ' ';
      labyrinthe[(gy+oldgy)/2][(gx+oldgx)/2] = ' ';
    }
  }

  labyrinthe[0][1]                   = ' '; // entree
  labyrinthe[LAB_SIZE-2][LAB_SIZE-1] = ' '; // sortie

  for (int j=1; j<LAB_SIZE-1; j++) {
    for (int i=1; i<LAB_SIZE-1; i++) {
      if (labyrinthe[j][i]==' ') {
        if (labyrinthe[j-1][i]=='#' && labyrinthe[j+1][i]==' ' &&
          labyrinthe[j][i-1]=='#' && labyrinthe[j][i+1]=='#')
          sides[j-1][i][0] = 1;// c'est un bout de couloir vers le haut
        if (labyrinthe[j-1][i]==' ' && labyrinthe[j+1][i]=='#' &&
          labyrinthe[j][i-1]=='#' && labyrinthe[j][i+1]=='#')
          sides[j+1][i][3] = 1;// c'est un bout de couloir vers le bas
        if (labyrinthe[j-1][i]=='#' && labyrinthe[j+1][i]=='#' &&
          labyrinthe[j][i-1]==' ' && labyrinthe[j][i+1]=='#')
          sides[j][i+1][1] = 1;// c'est un bout de couloir vers la droite
        if (labyrinthe[j-1][i]=='#' && labyrinthe[j+1][i]=='#' &&
          labyrinthe[j][i-1]=='#' && labyrinthe[j][i+1]==' ')
          sides[j][i-1][2] = 1;// c'est un bout de couloir vers la gauche
      }
    }
  }

  // un affichage texte pour vous aider a visualiser le labyrinthe en 2D
  for (int j=0; j<LAB_SIZE; j++) {
    for (int i=0; i<LAB_SIZE; i++) {
      print(labyrinthe[j][i]);
    }
    println("");
  }
}
void avanceDown(){
  posY+=sizeBox;
  dirY += sizeBox;
}

void keyPressed(){
  println(key);
  if (key==CODED){
    if(keyCode == DOWN){
     if ( (posX == dirX) && (dirY > posY)){ 
       avanceDown();
  }
  }else if (keyCode == UP){
  }else if (keyCode == LEFT){
  }else {}
  }   
}
void draw()
{
  background(150);
  translate(250,250);
  camera(posX,posY,posZ,dirX,dirY,dirZ,0.,0.,-1.);
  perspective(90, width/height,1 , 1200);
  translate(45,13*30);
  fill(248,196,147);
  box(30);
  translate(-45,-13*30);
  fill(255,255,255);
  
        beginShape(QUADS);

 //pushMatrix();
 for (int j=0; j<LAB_SIZE; j++) {
    for (int i=0; i<LAB_SIZE; i++) {
      //pushMatrix();
      if(labyrinthe[j][i] == '#'){
       
        pushMatrix();
        //translate(i*30, j*30); pour la box
         //box(30);
         // --
        // System.out.println("here --");
         if(j == 0 || labyrinthe[j - 1][i] != '#')
         {
          //if( j!=0 && sides[j-1][i][0] == 1) fill(255,255,0);
         
          vertex(i*30,j*30, 0);
          vertex(i*30,j*30, 30);
          vertex(i*30+30,j*30, 30);
          vertex(i*30+30,j*30, 0);
          //fill(0,0,0);
         }
       
        // |*
                   //System.out.println("here |*");
        if(i == 0 || labyrinthe[j][i - 1] != '#')
         {
           //if( i!= LAB_SIZE-1 && sides[j][i+1][1] == 1) fill(255,25,120);
          vertex(i*30,j*30, 0);
          vertex(i*30,j*30,30);
          vertex(i*30,j*30+30, 30);
          vertex(i*30,j*30+30, 0);
         // fill(0,0,0);
         }
       
        //__
                  // System.out.println( i+"here __"+j);
         if(j == LAB_SIZE-1 || labyrinthe[j + 1][i] != '#')
         {
              //if( j != LAB_SIZE-1 && sides[j+1][i][3] == 1) fill(255,100,0);
          vertex(i*30,j*30+30, 0);
          vertex(i*30,j*30+30, 30);
          vertex(i*30+30,j*30+30,30);
          vertex(i*30+30,j*30+30,0);
          //fill(0,0,0);
         }
         
        // *|
                   //System.out.println("here *|");
         if(i == LAB_SIZE-1 || labyrinthe[j][i + 1] != '#')
         {
            //if(i != 0 && sides[j][i-1][2] == 1) fill(255,255,120);
          vertex(i*30+30,j*30, 0);
          vertex(i*30+30,j*30, 30);
          vertex(i*30+30,j*30+30,30);
          vertex(i*30+30,j*30+30,0);
        //  fill(0,0,0);
         }
        endShape();
         popMatrix();
      }
      else {
        vertex(i*30,j*30, 0);
        vertex(i*30+30,j*30, 0);
        vertex(i*30+30,j*30+ 30, 0);
        vertex(i*30,j*30 +30, 0);
      }
  }
}
}
