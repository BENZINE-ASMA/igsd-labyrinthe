PImage boussole; 


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
