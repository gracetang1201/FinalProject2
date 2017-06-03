public class Simulator{
    ArrayList<Planet> existing = new ArrayList<Planet>();
    public Simulator(){
    }
    
    public class Planet{
	double mass;
	double x;
	double y;
	public Planet(double xcor, double ycor, double m){
	    mass = m;
	    x = xcor;
	    y = ycor;
	    
	}
    
    }
}
