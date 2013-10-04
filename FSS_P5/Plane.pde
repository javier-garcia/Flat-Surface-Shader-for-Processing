class Plane extends Geometry{
  int _width, _height;
  int segments, slices;
  int segmentWidth;
  int sliceHeight;
  
  Plane(){
    init(100, 100, 4, 4);
  }
  
  Plane(int Width, int Height, int Segments, int Slices){
    init(Width, Height, Segments, Slices);
  }
  
  private void init(int Width, int Height, int Segments, int Slices){
    _width = Width;
    _height = Height;
    segments = Segments;
    slices = Slices;
    segmentWidth = _width / segments;
    sliceHeight = _height / slices;
    
    int x, y; 
    PVector v0, v1, v2, v3;
    float offsetX = _width * -0.5;
    float offsetY = _height * 0.5;
    PVector vertex;
    Triangle t0, t1;
    
    //Add Vertices
    vertices = new PVector[segments + 1][slices + 1];
    for(x = 0; x <= segments; x++){
      for(y = 0; y <= slices; y++){
        vertex = new PVector(offsetX + x * segmentWidth, offsetY - y * sliceHeight);
        vertices[x][y] = vertex;
      }
    }
    
    triangles = new ArrayList<Triangle>();
    
    for(x = 0; x < segments; x++){
      for(y = 0; y < slices; y++){
        v0 = vertices[x + 0][y + 0];
        v1 = vertices[x + 0][y + 1];
        v2 = vertices[x + 1][y + 0];
        v3 = vertices[x + 1][y + 1];
        t0 = new Triangle(v0, v1, v2);
        t1 = new Triangle(v2, v1, v3);
        triangles.add(t0);
        triangles.add(t1);
      }
    }
  }
}
