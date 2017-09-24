color my_color;

int alpha;

// setup is going to be called ONCE at the beginning
void setup(){
  size(1000, 800);
  
  background(255);
  
  alpha = 10;
  my_color = color(100, 100, 100, alpha);
}

// draw is going to be called ONCE PER FRAME
// during the whole duration of the application
void draw(){
  //background(0, 0, 255); //start with a new background!
  
  stroke(my_color);
  fill(my_color); //fill everything that comes after with yellow
  
  int size_of_my_brush = 100;
  for(int i = 0; i < 100; i += 1){
    
    float x_position = mouseX+random(-size_of_my_brush, size_of_my_brush);
    float y_position = mouseY+random(-size_of_my_brush, size_of_my_brush);
    if(dist(x_position, y_position, mouseX, mouseY) < 80){
      ellipse(x_position, y_position, 3, 3); //draw a circle in the middle
    }
    
  }
}

void keyPressed(){
  if(key == 'c'){
    my_color = color(random(100, 255), random(100, 255), random(100, 255), alpha);
  }
  
  if(key == 'r'){
    background(255);
  }
  
}