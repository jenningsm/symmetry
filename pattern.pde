
int sx = 700;
int sy = 700;
int cx = sx /2;
int cy = sy / 2;

int symmetry = 7;

void setup(){
 
  size(sx, sy);
  
  int scale = 1;
  PGraphics radSegm = createGraphics(floor(sx * scale * .5), floor(sy * scale * .5)); 
  
  radSegm.beginDraw();
  
  radSegm.rotate((3 * PI / 4) - 2 * PI / (symmetry * 4)); 

  radSegm.noStroke();
  radSegm.fill(255);
  radSegm.beginShape();
  
  radSegm.vertex( - 50 * scale, -cy * scale / 3);
  radSegm.bezierVertex(0, (-(cy/2) - 10) * scale, 0, (-(cy/2) + 10) * scale, 50 * scale, -scale * cy/2);
  radSegm.bezierVertex(0, (-(cy/3) - 10) * scale, 0, (-(cy/2) - 20) * scale, - 50 * scale, -scale * cy /3);

  radSegm.endShape();  
  radSegm.endDraw();
  
  PGraphics s = createSymmetry(radSegm, symmetry, -PI / (symmetry * 2));
  
  background(0);
  image(s, 0, 0);
}
