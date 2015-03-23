
int[] dims = {900, 900};
//int[] dims = {851, 315};

PGraphics s;

void mouseClicked(){
//  s.save("textures/out###.png"); 
  saveFrame("greys/rands/out###.png");
}

int count = 0;

void draw() {
  
  PGraphics s = randOne(dims);
  
  background(110);
  image(s, 0, 0);
  saveFrame("greys/rands/out###.tiff");
  if(count >= 15){
    exit(); 
  }
  
  println(count);
  count++;

};

void setup(){
 
  size(dims[0], dims[1]);
  
}








