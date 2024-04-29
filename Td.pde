PShape plan;
PShape poteau;
PShape eolienne;
PImage img;
float rotx, roty;
float initialX, initialY;
float scaleFactor = 2.8;
float scaleChange = 0.1; // Scale change en fonction de la roulette de la souris

void setup() {
  size(1000, 1000, P3D);
  // importer la texture pour l'objet
  img = loadImage("StAuban_texture.jpg");
  //importer l'objet Poteau electrique (je l'ai construit avec blender en 3D)
  poteau = loadShape("Powerr.obj");  
  //eolienne
  eolienne = loadShape("eolienne.obj");
  
  // importer l'objet map
  plan = loadShape("hypersimple.obj");
  // ajouter la texture au plan:
  plan.setTexture(img);
  rotx = PI/4;
  roty = PI/4;
}

void draw() {
  //couleur du background
  background(200);
  
  pushMatrix();
  // Set up camera
  translate(width/3, height/6);
  rotateX(1.1);
  rotateZ(-0.2);
  scale(5.3);
  translate(20, 50,190);
  // Dessiner les axes à une longueur de 100
  // les coordonées de mon repère sont : O(-135, -140, -200)
  drawAxes(120, -135, -140, -200);
  shape(plan);
  popMatrix();
  
  //positionner les poteaux electriques
  pushMatrix();
  translate(450, 150,-30);
  rotateY(0);
  rotateX(1.2);
  rotateZ(-0.5);
  scale(10);//60
  shape(poteau);
  popMatrix();
  
  // positionner l'eolienne
  pushMatrix();
  translate(600, 250, 100);
  rotateY(0);
  rotateX(1.2);
  rotateZ(-0.5);
  scale(0.013);
  shape(eolienne);
  popMatrix();
  
  // positionner l'eolienne
  pushMatrix();
  translate(650, 250, 100);
  rotateY(0);
  rotateX(1.2);
  rotateZ(-0.5);
  scale(0.013);
  shape(eolienne);
  popMatrix();
  
  // positionner l'eolienne
  pushMatrix();
  translate(700, 250, 80);
  rotateY(0);
  rotateX(1.2);
  rotateZ(-0.5);
  scale(0.013);
  shape(eolienne);
  popMatrix();
  
}


void drawAxes(float length, float offsetX, float offsetY, float offsetZ) {
  strokeWeight(2);
  // Axe des X (rouge)
  stroke(255, 0, 0);
  line(offsetX, offsetY, offsetZ, offsetX + length, offsetY, offsetZ);
  // Axe des Y (vert)
  stroke(0, 255, 0);
  line(offsetX, offsetY, offsetZ, offsetX, offsetY + length, offsetZ);
  // Axe des Z (bleu)
  stroke(0, 0, 255);
  line(offsetX, offsetY, offsetZ, offsetX, offsetY, offsetZ + length);
}

void mousePressed() {
  initialX = mouseX;
  initialY = mouseY;
}

void mouseDragged() {
  float dx = (mouseX - initialX) * 0.01;
  float dy = (mouseY - initialY) * 0.01;
  rotx += dx;
  roty -= dy;
  initialX = mouseX;
  initialY = mouseY;
}

void mouseWheel(MouseEvent event) {
  float delta = event.getCount(); // recuperer mouvement de la roulette de la souris
  scaleFactor += delta * scaleChange;
}
