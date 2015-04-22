
PGraphics generator(int[] dims){
    int symmetry;
    if(random(1) < .2){
      symmetry = 7 - floor(pow((float) Math.random(), 1.5) * 3);
    } else {
      symmetry = 7 + floor(pow((float) Math.random(), 1.9) * 8);
    }
    
    float areaMin = 200;
    float areaMax = 300;
    float area = random(areaMin, areaMax);
    
    float len = area / (7 + random(0, (area / 7) - 7));
    float wid = area / len;
    if(wid > len){
      float hold = wid;
      wid = len;
      len = hold; 
    }
    
    float curve = (float) Math.random() * 12;
    float density = pow(1.03, random(-1, 1) * 1.5) * 4.19 / area;
  
    PGraphics radSegm = populate(dims, symmetry, density, len, wid, curve);

    float offset = (symmetry % 2 == 0 ? 0 : -PI / (symmetry * 2));
    return createSymmetry(radSegm, dims,  symmetry, offset  );
}

PGraphics setOne(int[] dims){
  int symmetry = 7;
  PGraphics radSegm = populate(dims, symmetry, .018, 15, 17, 6);
  float offset = (symmetry % 2 == 0 ? 0 : -PI / (symmetry * 2));
  return createSymmetry(radSegm, dims,  symmetry, offset  );
}
