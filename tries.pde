

PGraphics full(int[] dims, int symmetry, float density, float l, float w, float curvature){
  
   PGraphics canvas = setupBuffer(symmetry, dims);
   
   float breadth = sin(PI / (symmetry * 2)) * max(dims[0], dims[1]) * 2;
   float num = density * breadth * max(dims[1], dims[0]);
   
   for(int i = 0; i < num; i++){

    PVector pointone = new PVector((float) (Math.random() - .5) * breadth, (float) Math.random() * max(dims[1], dims[0]));
    PVector pointtwo = randomPoint(pointone, l);
    PVector[] anc = {pointone, pointtwo};
    PVector[] ctrls = rb2(anc, w, curvature);
    drawBezierShape(canvas, anc, ctrls);   
  }

  canvas.endDraw();
  return canvas;
}


float scale = 1;
void one(PGraphics canvas){
  PVector[] anchors = new PVector[2];
  PVector[] controls = new PVector[4];
  
  anchors[0] = new PVector(50 * scale, dims[1] * scale / 3);
  anchors[1] = new PVector(-50 * scale, scale * dims[1]/2);
  controls[0] = new PVector(0, -(-(dims[1]/2) - 10) * scale);
  controls[1] = new PVector(0, -(-(dims[1]/2) + 10) * scale);
  controls[2] = new PVector(0, -(-(dims[1]/2) - 20) * scale);
  controls[3] = new PVector(0, -(-(dims[1]/3) - 10) * scale);
  drawBezierShape(canvas, anchors, controls);

  
}

