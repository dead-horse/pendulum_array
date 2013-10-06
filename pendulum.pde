class Pendulum {
  PVector startPoint;
  PVector ballCenter;
  float radius;
  float length;
  PVector velocity;
  PVector normalAcceleration;
  PVector tangentialAcceleration;
  PVector gravity;
  
  Pendulum(float zPosition, float l) {
    radius = 20;
    length = l;
    println(zPosition);
    println(l);
    startPoint = new PVector(width / 2, 100, zPosition);
    ballCenter = new PVector(width / 2, 100 + l, zPosition);
    velocity = new PVector(10, 0, 0);
    gravity = new PVector(0, 10, 0);
  }
  
  void render() {
    pushMatrix();
    stroke(255);
    line(startPoint.x, startPoint.y, startPoint.z, ballCenter.x, ballCenter.y, ballCenter.z);
    translate(ballCenter.x, ballCenter.y, ballCenter.z);
    noStroke();
    lights();
    sphere(radius);
    popMatrix();    
  }
  
  void move() {
    PVector rope = ballCenter.get();
    rope.sub(startPoint);
    float angle = PVector.angleBetween(rope, gravity);
    println(angle);
    float sinAngle = sin(angle);
    float cosAngle = cos(angle);
    
    // get x acceleration direction
    int direction = 1;
    if (ballCenter.x < width / 2) {
      // ball at left
      direction = 1;
    } else {
      direction = -1;
    }
    
    tangentialAcceleration = new PVector(direction * sinAngle * gravity.y * cosAngle, sinAngle * gravity.y * sinAngle, 0.0);
    float normalAccelerationMag = velocity.mag() * velocity.mag() / length;
    println(tangentialAcceleration);
    normalAcceleration = new PVector(direction * normalAccelerationMag * sinAngle, -1 * normalAccelerationMag * cosAngle, 0);
    velocity.add(tangentialAcceleration);
    velocity.add(normalAcceleration);
    ballCenter.add(velocity);
    
    //fix length
    PVector newRope = ballCenter.get();
    newRope.sub(startPoint);
    newRope.setMag(length);
    ballCenter = startPoint.get();
    ballCenter.add(newRope);
  }
}
