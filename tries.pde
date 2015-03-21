float scale = 1;

PGraphics full(int[] dims, int symmetry, int num, float size){
  return full(dims, symmetry, num, size * 30, size * 25, 2);
}

PGraphics full(int[] dims, int symmetry, int num, float l, float w){
  return full(dims, symmetry, num, l, w, 2);
}

PGraphics full(int[] dims, int symmetry, int num, float l, float w, float curvature){
  
   PGraphics canvas = setupBuffer(symmetry, dims);
   
   for(int i = 0; i < num; i++){
    float breadth = sin(PI / (symmetry * 2)) * max(dims[0], dims[1]) * 2;
    PVector pointone = new PVector((float) (Math.random() - .5) * breadth, (float) Math.random() * max(dims[1], dims[0]));
    PVector pointtwo = randomPoint(pointone, l);
    PVector[] anc = {pointone, pointtwo};
    PVector[] ctrls = rb2(anc, w, curvature);
    drawBezierShape(canvas, anc, ctrls);   
  }

  canvas.endDraw();
  return canvas;
}

void one(PGraphics canvas){
  PVector[] anchors = new PVector[2];
  PVector[] controls = new PVector[4];
  
  anchors[0] = new PVector(50 * scale, cy * scale / 3);
  anchors[1] = new PVector(-50 * scale, scale * cy/2);
  controls[0] = new PVector(0, -(-(cy/2) - 10) * scale);
  controls[1] = new PVector(0, -(-(cy/2) + 10) * scale);
  controls[2] = new PVector(0, -(-(cy/2) - 20) * scale);
  controls[3] = new PVector(0, -(-(cy/3) - 10) * scale);
  drawBezierShape(canvas, anchors, controls);

  
}

