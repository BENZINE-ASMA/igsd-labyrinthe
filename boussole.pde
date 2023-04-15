PImage boussole; 

  PShape arrow;
  PShape arrow(){
  arrow = createShape();
  arrow.beginShape();
  arrow.fill(255, 0, 0);
  arrow.stroke(0);
  arrow.vertex(0, -70);
  arrow.vertex(-10, -40);
  arrow.vertex(0, -50);
  arrow.vertex(10, -40);
  arrow.endShape(CLOSE);
  return arrow;
  }



enum Direction {
  NORTH,
  EAST,
  SOUTH,
  WEST
};
Direction currentDirection = Direction.NORTH;

void rotateCompass() {
  switch (currentDirection) {
    case NORTH:
      //rotate(0);
      break;
    case EAST:
       rotate(Bdir *PI/2);
       
      break;
    case SOUTH:
      //rotate(PI);
      break;
    case WEST:
      rotate(Bdir *PI/2);


      break;
  }
}
