//import controlP5.*; 
//failed to make button oops
ArrayList<Body> existing = new ArrayList<Body>();

void setup(){
  size(600, 600);
  background(0, 0, 0);
  ellipseMode(CENTER);
  int[]temp = {255, 255, 0};
  existing.add(new Body(300, 300, 0, 0, 2e30, temp));
  
}
void draw(){
  if(mousePressed == false){ //if mouse is pressed down see path
    background(0, 0, 0);
  }
  String s = "click to add planet, Click and hold to see paths";
  fill(100,200,125);
  text(s, 10, 10, 70, 80);
  ellipse(existing.get(0).rx, existing.get(0).ry, 10.0, 10.0);
  fill(255, 255, 255);
  //fill(existing.get(0).getColorR(), existing.get(0).getColorB(), existing.get(0).getColorG());
  for(int i = 1; i < existing.size(); i++){
    ellipse(existing.get(i).rx, existing.get(i).ry, 10.0, 10.0);
    fill(existing.get(i).getColorR(), existing.get(i).getColorB(), existing.get(i).getColorG());
  }

  for(int i = 0; i < existing.size(); i++){
    for(int k = 1; k < existing.size(); k++){ //other body
    //System.out.println(i + " " + k);
      if(i != k){
        existing.get(i).addForce(existing.get(k));

      }
    }
  }
  for(int i = 0; i < existing.size(); i++){
    //loop through all planets to adjust forces
    existing.get(i).update(0.0009);
    existing.get(i).resetForce();
    //debu
    //System.out.println(i + " " + existing.get(i).rx  +" "+ existing.get(i).ry);
  }

}
void mouseClicked(){
  addPlanet();
}

void addPlanet(){
  //color part of this function doesnt really work
int[]temp = {(int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255)};
  existing.add(new Body((float)mouseX, (float)mouseY, 30, 30, 6e24, temp));
}

//non working code for refrence
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
  
}
//non working version, helped to create working version
*/
  