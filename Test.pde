//Today we coding on Processing!
UI ui;
String shape = "CIRCLE";
color col;
void setup() {
  size(900, 800);
  ui = new UI(10);
  surface.setResizable(true);
  surface.setLocation(displayWidth/2-width/2, displayHeight/2-height/2);
  ui.addButton("Erase all", 10, 10, 100, 30);//1
  ui.addSlider("Size", 10, 60, 100, 30, 10, 100);//2
  ui.addButton("Circle", 160, 10, 100, 30);//3
  ui.addButton("Square", 160, 60, 100, 30);//4
  ui.addButton("Ellipse", 480, 60, 100, 30);//5
  ui.addSlider("Width", 310, 10, 100, 30, 10, 100);//6
  ui.addSlider("Height", 310, 60, 100, 30, 10, 100);//7
  ui.addSlider("Red", 480, 10, 100, 30, 10, 255);//8
  ui.addSlider("Green", 680, 10, 100, 30, 10, 255);//9
  ui.addSlider("Blue", 680, 60, 100, 30, 10, 255);//10
  background(200);
}
void draw() {
  fill(255);
  noStroke();
  rect(0, 0, width, 120);
  ui.drawUI();
  noStroke();
  col = color(ui.getSlider(8), ui.getSlider(9), ui.getSlider(10));
  if (ui.getButton(1)) {
    background(200);
    delay(300);
  }
  if (ui.getButton(3)) {
    shape = "CIRCLE";
    delay(300);
  }
  if (ui.getButton(4)) {
    shape = "SQUARE";
    delay(300);
  }
  if (ui.getButton(5)) {
    shape = "ELLIPSE";
    delay(300);
  }
  if (mouseY > 120) {
    noStroke();
    if (mousePressed) {
      fill(col);
      switch(shape) {
      case "CIRCLE":
        circle(mouseX, mouseY, ui.getSlider(2));
        break;
      case "SQUARE":
        square(mouseX-ui.getSlider(2)/2, mouseY-ui.getSlider(2)/2, ui.getSlider(2));
        break;
      case "ELLIPSE":
        ellipse(mouseX, mouseY, ui.getSlider(6), ui.getSlider(7));
        break;
      }
    }
  }
  if (keyPressed && key == 's') {
    fill(200);
    rect(0, 0, width, 120);
    saveFrame("data/Frame ##########.png");
    delay(300);
  }
}
