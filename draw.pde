
void draw() {

    LAB_SIZE = 21;

   background(148, 213, 249);

  
  
 
  sphereDetail(6);
  if (anim>0) anim--;
  float wallW = width/LAB_SIZE;
  float wallH = height/LAB_SIZE;
      if (isInLab(posX, posY)== true ) {
         printLevel(level);
          if (frameCount %19==0){
            pushMatrix();
            moveMomie();
            popMatrix();
          }
        else {  
        translate(posxM*48,posyM*48,-5);
      shape(momie());}
      //si le joueur se fait attrapee par la momie il reviens au niveau de depart
      //if (posX==posxM && posY==posyM)
      //{ 
      //  level=0;
      //  posX =1;
      //  posY = 0;}
      } 
       else 
       {
         if (level !=1)
          {
            pushMatrix();
          translate(47, -1, 0);
          rotateX(PI/2);
          fill(112, 103, 56);
          ellipse(0,0, 47, 90);
            popMatrix();
          empPyr();
       
          
            }
         shape(sable());
         
        
       }
  perspective();
  camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
  noLights();
  stroke(0);
   //-------------------------------------Map
  //printMap(level);
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
   
  //-------------------------------------boussole

  pushMatrix(); 
  translate(70,870);
  rotateCompass();
  imageMode(CENTER);
  image(boussole, 0, 0); 
  //arrow();
  
  popMatrix();  
  //--------------------------------------------  sphere du joueuer et momie

  pushMatrix();
  fill(0, 255, 0);
  noStroke();
  translate(50+posX*wallW/8, 50+posY*wallH/8, 50);
  sphere(3);
  popMatrix();
  
  pushMatrix();
  fill(255, 0, 0);
  noStroke();
  translate(50+posxM*wallW/8, 50+posyM*wallH/8, 50);
  sphere(3);
  popMatrix();


  stroke(0);
  
  
  if (!inLab) {
  //if (isInLab(posX, posY)) {

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
 //if (inLab){
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
   if (isInLab(posX, posY)== true) 
     shape(grd, 0, 0);
  shape(laby0, 0, 0);
  if (!inLab)
    shape(ceiling0, 0, 0);
   else
    shape(ceiling1, 0, 0);
}

void keyPressed() {
  if (key=='l') 
    //true shows the inside
    //false shows the top
    inLab = !inLab;
  //up
  if (anim==0 && keyCode==38) {
   // currentDirection = Direction.NORTH;
      if (posX ==LAB_SIZE2-1 && posY==LAB_SIZE2-2 && dirX ==1 && dirY==0)
        return ;
      if (level!= 0 && posX ==1 && posY==0 && dirX ==0 && dirY==-1)
        return ;
    if ((posX+dirX>=0 && posX+dirX<LAB_SIZE2 && posY+dirY>=0 && posY+dirY<LAB_SIZE2) ){
      if( labyrinthe[level][posY+dirY][posX+dirX]!='#') {
      posX+=dirX; 
      posY+=dirY;
      anim=20;
      animT = true;
      animR = false;
     }
}
    else //if (!isInLab(posX, posY))
    {
      posX+=dirX; 
      posY+=dirY;
      anim=20;
      animT = true;
      animR = false;
    }
   
  }
  //down
  if (anim==0 && keyCode==40 ){
    //currentDirection = Direction.SOUTH;
        if (posX ==LAB_SIZE2-1 && posY==LAB_SIZE2-2 && dirX ==-1 && dirY==0)
        return ;
      if (level!= 0 && posX ==1 && posY==0 && dirX ==0 && dirY==1)
        return ;
    if (!(posX-dirX>=0 && posX-dirX<LAB_SIZE2 && posY-dirY>=0 && posY-dirY<LAB_SIZE2)){
     
      posX-=dirX; 
      posY-=dirY;
    }else {
      if(labyrinthe[level][posY-dirY][posX-dirX]!='#') { 
         posX-=dirX; 
        posY-=dirY;
      }
    }
  }
  //left
  if (anim==0 && keyCode==37) {
    currentDirection = Direction.WEST;
    Bdir++;
    odirX = dirX;
    odirY = dirY;
    anim = 20;
    int tmp = dirX; 
    dirX=dirY; 
    dirY=-tmp;
    animT = false;
    animR = true;
  }
  
  //right
  if (anim==0 && keyCode==39) {
     currentDirection = Direction.EAST;
     Bdir--;
    odirX = dirX;
    odirY = dirY;
    anim = 20;
    animT = false;
    animR = true;
    int tmp = dirX; 
    dirX=-dirY; 
    dirY=tmp;
  }
  if (keyCode == 85 )
  {
   
    if (level < 4 && posX ==LAB_SIZE2-1 && posY==LAB_SIZE2-2)
     {
        LAB_SIZE2-=4;
       level++;
       posX=1;
       posY=0;
       posxM =1;
       posyM =0;
       dirxM =0;
       diryM =1;
   }
  }
  

}
