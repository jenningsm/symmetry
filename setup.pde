
PGraphics setupBuffer(int symmetry, int[] dims){
  int d = floor(max(dims[0] * .7, dims[1] * .7));
  PGraphics radSegm = createGraphics(d, d); 
  
  radSegm.beginDraw();  
  radSegm.rotate(- (PI / 4)  - 2 * PI / (symmetry * 4)); 
  radSegm.noStroke();
  radSegm.fill(255);
  

  return radSegm;
}
