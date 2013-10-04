class RGBA{
  void multiplyVectors(color target, color rgba1, color rgba2){
    target = color(
      red(rgba1) * red(rgba2), 
      green(rgba1) * green(rgba2),
      blue(rgba1) * blue(rgba2),
      alpha(rgba1) * alpha(rgba2)
    );
  }
  
  void multiplyScalar(color target, float s){
    target = color(
      red(target) * s, 
      green(target) * s,
      blue(target) * s,
      alpha(target) * s
    );
  }
  
  void add(color target, color rgba){
    target = color(
      red(target) + red(rgba), 
      green(target) + green(rgba),
      blue(target) + blue(rgba),
      alpha(target) + alpha(rgba)
    );
  }
  
  void clamp(color target, int min, int max){
    setMin(target, min);
    setMax(target, min);
  }
  
  void setMin(color target, int value){
    target = color(
      max(red(target), value),
      max(green(target), value),
      max(blue(target), value),
      max(alpha(target), value)
    );
  }
  
  void setMax(color target, int value){
    target = color(
      min(red(target), value),
      min(green(target), value),
      min(blue(target), value),
      min(alpha(target), value)
    );
  }
}
