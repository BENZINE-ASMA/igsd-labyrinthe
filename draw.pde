
void draw() {
  //LAB_SIZE = 21 -level*4;
    LAB_SIZE = 21;

   int imgWidth = texture1.width;
  int imgHeight = texture1.height;

  //println(imgWidth,imgHeight);
  background(192);
 
  sphereDetail(6);
  if (anim>0) anim--;

  float wallW = width/LAB_SIZE;
  float wallH = height/LAB_SIZE;
      if (isInLab(posX, posY)== true) 
        {printLevel(level);}
       else 
       {
         empPyr();
         shape(sable());
       }


  

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
  
 //   if (!inLab) {
 //   if (isInLab(posX, posY)){
 //   println("is in here ");
 //   //empPyr();
 //   perspective(2*PI/3, float(width)/float(height), 1, 1000);
 //   if (animT)
 //     camera((posX-dirX*anim/20.0)*wallW,      (posY-dirY*anim/20.0)*wallH,      -15+2*sin(anim*PI/5.0), 
 //            (posX-dirX*anim/20.0+dirX)*wallW, (posY-dirY*anim/20.0+dirY)*wallH, -15+4*sin(anim*PI/5.0), 0, 0, -1);
 //   else if (animR)
 //     camera(posX*wallW, posY*wallH, -15, 
 //           (posX+(odirX*anim+dirX*(20-anim))/20.0)*wallW, (posY+(odirY*anim+dirY*(20-anim))/20.0)*wallH, -15-5*sin(anim*PI/20.0), 0, 0, -1);
 //   else {
 //     camera(posX*wallW, posY*wallH, -15, 
 //            (posX+dirX)*wallW, (posY+dirY)*wallH, -15, 0, 0, -1);
 //   }
 //   //camera((posX-dirX*anim/20.0)*wallW, (posY-dirY*anim/20.0)*wallH, -15+6*sin(anim*PI/20.0), 
 //   //  (posX+dirX-dirX*anim/20.0)*wallW, (posY+dirY-dirY*anim/20.0)*wallH, -15+10*sin(anim*PI/20.0), 0, 0, -1);
 ////if (inLab){
 //   lightFalloff(0.0, 0.01, 0.0001);
 //   pointLight(255, 255, 255, posX*wallW, posY*wallH, 15);
 // }else{
 //    if (animT)
 //     camera((posX-dirX*anim/20.0)*wallW,      (posY-dirY*anim/20.0)*wallH,      -15+2*sin(anim*PI/5.0)+100*level, 
 //            (posX-dirX*anim/20.0+dirX)*wallW, (posY-dirY*anim/20.0+dirY)*wallH, -15+4*sin(anim*PI/5.0), 0, 0, -1);
 //   else if (animR)
 //     camera(posX*wallW, posY*wallH, -15+100*level, 
 //           (posX+(odirX*anim+dirX*(20-anim))/20.0)*wallW, (posY+(odirY*anim+dirY*(20-anim))/20.0)*wallH, -15-5*sin(anim*PI/20.0), 0, 0, -1);
 //   else {
 //     camera(posX*wallW, posY*wallH, -15+100*level, 
 //            (posX+dirX)*wallW, (posY+dirY)*wallH, -15, 0, 0, -1);
 //   }
  
 // }
 //   }else{
 //   lightFalloff(0.0, 0.05, 0.0001);
 //   pointLight(255, 255, 255, posX*wallW, posY*wallH, 15);
 // }
  
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
// rotateX(PI/4);
    

  shape(laby0, 0, 0);
  if (!inLab)
    shape(ceiling0, 0, 0);
   else
    shape(ceiling1, 0, 0);
    
}


//boolean isOutLab(int posX, int posY){
//   if(level != 0)
//     return (false);
//   else if (posX==1 && posY==0)
//   return (true);
//   else 
//   return (false);
//  }
void keyPressed() {
  
  
  if (key=='l') 
    //true shows the inside
    //false shows the top
    inLab = !inLab;
  //up
  if (anim==0 && keyCode==38) {
    if ((posX+dirX>=0 && posX+dirX<LAB_SIZE && posY+dirY>=0 && posY+dirY<LAB_SIZE) ){
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
     // movPlayerCoor(dirX, dirY);
          //println(dirX);
    //println(dirY);
      posX+=dirX; 
      posY+=dirY;
      anim=20;
      animT = true;
      animR = false;
    }
   
  }
  //down
  if (anim==0 && keyCode==40 ){
    if (!(posX-dirX>=0 && posX-dirX<LAB_SIZE && posY-dirY>=0 && posY-dirY<LAB_SIZE)){
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
    //LAB_SIZE-=4;
    
    if (level < 4)
     {
       level++;
       posX=1;
       posY=0;
   }
  }
  

}
