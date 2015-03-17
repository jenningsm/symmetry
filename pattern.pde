
int sx = 700;
int sy = 700;
float cx = sx /2;
float cy = sy / 2;

int symmetry = 7;

void setup(){
 
  size(sx, sy);
  
  float maxDist = .5 * sqrt(sx * sx + sy * sy);
  float x = 1.2 * maxDist * sin(2 * PI / (symmetry * 4));
  float y = 1.2 * maxDist * cos(2 * PI / (symmetry * 4));
   
  PGraphics radSegm = createGraphics(sx, sy); 
  radSegm.beginDraw();
  radSegm.background(255);
   
  radSegm.rotate((PI / 2) + 2 * PI / (symmetry * 4)); 
   
  radSegm.fill(0);
  radSegm.noSmooth();
  radSegm.triangle(0, 0 , -x, - y, x, -y);
  radSegm.smooth();

  radSegm.noStroke();
  radSegm.fill(255);
  radSegm.beginShape();
  radSegm.vertex( - 50, -cy / 3);
  radSegm.bezierVertex(0, -(cy/2) - 10, 0, -(cy/2) + 10, 50, -cy/2);
  radSegm.bezierVertex(0, -(cy/3) - 10, 0, -(cy/2) - 20, - 50, -cy /3);
  radSegm.endShape();
  
  radSegm.endDraw();
  
 // image(radSegm, 0, 0);
  
  PGraphics mirror = createGraphics(sx, sy);
  
  mirror.beginDraw();
  mirror.rotate(2 * PI / symmetry);
  mirror.scale(1, -1);
  mirror.image(radSegm, 0, 0);
  mirror.endDraw();  
  
  PGraphics combine = createGraphics(sx, sy);
  combine.loadPixels();
  for(int i = 0; i < sx; i++){
    for(int j = 0; j< sy; j++){
      int r1 = (radSegm.pixels[i + sx * j] >> 16) & 0xFF;
      int r2 = (mirror.pixels[i + sx * j] >> 16) & 0xFF;
       if (r1 != 0 && r2 != 0){
         combine.pixels[i + sx * j] = color(255, Math.min(r1, r2)); 
       } else {
         combine.pixels[i + sx * j] = color(0, 0); 
       }
    } 
  }
  combine.updatePixels();

  float hgt = maxDist * sin(2 * PI / symmetry);
  //background(0);
//  image(combine, 0, 0);

  PGraphics fin = createGraphics(sx, sy);
  fin.beginDraw();

  fin.translate(cx, cy);
  fin.rotate(-2 * PI / 28);
  for(int i = 0; i < symmetry; i++){
    fin.pushMatrix();
    fin.rotate(i * 2 * PI / symmetry);
    fin.image(combine.get(0, 0, ceil(maxDist), ceil(hgt)), 0, 0);
    fin.popMatrix();
  }

  fin.endDraw();

  background(0);

  image(fin, 0, 0);

}
