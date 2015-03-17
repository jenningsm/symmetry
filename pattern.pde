
int sx = 700;
int sy = 700;
int cx = sx /2;
int cy = sy / 2;

int symmetry = 7;

void setup(){
 
  size(sx, sy);
  
  float maxDist = .5 * sqrt(sx * sx + sy * sy);
  int scale = 1;
  PGraphics radSegm = createGraphics(sx * scale, sy * scale); 
  radSegm.beginDraw();
  
  radSegm.rotate((PI / 2) + 2 * PI / (symmetry * 4)); 
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
  
  
  mirror.beginDraw();
  mirror.background(0);
  mirror.scale(1, -1);
  mirror.rotate(-1 * (2 * PI / symmetry));
  mirror.image(radSegm, 0, 0);
  mirror.endDraw();  
  
  //image(mirror, 0, 0);
  
  PGraphics combine = createGraphics(sx, sy);
  combine.loadPixels();
  for(int i = 0; i < sx; i++){
    for(int j = 0; j< sy; j++){
      float theta = atan2(j, i);
      if (theta <= PI / symmetry){
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

  float baseAng = - PI / (2 * symmetry);
  fin.translate(cx, cy);
  fin.rotate(baseAng);
  for(int i = 0; i < symmetry; i++){
    fin.pushMatrix();
    fin.rotate(i * 2 * PI / symmetry);
    fin.image(combine.get(0, 0, ceil(maxDist), ceil(hgt)), 0, 0);
    fin.popMatrix();
  }

  fin.endDraw();
  
  fin.loadPixels();
  combine.loadPixels();

  for(int i = 0; i < sx; i++){
    for(int j= 0; j< sy; j++){
      float theta = atan2(j - cy + .5, i - cx + .5);
      theta += 2 * PI;
      theta -= baseAng;
      float diff = Math.min(theta % (2 * PI / symmetry), (2 * PI / symmetry) - (theta % (2 * PI / symmetry)));
      if(diff < .007){
        float r = sqrt(pow(i - cx + .5, 2) + pow(j - cy + .5, 2));
        int a = (combine.pixels[floor(r)] >> 24) & 0xFF;
        int a2 = (fin.pixels[i + sx * j] >> 24) & 0xFF;
        fin.pixels[i + sx * j] = color(255, Math.max(a, a2));
      }
    } 
  }
  
  fin.updatePixels();

  background(0);
  image(fin, 0, 0);

}
