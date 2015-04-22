
int[] dims = {900, 900};

int count = 0;

void draw() {
  
  PGraphics s = generator(dims);
  
  background(110);
  image(s, 0, 0);
  saveFrame("greys/rands/out###.png");
  if(count >= 15){
    exit(); 
  }
  
  println(count);
  count++;

};

void setup(){
 
  size(dims[0], dims[1]);
    PGraphics s = generator(dims);
  
  background(110);
  image(s, 0, 0);
  noLoop();
  
}








