ArrayList<Body> existing = new ArrayList<Body>();

void setup(){
  size(600, 600);
  background(0, 0, 0);
  ellipseMode(CENTER);
  int[]temp = {255, 255, 0};
  existing.add(new Body(300, 300, 0, 0, 2e30, temp));
  
}
void draw(){
  if(mousePressed == false){
    background(0, 0, 0);
  }
  ellipse(existing.get(0).rx, existing.get(0).ry, 10.0, 10.0);
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
int[]temp = {(int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255)};
  existing.add(new Body((float)mouseX, (float)mouseY, 30, 30, 6e24, temp));
}

  