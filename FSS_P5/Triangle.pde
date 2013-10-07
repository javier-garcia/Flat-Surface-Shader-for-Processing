class Triangle{
  PVector a, b, c, u, v;
  PVector centroid;
  PVector[] vertices;
  PVector normal;
  color _color;
  
  Triangle(){    
    init(new PVector(), new PVector(), new PVector());
  }
  
  Triangle(PVector A, PVector B, PVector C){    
    init(A, B, C);
  }
  
  private void init(PVector A, PVector B, PVector C){
    a = A;
    b = B;
    c = C;
    
    u = new PVector();
    v = new PVector();
    
    vertices = new PVector[]{a, b, c};
    
    computeCentroid();
    computeNormal();
  }
  
  public Triangle computeCentroid(){
    centroid = new PVector();
    centroid.x = (a.x + b.x + c.x) / 3;
    centroid.y = (a.y + b.y + c.y) / 3;
    centroid.z = (a.z + b.z + c.z) / 3;
    
    return this;
  }
  
  public Triangle computeNormal(){
    u = PVector.sub(b, a);
    v = PVector.sub(c, a);
    normal = PVector.cross(u, v, normal);
    normal.normalize();
    
    return this;
  }
}
