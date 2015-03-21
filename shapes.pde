
PVector[] rb2(PVector[] anchors, float variability){
  return rb2(anchors, variability, 2);
}

PVector[] rb2(PVector[] anchors, float variability, float curvature){
  
  PVector[] controls = new PVector[4];
  
  float controlAng = (PI / 2) + ((float) Math.random() * PI / 2) - PI / 4;
  
  PVector vec = new PVector(anchors[1].x - anchors[0].x, anchors[1].y - anchors[0].y);
  PVector perp = new PVector(vec.x * cos(controlAng) - vec.y * sin(controlAng), vec.x * sin(controlAng) + vec.y * cos(controlAng));
  perp.normalize();
  
  for(int i = 0; i < 2; i++){
    float gap = (float) (.5 + .5 * Math.random()) * variability;
    float controlHeight = (float) (Math.random() - .5) * variability * curvature;
    float axis = (float) Math.random();
       
    for(int j = 0; j < 2; j++){
      float h = controlHeight + (gap * .5) * (j == 0 ? -1 : 1) * (i == 0 ? -1 : 1);
      controls[j*2 + i] = PVector.add(anchors[0], PVector.add(PVector.mult(perp, h), PVector.mult(vec, axis)));
    }  
  } 
  
  return controls;
}

PVector randomPoint(PVector point, float variability){
  float theta = random(2 * PI);
  float r = randomGaussian() * variability;
  return new PVector(point.x + r * cos(theta), point.y + r * sin(theta)); 
}



void drawBezierShape(PGraphics canvas, PVector[] anchors, PVector[] controls){
  drawBezierShape(canvas, anchors, controls, false);
}

void drawBezierShape(PGraphics canvas, PVector[] anchors, PVector[] controls, Boolean debug){
  canvas.beginShape();  
  canvas.vertex(anchors[0].x, anchors[0].y);
  canvas.bezierVertex(controls[0].x, controls[0].y, controls[1].x, controls[1].y, anchors[1].x, anchors[1].y);
  canvas.bezierVertex(controls[3].x, controls[3].y, controls[2].x, controls[2].y, anchors[0].x, anchors[0].y);
  canvas.endShape();  
  
  if(debug){
     for(int i = 0; i < 2; i++){
        canvas.fill(128);
        canvas.ellipse(anchors[i].x, anchors[i].y, 10, 10); 
      }
      for(int i = 0; i < 4; i++){
        canvas.fill(128, 0, 0);
        if(i >= 2){
          canvas.fill(0, 128, 0); 
        }
        canvas.ellipse(controls[i].x, controls[i].y, 10, 10); 
      } 
   }
}
