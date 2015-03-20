
int sx = 700;
int sy = 700;
int[] dims = {700, 700};
int cx = sx /2;
int cy = sy / 2;

int symmetry = 7;

void mouseClicked(){
  saveFrame("out###.png"); 
}

void draw() {};

void setup(){
 
  size(sx, sy);
  
  PGraphics radSegm = createGraphics(floor(dims[0] * .7), floor(dims[0] * .7)); 
  
  radSegm.beginDraw();  
  radSegm.rotate(- (PI / 4)  - 2 * PI / (symmetry * 4)); 
  radSegm.noStroke();
  radSegm.fill(255);
  
  full(radSegm, dims);

  radSegm.endDraw();
  background(0);

  //image(radSegm, 0, 0);
  PGraphics s = createSymmetry(radSegm, dims,  symmetry, -PI / (symmetry * 2)  );
  
  image(s, 0, 0);

}








