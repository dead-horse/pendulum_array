ArrayList pendulumArrays;

void steupPendulums() {
  pendulumArrays = new ArrayList<Pendulum>();
  pendulumArrays.add(new Pendulum(0.0, 357.0));
  pendulumArrays.add(new Pendulum(-30.0, 330.0));
  pendulumArrays.add(new Pendulum(-60.0, 306.0));
  pendulumArrays.add(new Pendulum(-90.0, 285.0));
  pendulumArrays.add(new Pendulum(-120.0, 266.0));
  pendulumArrays.add(new Pendulum(-150.0, 248.0));
  pendulumArrays.add(new Pendulum(-180.0, 232.0));
  pendulumArrays.add(new Pendulum(-210.0, 218.0));
  pendulumArrays.add(new Pendulum(-240.0, 205.0));
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
