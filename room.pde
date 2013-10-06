ArrayList pendulumArrays;

void steupPendulums() {
  pendulumArrays = new ArrayList<Pendulum>();
  for (int i = 0; i < 15; i++) {
    pendulumArrays.add(new Pendulum(-30.0 * i, 500.0 - 10 * i));
  }
  
}

void setup() {
  background(0, 0, 0);
  size(800, 600, P3D);
  frameRate(60);
  smooth();  
  steupPendulums();
}

void draw() {
  background(0, 0, 0);
  for (int i = 0; i < pendulumArrays.size(); i++) {
    Pendulum p = (Pendulum)pendulumArrays.get(i);
    p.move();
    p.render();
  }
}
