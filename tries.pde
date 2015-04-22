

PGraphics populate(int[] dims, int symmetry, float density, float l, float w, float curvature){
  
   PGraphics canvas = setupBuffer(symmetry, dims);
   
   float breadth = sin(PI / (symmetry * 2)) * max(dims[0], dims[1]) * 2;
   int num = (int) Math.floor(density * breadth * max(dims[1], dims[0]));

    PVector[] anchors = new PVector[num * 2];

   for(int i = 0; i < num; i++){
    anchors[i*2] = new PVector((float) (Math.random() - .5) * breadth, (float) Math.random() * max(dims[1], dims[0]));
    anchors[i*2+1] = randomPoint(anchors[i*2], l);
  }
  
  int numAttractors = 200;
  PVector[] attractors = new PVector[numAttractors];
  for(int i = 0; i < numAttractors; i++){
    attractors[i] = new PVector((float) (Math.random() - .5) * breadth, (float) Math.random() * max(dims[1], dims[0]));
  }
  
  for(int i = 0; i < num; i++){
    float[] diffs = {0f, 0f};
    PVector average = new PVector((anchors[i*2].x + anchors[i*2+1].x)/2, (anchors[i*2].y + anchors[i*2+1].y)/2);
    for(int j = 0; j < attractors.length; j++){
      float dist = (float) Math.sqrt((float) (Math.pow(average.x - attractors[j].x, 2) + Math.pow(average.y - attractors[j].y, 2)));
      float force = Math.min(dist, 2000 / (dist * dist));
      float dir = (float) Math.atan2(attractors[j].y - average.y, attractors[j].x - average.x);
      diffs[0] += cos(dir) * force;
      diffs[1] += sin(dir) * force;
    }
    anchors[i*2].x += diffs[0];
    anchors[i*2].y += diffs[1];
    anchors[i*2+1].x += diffs[0];
    anchors[i*2+1].y += diffs[1];
  }
  
  for(int i = 0; i < num; i++){
    PVector[] anc = {anchors[i*2], anchors[i*2+1]};
    PVector[] ctrls = bezierControlPoints(anc, w, curvature);
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

