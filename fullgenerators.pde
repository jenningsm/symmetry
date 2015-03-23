
PGraphics randOne(int[] dims){
    int symmetry = 5 + floor(pow((float) Math.random(), 2) * 10);
    float l = random(7, 25);
    float w = random(7, 25);
    float curve = (float) Math.random() * 12;
    
    float density = pow(1.03, random(-1, 1) * 5) * 4.59 / (l * w); 
  
    PGraphics radSegm = full(dims, symmetry, density, l, w, curve);
  
    float offset = (symmetry % 2 == 0 ? 0 : -PI / (symmetry * 2));
    return createSymmetry(radSegm, dims,  symmetry, offset  );
}

PGraphics setOne(int[] dims){
  int symmetry = 7;
  PGraphics radSegm = full(dims, symmetry, .018, 15, 17, 6);
  float offset = (symmetry % 2 == 0 ? 0 : -PI / (symmetry * 2));
  return createSymmetry(radSegm, dims,  symmetry, offset  );
}
