
int[] dims = {900, 900};
//int[] dims = {851, 315};

PGraphics s;

void mouseClicked(){
//  s.save("textures/out###.png"); 
  saveFrame("greys/rands/out###.png");
}

void draw() {};

void setup(){
 
  size(dims[0], dims[1]);
  
//  full(dims, symmetry, 1300, 1.1);
//  full(dims, symmetry, 1300, 1.7);
//  PGraphics radSegm = setupBuffer(symmetry, dims);
//  one(radSegm);

  int symmetry = 5 + floor(pow((float) Math.random(), 2) * 10);
  float l = random(.2, 1) * 25;
  float w = random(.2, 1) * 25;
  float curve = (float) Math.random() * 10;
  
  float density = pow(1.1, random(-1, 1) * 2.5) * 5 / (l * w);
  PGraphics radSegm = full(dims, symmetry, density, l, w, curve);


  //smalls  
 // int symmetry = 7;
 // PGraphics radSegm = full(dims, symmetry, .018, 15, 17, 6);
 //   full(dims, symmetry, 12000, 30, 3);

  //lines
//  full(dims, symmetry, 18000, 45, 3);

  //texture
 // radSegm.fill(255, 230);
 // full(dims, symmetry, 13000, 45, 3);

  float offset = (symmetry % 2 == 0 ? 0 : -PI / (symmetry * 2));
  s = createSymmetry(radSegm, dims,  symmetry, offset  );
  
  background(110);
  image(s, 0, 0);

}








