
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
  
  radSegm.rotate((3 * PI / 4) - 2 * PI / (symmetry * 4)); 

  radSegm.noStroke();
  radSegm.fill(255);
  radSegm.beginShape();
  radSegm.vertex( - 50 * scale, -cy * scale / 3);
  radSegm.bezierVertex(0, (-(cy/2) - 10) * scale, 0, (-(cy/2) + 10) * scale, 50 * scale, -scale * cy/2);
  radSegm.bezierVertex(0, (-(cy/3) - 10) * scale, 0, (-(cy/2) - 20) * scale, - 50 * scale, -scale * cy /3);
  radSegm.endShape();
  
  radSegm.endDraw();
  
//  image(radSegm, 0, 0, sx, sy);
  
  PGraphics mirror = createGraphics(sx, sy);
  
  
  mirror.beginDraw();
  mirror.scale(-1, 1);
  mirror.rotate(PI / 2);
  mirror.image(radSegm, 0, 0);
  mirror.endDraw();  
  
 // image(mirror, 0, 0);
  
  PGraphics combine = createGraphics(sx, sy);
  combine.loadPixels();
  for(int i = 0; i < sx; i++){
    for(int j = 0; j< sy; j++){
      float theta = atan2(j, i);
      if (theta <= PI / 4){
        combine.pixels[i + sx * j] = radSegm.pixels[i + sx * j];
      } else {
        combine.pixels[i + sx * j] = mirror.pixels[i + sx * j];
      }
    } 
  }
  combine.updatePixels();

  PGraphics fin = createGraphics(sx, sy);
  PGraphics buffer = createGraphics(sx, sy);
  fin.loadPixels();

  float offsetAng = - PI / (2 * symmetry);
  for(int i = 0; i < symmetry; i++){
     buffer.beginDraw();
     buffer.background(0, 0);
     buffer.translate(cx, cy);
     buffer.rotate(offsetAng - ((PI / 4) - PI / symmetry) + i * 2 * PI / symmetry);
     buffer.image(combine, 0, 0);
     buffer.endDraw();
     
     buffer.loadPixels();
     for(int j = 0; j < sx; j++){
       for(int k = 0; k < sy; k++){
         float theta = atan2(k - cy + .5, j - cx + .5);
         theta += 2 * PI;
         theta = theta % (2 * PI);
         float baseAng = offsetAng + i * 2 * PI / symmetry;
         if((theta >= baseAng && theta <= baseAng + 2 * PI / symmetry) ||
            (theta >= baseAng + 2 * PI && theta < baseAng + 2 * PI  + 2 * PI / symmetry)){
              
           fin.pixels[j + sx * k] = buffer.pixels[j + sx * k];
         }
       } 
     }
  }

  fin.updatePixels();
  
    background(0);
  image(fin, 0, 0);
  
}
