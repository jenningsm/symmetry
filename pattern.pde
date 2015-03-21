
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
  saveFrame("greys/smalls/out###.png");
}

void draw() {};

void setup(){
 
  size(dims[0], dims[1]);
  
//  full(dims, symmetry, 1300, 1.1);
//  full(dims, symmetry, 1300, 1.7);
//  PGraphics radSegm = setupBuffer(symmetry, dims);
//  one(radSegm);

  //smalls
  
  PGraphics radSegm = full(dims, symmetry, 8000, 15, 17, 6);
 //   full(dims, symmetry, 12000, 30, 3);

  //lines
//  full(dims, symmetry, 18000, 45, 3);

  //texture
 // radSegm.fill(255, 230);
 // full(dims, symmetry, 13000, 45, 3);


  s = createSymmetry(radSegm, dims,  symmetry, -PI / (symmetry * 2)  );
  
  background(110);
//  image(radSegm, 0, 0);
  image(s, 0, 0);

}








