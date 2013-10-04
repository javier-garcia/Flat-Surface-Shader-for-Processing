class Scene{
  ArrayList<Mesh> meshes;
  ArrayList<Light> lights;
  
  Scene(){
    meshes = new ArrayList<Mesh>();
    lights = new ArrayList<Light>();
  }
  
  public Scene add(Mesh Object){
    meshes.add(Object);
    return this;
  }
  
  public Scene remove(Mesh Object){
    meshes.remove(Object);
    return this;
  }
  
  public Scene add(Light Object){
    lights.add(Object);
    return this;
  }
  
  public Scene remove(Light Object){
    lights.remove(Object);
    return this;
  }
}
