float scale = 1;

void full(PGraphics canvas, int[] dims, int num, float size){
   for(int i = 0; i < 1300; i++){
    PVector pointone = new PVector((float) (Math.random() - .5) * dims[0] * .5, (float) Math.random() * dims[1]);
    PVector pointtwo = randomPoint(pointone, 30 * size);
    PVector[] anc = {pointone, pointtwo};
    PVector[] ctrls = rb2(anc, 25 * size);
    drawBezierShape(canvas, anc, ctrls);   
  }
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

void two(PGraphics canvas){
    for(int i = 0; i < 20  ; i++){
    PVector[][] points = rb(new PVector(0, (i+1) * 20), 50);
    drawBezierShape(canvas, points[0], points[1]);
  }
}

void rb2test(PGraphics canvas){
  PVector[] as = { new PVector(0, 200), new PVector(0, 300) };
  PVector[] cs = rb2(as, 150);
  drawBezierShape(canvas, as, cs, true);
}
