
 class Planet {
   float radian, speed, moonRadian, moonSpeed, x, y;
   int size, numMoons;
   
   Planet(float _radian, float _speed, int _size, int _numMoons) {
     // I screwed up and this is actually degrees (0 - 360) that i then convert to radians
     radian = _radian;
     speed = _speed;
     size = _size;
     numMoons = _numMoons;
     moonSpeed = random(2, 5);
   }
   
   void updatePosition(){
     x = arcWidth/2 * cos(radians(radian));
     y = arcHeight/2 * sin(radians(-radian));
     
     radian = (radian + speed) % 360;
     moonRadian = (moonRadian + moonSpeed) % 360;
   }
   
   void render() {
     // don't render behind the head
     // TODO[wolfe]: figure out how to do this with zIndex
     if(radian < 66 || radian > 126) {
       planet();
       
       // TODO: iterate through moons, (move to own class)
       if(numMoons > 0){
         moon();
       }
     }
   }
   
   void planet() {
     stroke(0, 0, 0);
     fill(255, 255, 255);
     ellipse(x, y, size, size);
   }
   
    void moon() {
     pushMatrix();
     translate(x, y);
     rotate(-radians(moonRadian));
     ellipse(0, size, size/3, size/3); 
     popMatrix();
   }
 }