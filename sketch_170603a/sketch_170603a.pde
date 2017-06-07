  PVector pos, vel, v0, acc;
float radius = 3.0;
PVector CM;
PVector r;
float m, Const = 3000;
void setup() {
  size(1000, 1000);
  background(0);
  pos = new PVector(150.0, 150.0);//initial position
  v0 = new PVector(2.0, 0.25);//initial velocity
  vel = new PVector(v0.x, v0.y);//velocity
  acc = new PVector(0, 0);
  CM = new PVector(height/2, width/2);
  r = new PVector(0, 0);
}
void draw() {
  if (mousePressed == false) {//hold down mouse to see path
    background(0);
  }
  PVector r = PVector.sub(pos, CM);
  m = r.mag();
  acc.x =(Const*cos(r.heading()))/pow(m, 2);// 1 < cos(r.heading()) < -1
  acc.y =(Const*sin(r.heading()))/pow(m, 2);
  vel.x -= acc.x;
  pos.x += vel.x;
  vel.y -= acc.y;
  pos.y += vel.y;
  fill(256,256,256);
  ellipse(pos.x, pos.y, 2*radius, 2*radius);//black the projectile itself!
  fill(256,256,256);
  ellipse(CM.x, CM.y, 40, 40);
/*
//String[] names = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z", "1"};
int counter = 0;
ArrayList<Planet> planets = new ArrayList<Planet>();
void addPlanet(String name, float x, float y, float rad){
  Planet p = new Planet(name, x, y, rad);
  planets.add(p);
}

void setup(){
  size(1000, 1000);
  ellipseMode(CENTER);
  background(0);
  addPlanet("Sun", 400, 400, 30.0);
  addPlanet("Earth", 200, 300, 10.0);
  
}
void draw(){
  background(0);
  ellipse(400, 400, 10, 10);
  for(Planet p : planets){
    for(Planet goal : planets){
      if(p.compareTo(goal) != 0){
        p.updatePosition(goal);
        System.out.println("cool");
      }
    }
  }
}
  /*
class Planet implements Comparable<Planet>{
  /*
  double G = 6.673e-11;
  double sunmass = 1.98892e30;
  String name;
  PVector position;
  PVector velocity;
  PVector force;
  double mass;
  */
  /*
  String name;
  PVector position;
  PVector velocity;
  PVector acceleration;
  PVector focus;
  PVector middle;
  float G = 1500.0;
  float r;
  
  Planet(String n){
    name = n;
    position = new PVector(300.0, 300.0);
    velocity = new PVector(2.0, .5);
    acceleration = new PVector(0.0, 0.0);
    middle = new PVector(height * 0.5, width * 0.5);
    r = 2.0;
  }
  
  Planet(String n, float x, float y, float rad){
    name = n;
    position = new PVector(x, y);
    velocity = new PVector(2.0, .5);
    acceleration = new PVector(0.0, 0.0);
    middle = new PVector(height * 0.5, width * 0.5);
    rad = r;
  }
  
  void updatePosition(Planet main){
    focus = new PVector(main.position.x, main.position.y);
    PVector target = PVector.sub(position, focus);
    float magnitude = focus.mag();
    acceleration.x = G * cos(target.heading()) / pow(magnitude, 2);
    acceleration.y = G * sin(target.heading()) / pow(magnitude, 2);
    velocity.x -= acceleration.x;
    velocity.y -= acceleration.y;
    position.x += velocity.x;
    position.y += velocity.y;
    fill(256,256,256);
    ellipse(position.x % 800, position.y % 800, 2*r, 2*r);//black the projectile itself!
    fill(256,256,256);
    ellipse(main.position.x % 800, main.position.y % 800, main.r * 2, main.r * 2);
    System.out.println("cng");
  }
    
  
  int compareTo(Planet other){
    if(this.name.equals(other.name)){
      return 0;
    }else{
      return 1;
    }
  }
  */
/*
  Planet(String n, float x_, float y_, double m){
    position = new PVector(x_, y_);
    velocity = new PVector(1, 1);
    mass = m;
    name = n;
  }
  //calculates force between 2 planets:
  double calcOverallForce(Planet other){
    double F = (6.67408 * Math.pow(10, -11) * other.mass * this.mass) / Math.pow(calcDist(other), 2);
    return F;
  }
  double calcAngle(Planet other){
    double hypotenuse = calcDist(other);
    double opposite = this.position.y - other.position.y;
    //sin(angle) = opposite/hypotenuse
    double angle = Math.asin(opposite/hypotenuse);
    return angle;
  }
  double calcForceInX(Planet other){
    double forceinX = calcOverallForce(other)*Math.cos(calcAngle(other));
    //if(this.position.x > 
    return forceinX;
  }
  double calcForceInY(Planet other){
    double forceinY = calcOverallForce(other)*Math.sin(calcAngle(other));
    return forceinY;
  }
  double accelerationinX(Planet other){
    int direction = 0;
    if (this.position.x >= other.position.x){
      direction = -1;
    }else{
      direction = 1;
    }
    double accelInX = calcForceInX(other) * Math.cos(calcAngle(other)) / this.mass;
    return accelInX*direction;
  }
  double accelerationinY(Planet other){
    int direction = 0;
    if (this.position.y >= other.position.y){
      direction = -1;
    }else{
      direction = 1;
    }
    double accelInY = calcForceInX(other) * Math.sin(calcAngle(other)) / this.mass;
    return accelInY*direction;
  }
  double newVelocityX(Planet other){
    double newvX = this.velocity.x+this.accelerationinX(other);
    return newvX;
  }
  double newVelocityY(Planet other){
    double newvY = this.velocity.y+this.accelerationinY(other);
    return newvY;
  }
  void establishDirection(Planet other){
    if(this.position.x > other.position.x){
      this.velocity.x *= -1;
    }else{
      if(this.position.y < other.position.x){
        this.velocity.y *= -1;
      }
    }
  }
  void updatePosition(Planet other){
    this.position.x += newVelocityX(other);
    this.position.y += newVelocityY(other);
  }
  
  double calcDist(Planet other){
    double distance = Math.pow(Math.pow((other.position.x - this.position.x), 2) +
                      Math.pow((other.position.y - this.position.y), 2), 0.5);
    return distance;
  }
  */
  //}
  
  /*
  PVector pos, vel, v0, acc;
float radius = 2.0;
PVector CM;
PVector r;
float m, Const = 1000;
void setup() {
  size(600, 600);
  background(0);
  pos = new PVector(150.0, 150.0);//initial position
  v0 = new PVector(2.0, 0.222222222222222222222222222222);//initial velocity
  vel = new PVector(v0.x, v0.y);//velocity
  acc = new PVector(0, 0);
  CM = new PVector(height/2, width/2);
  r = new PVector(0, 0);
}
void draw() {
  if (mousePressed == false) {//hold down mouse to see path
    background(0);
  }
  PVector r = PVector.sub(pos, CM);
  m = r.mag();
  acc.x =(Const*cos(r.heading()))/pow(m, 2);// 1 < cos(r.heading()) < -1
  acc.y =(Const*sin(r.heading()))/pow(m, 2);
  vel.x -= acc.x;
  pos.x += vel.x;
  vel.y -= acc.y;
  pos.y += vel.y;
  fill(256,256,256);
  ellipse(pos.x, pos.y, 2*radius, 2*radius);//black the projectile itself!
  fill(256,256,256);
  ellipse(CM.x, CM.y, 30, 30);
  /*println("pos.x = ", pos.x);
   println("pos.y = ", pos.y);
   println("vel.x = ", vel.x);
   println("vel.y = ", vel.y);
   println("acc.x = ", acc.x);
   println("acc.y = ", acc.y);
   println("pos.heading() = ", degrees(pos.heading()));
   println("m = ", m);*/
//}
// Anykey to pause and unpause animation
//boolean bStop;
//void keyPressed()
/*
{
  bStop = !bStop;
  if (bStop)
    noLoop();
  else
    loop();
} 
*/
}
