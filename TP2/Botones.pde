//clase Boton
class Boton {
  //
  float x, y, ancho, alto, tama;
  String label;
  //
  Boton(String label_, float x_, float y_, float ancho_, float alto_, float tama_) {
    x = x_;
    y = y_;
    label = label_;
    ancho = ancho_;
    alto = alto_;
    tama = tama_;
  }
  //
  void actualizar() {
    dibujar();
  }
  void dibujar() {
    pushMatrix();
    pushStyle();
    translate(x, y);
    if (estaEncima()) {
      fill(#555454);
    } else {
      fill(#C4C0C0);
    }
    stroke(0);
    strokeWeight(3);
    rectMode(CENTER);
    //noStroke();
    rect(0, 0, ancho, alto, 3);
    //escribo la etiqueta
    fill(255);
    textSize(tama);
    textAlign(CENTER, CENTER);
    text(label, 0, -3);
    popStyle();
    popMatrix();
  }
  boolean estaEncima() {
    if (mouseX > x-ancho/2 && mouseX < x+ancho/2 && mouseY > y-alto/2 && mouseY < y+alto/2) {
      return true;
    } else {
      return false;
    }
  }
}
