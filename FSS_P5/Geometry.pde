class Geometry{
  PVector[][] vertices;
  ArrayList<Triangle> triangles;
  boolean dirty;
  
  Geometry(){
    
    triangles = new ArrayList<Triangle>();
    dirty = false;
  }
  
  Geometry update(){
    if(dirty){
      Triangle triangle;
      for(int t = triangles.size() - 1; t >= 0; t--){
        triangle = triangles.get(t);
        triangle.computeCentroid();
        triangle.computeNormal();
      }
    }
    
    return this;
  }
}
