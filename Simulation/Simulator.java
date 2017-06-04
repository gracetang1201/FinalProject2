import java.util.*;
class Simulator{
  ArrayList<Planet> existing = new ArrayList<Planet>();
  Simulator(){
  }
  void addPlanet(String name, float x, float y, float m){
    Planet n = new Planet(name, x, y, m);
    existing.add(n);
  }
  /*
  void placePlanets(){
    for(Planet p : existing){
      ellipse(p.x, p.y, 10, 10);
    }
  }
  */
  
//PLANET CLASS:
  class Planet implements Comparable<Planet>{
    String name;
    float mass;
    float x;
    float y;
    double G = 6.67408 * Math.pow(10, -11);
    //PVector p;
    double velocityx;
    double velocityy;
    //-------------------------------------
    public int compareTo(Planet a){
      if(this.name.equals(a.name)){
        return 0;
      }else{
        return 1;
      }
    }
    //-------------------------------------
    Planet(String n, float xcor, float ycor, float m){
      name = n;
      mass = m;
      x = xcor;
      y = ycor;
    }
    public String toString(){
      return name;
    }
    /*
    public void findOrbit(){
      Planet biggestForce = null;
      double forceCounter = 0.0;
      for(Planet possible: existing){
        double r = (Math.abs(possible.x - this.x))^2 +
                  (Math.abs(possible.y - this.y))^2;
        double force = (G * possible.mass * this.mass)/r);
        if (force > forceCounter){
          biggestForce = possible;
        }
      }
      orbit = biggestForce;
    }
    */
    //ALL RETURNS ARE RADIANS!!
    void updateLocation(){
      //System.out.println(existing.toString());
      ArrayList<String> directions = new ArrayList<String>();
      for(int i = 0; i < existing.size(); i++){
        //System.out.println("went here");
        Planet orbit = existing.get(i);
        //System.out.println(orbit.name);
        if(this.compareTo(orbit) != 0){
          if(this.x >= orbit.x){
            if (this.y > orbit.y){
            directions.add("up");
            directions.add("right");
            }else{
              directions.add("up");
              directions.add("right");
            }
          }else if(this.x <= orbit.x){
            if(this.y > orbit.y){
              directions.add("down");
              directions.add("right");
            }else{
              directions.add("down");
              directions.add("left");
            }
          }
        
        //System.out.println(directions.toString());
          double accel = calcAcceleration(orbit, this, calcDist(orbit, this));
          double theta = Math.atan((orbit.x - this.x) / (orbit.y - this.y));
          double accelinx = accel*(Math.sin(theta));
          double acceliny = accel*(Math.cos(theta));
          System.out.println(directions.toString() + this.x + " " + this.y);
          if(directions.get(0).equals("down")){ //ERROR
          
            acceliny = acceliny * -1;
          }
          if(directions.get(1).equals("left")){
            accelinx = accelinx * -1;
          }
          velocityx += accelinx;
          velocityy += acceliny; 
          this.x += velocityx;
          this.y += velocityy;
        }
        }
      }
    }
    double calcDist(Planet a, Planet b){
      return Math.pow((Math.abs(a.x - b.x)) +
              (Math.abs(a.y - b.y)), 0.5);
    }
    double calcAcceleration(Planet basic, Planet orbit, double distance){
      double f = (6.67408 * Math.pow(10, -11) * orbit.mass) / Math.pow(distance, 2.0);
      return f;
    }
    
  }
//PLANET CLASS: