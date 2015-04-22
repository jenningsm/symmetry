void drawBezierShape(PGraphics canvas, PVector[] anchors, PVector[] controls){
  drawBezierShape(canvas, anchors, controls, false);
}

void drawBezierShape(PGraphics canvas, PVector[] anchors, PVector[] controls, Boolean debug){
  canvas.fill(255);
  canvas.beginShape();  
  canvas.vertex(anchors[0].x, anchors[0].y);
  canvas.bezierVertex(controls[0].x, controls[0].y, controls[1].x, controls[1].y, anchors[1].x, anchors[1].y);
  canvas.bezierVertex(controls[3].x, controls[3].y, controls[2].x, controls[2].y, anchors[0].x, anchors[0].y);
  canvas.endShape();  
  
  if(debug){
     for(int i = 0; i < 2; i++){
        canvas.fill(128);
        canvas.ellipse(anchors[i].x, anchors[i].y, 10, 10); 
      }
      for(int i = 0; i < 4; i++){
        canvas.fill(128, 0, 0);
        if(i >= 2){
          canvas.fill(0, 128, 0); 
        }
        canvas.ellipse(controls[i].x, controls[i].y, 10, 10); 
      } 
   }
}
