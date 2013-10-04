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
    
    centroid = new PVector();
    normal = new PVector();
    
    computeCentroid();
    computeNormal();
  }
  
  public Triangle computeCentroid(){
    centroid = new PVector();
    centroid.x = a.x + b.x + c.x;
    centroid.y = a.y + b.y + c.y;
    centroid.z = a.z + b.z + c.z;
    
    PVector.div(centroid, 3);
    
    return this;
  }
  
  public Triangle computeNormal(){
    u = PVector.sub(b, a);
    v = PVector.sub(c, a);
    PVector.cross(u, v, normal);
    normal.normalize();
    
    return this;
  }
}
