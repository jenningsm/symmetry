

PGraphics populate(int[] dims, int symmetry, float density, float l, float w, float curvature){
  
   PGraphics canvas = setupBuffer(symmetry, dims);
   
   float breadth = sin(PI / (symmetry * 2)) * max(dims[0], dims[1]) * 2;
   int num = (int) Math.floor(density * breadth * max(dims[1], dims[0]));


   int branching = 20;
   int numLayers = (int) Math.ceil(Math.log(num) / Math.log(branching));
   int[] layers = new int[numLayers];
   int numPoints = 10;
   for(int i = 0; i < numLayers - 1; i++){
     layers[i] = numPoints;
     numPoints *= branching;
   }
   layers[numLayers-1] = num;

   PVector[] points = generatePoints(breadth, max(dims[0], dims[1]), layers, l * w);
   PVector[] anchors = new PVector[num * 2];

   for(int i = 0; i < num; i++){
    anchors[i*2] = points[i];
    anchors[i*2+1] = randomPoint(anchors[i*2], l);
  }
  
  for(int i = 0; i < num; i++){
    PVector[] anc = {anchors[i*2], anchors[i*2+1]};
    PVector[] ctrls = bezierControlPoints(anc, w, curvature);
    drawBezierShape(canvas, anc, ctrls);   
  }

  canvas.endDraw();
  return canvas;
}

PVector[] generatePoints(float breadth, float mHeight, int[] nums, float shapeArea){
 PVector[] emptyArray = {};
 return generatePoints(breadth, mHeight, nums, shapeArea,  nums.length, emptyArray); 
}

PVector[] generatePoints(float breadth, float mHeight, int[] nums, float shapeArea, int depth, PVector[] attractors){
  
  if(depth == 0){
    return attractors; 
  }
  
  int num = nums[nums.length - depth]; 
  PVector[] points = new PVector[num];
  for(int i = 0; i < num; i++){
    points[i] = new PVector((float) (Math.random() - .5) * breadth, (float) Math.random() * mHeight);
  }
  
  for(int i = 0; i < num; i++){
    float[] diffs = {0f, 0f};
    for(int j = 0; j < attractors.length; j++){
      float dist = (float) Math.sqrt((float) (Math.pow(points[i].x - attractors[j].x, 2) + Math.pow(points[i].y - attractors[j].y, 2)));
      float force = 1.5 / (dist * dist * attractors.length * shapeArea);
      force *= Math.pow(10, 9);
      force = min(force, dist);
      float dir = (float) Math.atan2(attractors[j].y - points[i].y, attractors[j].x - points[i].x);
      diffs[0] += cos(dir) * force;
      diffs[1] += sin(dir) * force;
    }
    points[i].x += diffs[0];
    points[i].y += diffs[1];
  }
  
  return generatePoints(breadth, mHeight, nums, shapeArea, depth - 1, points);
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

