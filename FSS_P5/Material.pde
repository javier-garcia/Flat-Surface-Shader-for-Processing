class Material{
  color ambient;
  color diffuse;
  color slave;
  
  Material(){
    ambient = #444444;
    diffuse = #FFFFFF;
  }
  
  Material(color Ambient, color Diffuse){
    ambient = Ambient;
    diffuse = Diffuse;
  }
}
