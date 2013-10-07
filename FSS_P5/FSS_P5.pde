Scene scene;
Light light;
Plane geometry;
Material material;
Mesh mesh;
RGBA rgba;
Renderer renderer;
int now, start;

void setup(){
  rgba = new RGBA();
  scene = new Scene();
  light = new Light(#111122, #FF0022);
  geometry = new Plane(600, 400, 6, 4);
  material = new Material(#FFFFFF, #FFFFFF);
  mesh = new Mesh(geometry, material);
  renderer = new Renderer();
  
  scene.add(mesh);
  scene.add(light);
  
  start = millis();
  
  size(600, 400, P3D);
  renderer.setSize(600, 400);
}

void draw(){  
  now = millis() - start;
  light.setPosition(new PVector(300*sin(now*0.001), 200*cos(now*0.0005), 60));
  renderer.render(scene);
}
