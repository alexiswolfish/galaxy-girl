/**
 *
 * In your orbit
 */
 
 PImage galaxy_girl;
 float xx, yy, arcHeight, arcWidth, a, moonOrbit;
 float d = 30;
 
 float arcStart = -67;
 float arcEnd = 235;
 
 int zIndex_moon = 1;
 int zIndex_girl = 50;
 
 int numPlanets = 4;
 
 ArrayList<Planet> planets = new ArrayList<Planet>();

 void setup() {
   size(800, 600, P3D);
   galaxy_girl = loadImage("galaxy_base.png");
   background(0, 0, 0, 0);
   
   arcWidth = width-130.0;
   arcHeight = 48;
   
   planets.add(new Planet(HALF_PI /** start_radian **/, 
                           1 /** speed **/,
                           30 /** size **/,
                           3 /** numMoons **/));
                           
  for(int i=0; i < numPlanets; i++) {
    planets.add(new Planet( random(0, 360) /** start_radian **/,
                            random(0.6, 2) /** speed **/,
                            round(random(8, 50)) /** size **/,
                            round(random(0, 1))) /** numMoons **/);
   }
 }
 
 void draw() {
   image(galaxy_girl, 0, 0);
   drawPlanets();
   
   update();
 }
 
 void update() {
   a = (a+1)%360;
   moonOrbit = (moonOrbit+2)%360;
   
   xx = arcWidth/2 * cos(radians(a));
   yy = arcHeight/2 * sin(radians(-a));
   
   for ( Planet p: planets) {
     p.updatePosition();
   }
 }
 
 void drawPlanets() {
   stroke(222, 124, 212);
   noFill();
     
   pushMatrix();
   orbit();
   
   // translate zIndex to above orbit
   translate(0, 0, zIndex_moon);
   
   // draw individual planets
   for ( Planet p: planets) {
     p.render();
   }
   popMatrix();
 }
 
 void orbit() {
   translate(width/2, height/2-40);
   rotate(radians(-14));
   //rotateZ(radians(-14));
   
   // draw pink orbit
   arc(0, 0, arcWidth, arcHeight, radians(arcStart), radians(arcEnd));
 }
 