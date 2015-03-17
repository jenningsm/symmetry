
int sx = 700;
int sy = 700;
float cx = sx /2;
float cy = sy / 2;

int symmetry = 7;

void setup(){
 
  size(sx, sy);
  
  float maxDist = .5 * sqrt(sx * sx + sy * sy);
  int scale = 1;
  PGraphics radSegm = createGraphics(sx * scale, sy * scale); 
  radSegm.beginDraw();

//  radSegm.rotate((3 * PI / 4) - 2 * PI / (symmetry * 4)); 
  
  radSegm.rotate((PI / 2) + 2 * PI / (symmetry * 4)); 
 // radSegm.translate(cy /2, 0);
  
  radSegm.background(0);

  radSegm.noStroke();
  radSegm.fill(255);
  radSegm.beginShape();
  radSegm.vertex( - 50 * scale, -cy * scale / 3);
  radSegm.bezierVertex(0, (-(cy/2) - 10) * scale, 0, (-(cy/2) + 10) * scale, 50 * scale, -scale * cy/2);
  radSegm.bezierVertex(0, (-(cy/3) - 10) * scale, 0, (-(cy/2) - 20) * scale, - 50 * scale, -scale * cy /3);
  radSegm.endShape();
  
  radSegm.endDraw();
  
  //image(radSegm, 0, 0, sx, sy);
  
  PGraphics mirror = createGraphics(sx, sy);
  
  float divideTheta = (1 + symmetry * .00) * PI / symmetry;
  
  mirror.beginDraw();
  mirror.background(0);
  mirror.scale(1, -1);
  //rotate a little extra so that combine is just a little bit bigger and so therefore there won't be tiny little gaps when it gets tiled
  mirror.rotate(-1 * ((PI / symmetry) + divideTheta));
  mirror.image(radSegm, 0, 0);
  mirror.endDraw();  
  
  //image(mirror, 0, 0);
  
  PGraphics combine = createGraphics(sx, sy);
  combine.loadPixels();
  for(int i = 0; i < sx; i++){
    for(int j = 0; j< sy; j++){
      float theta = atan2(j, i);
      if (theta <= divideTheta){
        int r1 = (radSegm.pixels[i + sx * j] >> 16) & 0xFF;
        combine.pixels[i + sx * j] = color(255, r1); 
      } else {
        int r2 = (mirror.pixels[i + sx * j] >> 16) & 0xFF;
        combine.pixels[i + sx * j] = color(255, r2); 
      }
    } 
  }
  combine.updatePixels();

 // background(0);
 // image(combine, 0, 0);

  float hgt = maxDist * sin(2 * PI / symmetry);

  PGraphics fin = createGraphics(sx, sy);
  fin.beginDraw();

//  fin.blendMode(DARKEST);
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
