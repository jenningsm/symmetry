
int sx = 700;
int sy = 700;
int[] dims = {900, 900};
//int[] dims = {851, 315};
int cx = sx /2;
int cy = sy / 2;

int symmetry = 7;

PGraphics s;

void mouseClicked(){
//  s.save("textures/out###.png"); 
  saveFrame("textures/out###.png");
}

void draw() {};

void setup(){
 
  size(dims[0], dims[1]);
  
  int d = floor(max(dims[0] * .7, dims[1] * .7));
  PGraphics radSegm = createGraphics(d, d); 
  
  radSegm.beginDraw();  
  radSegm.rotate(- (PI / 4)  - 2 * PI / (symmetry * 4)); 
  radSegm.noStroke();
  radSegm.fill(255);
  
//  full(radSegm, dims, symmetry, 1300, 1.1);
//  full(radSegm, dims, symmetry, 1300, 1.7);
//  one(radSegm);

  //smalls
//  full(radSegm, dims, symmetry, 10000, 15, 17);

  //lines
//  radSegm.fill(150, 150, 80, 200);
//  full(radSegm, dims, symmetry, 18000, 45, 3);

  //texture
  radSegm.fill(255, 120);
  full(radSegm, dims, symmetry, 40000, 45, 3);


  radSegm.endDraw();
  background(140);
//  background(160, 160, 110);



  s = createSymmetry(radSegm, dims,  symmetry, -PI / (symmetry * 2)  );
  
//  image(radSegm, 0, 0);
  image(s, 0, 0);

}








