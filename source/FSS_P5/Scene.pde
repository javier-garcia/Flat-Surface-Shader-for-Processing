class Scene{
  Mesh[] meshes;
  Ligth[] ligths;
  
  void Scene(){}
  
  public Secene add(Mesh Object){
    meshes.push(Object);
    return this;
  }
  
  public Scene remove(Mesh Object){
    meshes.remove(Object);
    return this;
  }
}
