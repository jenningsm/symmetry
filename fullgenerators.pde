
PGraphics randOne(int[] dims){
    int symmetry = 5 + floor(pow((float) Math.random(), 2) * 10);
    
    float areaMin = 150;
    float areaMax = 300;
    float area = random(areaMin, areaMax);
    
    float l = area / (7 + random(0, (area / 7) - 7));
    float w = area / l;
    if(w > l){
      float hold = w;
      w = l;
      l = hold; 
    }
    
    float curve = (float) Math.random() * 12;
    float density = 4.19 / (l * w);
  
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
