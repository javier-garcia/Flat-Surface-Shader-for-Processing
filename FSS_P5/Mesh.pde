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
          
          light.ray = PVector.sub(light.position, triangle.centroid);
          light.ray.normalize();
          float illuminance = PVector.dot(triangle.normal, light.ray);
          if(side == FSS.FRONT){
            illuminance = max(illuminance, 0);
          } else if(side == FSS.BACK){
            illuminance = abs(min(illuminance, 0));
          } else if(side == FSS.DOUBLE){
            illuminance = max(abs(illuminance), 0);
          }
          
          material.slave = blendColor(material.ambient, light.ambient, MULTIPLY);
          triangle._color = blendColor(triangle._color, material.slave, ADD);
          
          material.slave = blendColor(material.diffuse, light.diffuse, MULTIPLY);
          //material.slave = blendColor(material.slave, color(illuminance, illuminance, illuminance, illuminance), MULTIPLY);
          material.slave = rgba.multiplyScalar(material.slave, illuminance);
          triangle._color = blendColor(triangle._color, material.slave, ADD);
        }
        
        //triangle._color = rgba.clamp(triangle._color, 0, 1);
      }
    }
    
    return this;
  }
}
