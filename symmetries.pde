
PGraphics createSymmetry(PGraphics source, int[] dims, int symmetry, float offset){
  

  PGraphics mirror = createGraphics(source.width, source.height);
    
  mirror.beginDraw();
  mirror.scale(-1, 1);
  mirror.rotate(PI / 2);
  mirror.image(source, 0, 0);
  mirror.endDraw();  
  
  PGraphics combine = createGraphics(source.width, source.height);
  combine.loadPixels();
  for(int i = 0; i < source.width; i++){
    for(int j = 0; j< source.height; j++){
      float theta = atan2(j, i);
      if (theta <= PI / 4){
        combine.pixels[i + source.width * j] = source.pixels[i + source.width * j];
      } else {
        combine.pixels[i + source.width * j] = mirror.pixels[i + source.width * j];
      }
    } 
  }
  combine.updatePixels();

  PGraphics fin = createGraphics(dims[0], dims[1]);
  PGraphics buffer = createGraphics(dims[0], dims[1]);
  fin.loadPixels();
  
  
  for(int i = 0; i < symmetry; i++){
     buffer.beginDraw();
     buffer.background(0, 0);
     buffer.translate(dims[0] * .5, dims[1] * .5);
     buffer.rotate( offset - ((PI / 4) - PI / symmetry) + i * 2 * PI / symmetry);
     buffer.image(combine, 0, 0);
     buffer.endDraw();
     
     buffer.loadPixels();
     for(int j = 0; j < dims[0]; j++){
       for(int k = 0; k < dims[1]; k++){
         float theta = atan2(k - (dims[1] * .5) + .5, j - (dims[0] * .5) + .5);
         theta += 2 * PI;
         theta = theta % (2 * PI);
         float baseAng = offset + i * 2 * PI / symmetry;
         if((theta >= baseAng && theta <= baseAng + 2 * PI / symmetry) ||
            (theta >= baseAng + 2 * PI && theta < baseAng + 2 * PI  + 2 * PI / symmetry)){
              
           fin.pixels[j + dims[0] * k] = buffer.pixels[j + dims[0] * k];
         }
       } 
     }
  }

  fin.updatePixels();
 
  return fin; 
}
 
