//Today we coding on Processing!
UI ui;
void setup() {
  size(900, 600);
  ui = new UI(9);
  surface.setResizable(true);
  surface.setLocation(displayWidth/2-width/2, displayHeight/2-height/2);
  ui.addButton("Erase all", 10, 10, 100, 30);//1
  ui.addSlider("Size", 10, 60, 100, 30, 10, 100);//2
  background(200);
}
void draw() {
  fill(255);
  noStroke();
  rect(0, 0, width, 120);
  ui.drawUI();
  noStroke();
  fill(#410EED);
  circle(240, 68, ui.getSlider(2));
  if (ui.getButton(1)) {
    background(200);
    delay(300);
  }
  if (mouseY > 120) {
    noStroke();
    if (mousePressed) {
      fill(#410EED);
      circle(mouseX, mouseY, ui.getSlider(2));
    }
  }
  if(keyPressed && key == 's'){
    fill(200);
    rect(0, 0, width, 120);
    saveFrame("data/Frame #####.png");
    delay(300);
  }
}
