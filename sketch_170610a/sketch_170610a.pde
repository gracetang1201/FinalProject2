ArrayList<Body> existing = new ArrayList<Body>();

void setup(){
  size(600, 600);
  background(0, 0, 0);
  ellipseMode(CENTER);
  int[]temp = {255, 255, 0};
  existing.add(new Body(300, 300, 0, 0, 2e30, temp));
  
}
void draw(){
  background(0, 0, 0);
  ellipse(existing.get(0).rx, existing.get(0).ry, 15.0, 15.0);
  fill(255, 255, 255);
  //fill(existing.get(0).getColorR(), existing.get(0).getColorB(), existing.get(0).getColorG());
  for(int i = 1; i < existing.size(); i++){
    ellipse(existing.get(i).rx, existing.get(i).ry, 10.0, 10.0);
    fill(255, 255, 255);
    //fill(existing.get(i).getColorR(), existing.get(i).getColorB(), existing.get(i).getColorG());
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
    existing.get(i).update(0.0009);
    existing.get(i).resetForce();
    System.out.println(i + " " + existing.get(i).rx  +" "+ existing.get(i).ry);
  }

}
void mouseClicked(){
  addPlanet();
}

void addPlanet(){
  double radius = 1e18;        // radius of universe
  double solarmass=1.98892e30;
  double px = 1e18*exp(-1.8)*(.5-Math.random());
  double py = 1e18*exp(-1.8)*(.5-Math.random());
  double magv = circlev(px,py);
  double absangle = Math.atan(Math.abs(py/px));
  double thetav= Math.PI/2-absangle;
  double phiv = Math.random()*Math.PI;
  float vx   = (float)(-1*Math.signum(py)*Math.cos(thetav)*magv);
  float vy   = (float)(Math.signum(px)*Math.sin(thetav)*magv);
  float mass = (float)(Math.random()*solarmass*10+1e20);
  int[]temp = {(int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255)};
  existing.add(new Body((float)mouseX, (float)mouseY, 30, 30, 6e24, temp));
}
  public static double circlev(double rx, double ry) {
    double solarmass=1.98892e30;
    double r2=Math.sqrt(rx*rx+ry*ry);
    double numerator=(6.67e-11)*1e6*solarmass;
    return Math.sqrt(numerator/r2);
  }
  