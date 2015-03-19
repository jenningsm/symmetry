
int sx = 700;
int sy = 700;
int cx = sx /2;
int cy = sy / 2;

int symmetry = 7;

void mouseClicked(){
  saveFrame("out###.png"); 
}

void draw() {};

void setup(){
 
  size(sx, sy);
  
  float scale = 1;
  PGraphics radSegm = createGraphics(floor(sx * scale * .5), floor(sy * scale * .5)); 
  
  radSegm.beginDraw();
  
  radSegm.rotate(- (PI / 4)  - 2 * PI / (symmetry * 4)); 

  radSegm.noStroke();
  radSegm.fill(255);
    
  PVector[] anchors = new PVector[2];
  PVector[] controls = new PVector[4];
  
  anchors[0] = new PVector(50 * scale, cy * scale / 3);
  anchors[1] = new PVector(-50 * scale, scale * cy/2);
  controls[0] = new PVector(0, -(-(cy/2) - 10) * scale);
  controls[1] = new PVector(0, -(-(cy/2) + 10) * scale);
  controls[2] = new PVector(0, -(-(cy/2) - 20) * scale);
  controls[3] = new PVector(0, -(-(cy/3) - 10) * scale);
//  drawBezierShape(radSegm, anchors, controls);
/*
  scale = 1.03;
  radSegm.beginShape();  
  radSegm.vertex( 0, -cy * scale * .48);
  radSegm.bezierVertex(20, (-(cy/2) - 30) * scale, 30, (-(cy/2) + 20) * scale, 70 * scale, -scale * cy * .67);
  radSegm.bezierVertex(30, (-(cy/3) - 30) * scale, 30, (-(cy/2) - 10) * scale, 0, -scale * cy  * .48); 
  radSegm.endShape(); */
  
  for(int i = 0; i < 15; i++){
    PVector[][] points = rb(new PVector(0, (i+1) * 30), 50);
    drawBezierShape(radSegm, points[0], points[1]);
  }
 
  radSegm.endDraw();
 // background(0);
 // image(radSegm, 0, 0);
  PGraphics s = createSymmetry(radSegm, symmetry, -PI / (symmetry * 2)  );
  
  background(0);
  image(s, 0, 0);

}

void drawBezierShape(PGraphics canvas, PVector[] anchors, PVector[] controls){
  canvas.beginShape();  
  canvas.vertex(anchors[0].x, anchors[0].y);
  canvas.bezierVertex(controls[0].x, controls[0].y, controls[1].x, controls[1].y, anchors[1].x, anchors[1].y);
  canvas.bezierVertex(controls[3].x, controls[3].y, controls[2].x, controls[2].y, anchors[0].x, anchors[0].y);
  canvas.endShape();  
}

PVector[][] rb(PVector point, float variability){
   PVector[] anchors = { new PVector(point.x - abs(randomGaussian()) * variability, point.y), new PVector(point.x + abs(randomGaussian()) * variability, point.y ) };
   
   PVector[] controls = new PVector[4];
   
   float[] vars = { randomGaussian() * .4, randomGaussian() * .4};
   for(int i = 0; i < 2; i++){
      controls[i*2] = new PVector(point.x, point.y + variability * vars[0] + variability * (i  - .5) * .25);
      controls[i*2+1] = new PVector(point.x, point.y + variability * vars[1]  + variability * (i - .5) * .25);
   }
   
   PVector[][] ret = {anchors, controls};
   return ret;
}

PVector[][] randomBezierShape(PVector point, float variability){
   PVector[] anchors = new PVector[2];
   PVector[] controls = new PVector[4];
   PVector[][] ret = { anchors, controls};
   
   for(int i = 0; i < 2; i++){
     for(int j = 0; j < ret[i].length; j += 2){
       float v = variability / 2;
       ret[i][j] = randomPoint(new PVector(point.x - v, point.y), variability); 
       ret[i][j+1] = randomPoint(new PVector(point.x + v, point.y), variability); 
     }
   }
   return ret;
}

PVector randomPoint(PVector point, float variability){
  float theta = random(2 * PI);
  float r = randomGaussian() * variability;
  return new PVector(point.x + r * cos(theta), point.y + r * sin(theta)); 
}


