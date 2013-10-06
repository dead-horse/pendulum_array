
ArrayList pendulumArrays;

void steupPendulums() {
  pendulumArrays = new ArrayList<Pendulum>();
  for (int i = 0; i < 1; i++) {
    pendulumArrays.add(new Pendulum(-100.0 * i, 400.0 - 30 * i));
  }
  
}

void setup() {
  background(0, 0, 0);
  size(800, 600, P3D);
  frameRate(30);
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
  stroke(255);
}
