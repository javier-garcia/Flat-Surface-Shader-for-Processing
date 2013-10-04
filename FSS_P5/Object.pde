class Object{
  PVector position;
  
  Object(){
    position = new PVector();  
  }
  
  public Object setPosition(PVector Position){
    position = Position;
    
    return this;
  }
}
