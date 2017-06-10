class Body {
  private static final double G = 6.673e-11;   // gravitational constant
  private static final double solarmass=1.98892e30;
  
 float rx, ry;       // holds the cartesian positions
  float vx, vy;       // velocity components 
   float fx, fy;       // force components
  float mass;         // mass
  int[]colores = new int[3];

  
  // create and initialize a new Body
  public Body(float rx, float ry, float vx, float vy, float mass, int[]colores) {
    this.rx    = rx;
    this.ry    = ry;
    this.vx    = vx;
    this.vy    = vy;
    this.mass  = mass;
    this.colores = colores;
  }
  int getColorR(){
    return colores[0];
  }
  int getColorB(){
    return colores[1];
  }
  int getColorG(){
    return colores[2];
  }
  // update the velocity and position using a timestep dt
  void update(double dt) {
    
    vx += dt * fx / mass;
    vy += dt * fy / mass;
    rx += dt * vx; //Math.getExponent(dt * vx) * 0.1;
    ry += dt * vy; //Math.getExponent(dt * vy) * 0.1;
    //System.out.println("updateLocations ran");
  }
  
  //returns the distance between two bodies
  
  public double distanceTo(Body b) {
    double dx = rx - b.rx;
    double dy = ry - b.ry;
    return Math.sqrt(dx*dx + dy*dy);
  }
  
  // set the force to 0 for the next iteration
  public void resetForce() {
    fx = (float)0.0;
    fy = (float)0.0;
  }
  
  // compute the net force acting between the body a and b, and
  // add to the net force acting on a
  public void addForce(Body b) {
    //this.resetForce();
    Body a = this;
    double EPS = 3E4;      // softening parameter (just to avoid infinities)
    double dx = (b.rx - a.rx) * 100;
    double dy = (b.ry - a.ry) * 100;
    double dist = Math.sqrt(dx*dx + dy*dy);
    double F = (G * a.mass * b.mass) / (dist*dist + EPS*EPS);
    a.fx += F * dx / dist;
    a.fy += F * dy / dist;
    //System.out.println("addForce ran");
    
  }
  
  // convert to string representation formatted nicely
  public String toString() {
    return "" + rx + ", "+ ry+ ", "+  vx+ ", "+ vy+ ", "+ mass;
  }
}