import processing.sound.*;

color my_color;

int alpha;

float red;
float green;
float blue;

boolean isPlaying = false;

SoundFile brush_sfx;

// setup is going to be called ONCE at the beginning
void setup(){
  size(1000, 800);
  
  background(255);
  
  alpha = 20;
  my_color = color(100, 100, 100, alpha);
  
  brush_sfx = new SoundFile(this, "sfx.wav");
  
}

// draw is going to be called ONCE PER FRAME
// during the whole duration of the application
void draw(){
  //background(0, 0, 255); //start with a new background!
  
  stroke(my_color);
  fill(my_color); //fill everything that comes after with yellow
  
  int size_of_my_brush = 25;
  float number_of_droplets = 55;
  for(int i = 0; i < number_of_droplets; i += 1){
    
    float x_position = mouseX+random(-size_of_my_brush, size_of_my_brush);
    float y_position = mouseY+random(-size_of_my_brush, size_of_my_brush);
    if(dist(x_position, y_position, mouseX, mouseY) < size_of_my_brush*0.9){
      
      ellipse(x_position+random(-10, 10), y_position+random(-10, 10), 3, 3); //draw a circle in the middle
    
    }
  }
  
  if(mousePressed){
   alpha = 230;
   my_color = color(red, green, blue, alpha);
   
   if(isPlaying == false){
     brush_sfx.loop();
     isPlaying = true;
   }
     
  }else{//the mouse is released
    alpha = 10;
    my_color = color(red, green, blue, alpha);
    
    brush_sfx.stop();
    isPlaying = false;
  }
}

void keyPressed(){
  if(key == 'c'){
    red = random(100, 255);
    green = random(100, 255);
    blue = random(100, 255);
    my_color = color(red, green, blue, alpha);
  }
  
  if(key == 'r'){
    background(255);
  }
  
}