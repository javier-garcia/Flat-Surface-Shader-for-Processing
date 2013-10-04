class Light extends Object{
  color ambient;
  color diffuse;
  PVector ray;
  
  Light(){
    init(#FFFFFF, #FFFFFF);
  }
  
  Light(color Ambient, color Diffuse){
    init(Ambient, Diffuse);
  }
  
  void init(color Ambient, color Diffuse){
    ambient = Ambient;
    diffuse = Diffuse;
    ray = new PVector();
  }
}
