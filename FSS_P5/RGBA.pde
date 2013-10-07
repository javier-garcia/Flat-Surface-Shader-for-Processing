class RGBA{  
  /*color multiplyVectors(color rgba1, color rgba2){   
    color result = color(
      red(rgba1) * red(rgba2), 
      green(rgba1) * green(rgba2),
      blue(rgba1) * blue(rgba2),
      alpha(rgba1) * alpha(rgba2)
    );
    
    return result;
  }*/
  
  color multiplyScalar(color source, float s){
    color result = color(
      red(source) * s, 
      green(source) * s,
      blue(source) * s,
      alpha(source) * s
    );
    
    return result;
  }
  
  /*color add(color source, color rgba){
    color result = color(
      red(source) + red(rgba), 
      green(source) + green(rgba),
      blue(source) + blue(rgba),
      alpha(source) + alpha(rgba)
    );
    
    return result;
  }
  
  color clamp(color source, int min, int max){
    color result = setMin(source, min);
    result = setMax(result, min);
    
    return result;
  }
  
  color setMin(color source, int value){
    color result = color(
      max(red(source), value),
      max(green(source), value),
      max(blue(source), value),
      max(alpha(source), value)
    );
    
    return result;
  }
  
  color setMax(color source, int value){
    color result = color(
      min(red(source), value),
      min(green(source), value),
      min(blue(source), value),
      min(alpha(source), value)
    );
    
    return result;
  }*/
}
