Simulator s = new Simulator();
String[] names = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"};
int counter = 0;
public void setup(){
  size(800, 600);
  ellipseMode(CENTER);
  
  background(255, 204, 0);
  s.addPlanet("jack", 100, 100, 1200);
}
public void draw(){
  if(mousePressed){
    s.addPlanet(names[counter], mouseX, mouseY, 1200);
    counter++;
  }
   updateLocations(s);
}
public void updateLocations(Simulator s){
  for(int i = 0; i < s.existing.size(); i++){
    s.existing.get(i).updateLocation();
    ellipse(s.existing.get(i).x, s.existing.get(i).y, 100, 100);
  }
}