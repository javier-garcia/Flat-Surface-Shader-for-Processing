class Mesh{
  Geometry geometry;
  Material material;
  int side;
  boolean visible;
  
  Mesh(){
    init(new Geometry(), new Material());
  }
  
  Mesh(Geometry geometry, Material material){
    init(geometry, material);
  }
  
  private void init(Geometry geometry, Material material){
    this.geometry = geometry;
    this.material = material;
    side = FSS.FRONT;
    visible = true;
  }
  
  public Mesh update(ArrayList<Light> lights, boolean calculate){
    geometry.update();
    Triangle triangle;
    Light light;
    
    if(calculate){
      for(int t = geometry.triangles.size() - 1; t >= 0; t--){
        triangle = this.geometry.triangles.get(t);
        
        //Reset Triangle Color
        triangle._color = color(0, 0, 0, 0);
        
        for(int l = lights.size() - 1; l >= 0; l--){
          light = lights.get(l);
          
          PVector.sub(light.position, triangle.centroid, light.ray);
          light.ray.normalize();
          float illuminance = PVector.dot(triangle.normal, light.ray);
          if(side == FSS.FRONT){
            illuminance = max(illuminance, 0);
          } else if(side == FSS.BACK){
            illuminance = abs(min(illuminance, 0));
          } else if(side == FSS.DOUBLE){
            illuminance = max(abs(illuminance), 0);
          }
          
          rgba.multiplyVectors(material.slave, material.ambient, light.ambient);
          rgba.add(triangle._color, material.slave);
          
          rgba.multiplyVectors(material.slave, material.diffuse, light.diffuse);
          rgba.multiplyScalar(material.slave, illuminance);
          rgba.add(triangle._color, material.slave);
        }
        
        rgba.clamp(triangle._color, 0, 1);
      }
    }
    
    return this;
  }
}
