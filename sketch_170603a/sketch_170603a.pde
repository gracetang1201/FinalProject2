Simulator s = new Simulator();
//String[] names = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z", "1"};
int counter = 0;
void setup(){
  size(800, 600);
  ellipseMode(CENTER);
  background(255, 204, 0);
  s.addPlanet("Sun", 100, 100, 2*Math.pow(10, 30));
}
void draw(){
  if(mousePressed){
    s.addPlanet(("" + counter), mouseX, mouseY, 6*Math.pow(10, 24));
    counter++;
  }
    
    for(int i = 0; i < s.existing.size(); i++){
      ellipse(s.existing.get(i).position.x, s.existing.get(i).position.y, 100, 100);
    }
    s.updateLocations();
}


class Simulator{

  ArrayList<Planet> existing = new ArrayList<Planet>();
  
  void addPlanet(String name, float x, float y, double mass){
    Planet temp = new Planet(name, x, y, mass);
    existing.add(temp);
  }
  
  void updateLocations(){
    for(Planet me : existing){
      for(Planet other : existing){
        if(me.compareTo(other) != 0){
          me.updatePosition(other);
        }
      }
    }
  }
  
class Planet implements Comparable<Planet>{
  double G = 6.673e-11;
  double sunmass = 1.98892e30;
  String name;
  PVector position;
  PVector velocity;
  PVector force;
  double mass;
  
  int compareTo(Planet other){
    if(this.name.equals(other.name)){
      return 0;
    }else{
      return 1;
    }
  }
  

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
      direction = 1;
    }else{
      direction = -1;
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
  }
}