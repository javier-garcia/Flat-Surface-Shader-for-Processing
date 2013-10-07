class Renderer{
  int _width;
  int _height;
  float _halfWidth;
  float _halfHeight;
  
  Renderer(){
    _width = 0;
    _height = 0;
    _halfWidth = 0;
    _halfHeight = 0;
  }
  
  public Renderer setSize(int Width, int Height){
    if(_width == Width && _height == Height) return this;
    
    _width = Width;
    _height = Height;
    _halfWidth = _width * 0.5;
    _halfHeight = _height * 0.5;
   
   return this; 
  }
  
  public Renderer clear(){
    background(255);
    return this;
  }
  
  public Renderer render(Scene scene){
    Mesh mesh;
    Triangle triangle;
    color Color;
    
    clear();
    
    for(int m = scene.meshes.size() - 1; m >= 0; m--){
      mesh = scene.meshes.get(m);
      
      translate(this._halfWidth, this._halfHeight);
      
      if(mesh.visible){
        mesh.update(scene.lights, true);
        
        for(int t = mesh.geometry.triangles.size() - 1; t >= 0; t--){
          triangle = mesh.geometry.triangles.get(t);
          
          beginShape();
          noStroke();
          fill(triangle._color);
          vertex(triangle.a.x, triangle.a.y);
          vertex(triangle.b.x, triangle.b.y);
          vertex(triangle.c.x, triangle.c.y);
          endShape(CLOSE);
          
          //renderTriangleHelpers(triangle);
          
        }
      }
    }
    
    //renderLight();
    
    return this;
  }
  
  private void renderTriangleHelpers(Triangle triangle){
    beginShape();
    fill(#ff0000);
    noStroke();
    ellipse(triangle.centroid.x, triangle.centroid.y, 4, 4);
    endShape();
    
    beginShape();
    fill(#ffffff);
    noStroke();
    ellipse(triangle.normal.x, triangle.normal.y, 8, 8);
    endShape();
  }
  
  private void renderLight(){
    fill(255);
    noStroke();
    ellipse(scene.lights.get(0).position.x, scene.lights.get(0).position.y, 5, 5);
  }
}
