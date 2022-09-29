//
class Baseborra extends FBox {
  PImage base;
  String tipo;
  Baseborra (int x_, int y_) {
    super (x_, y_);
    base = loadImage("invisible.png");
    base.resize(x_, y_);
    attachImage(base);
  }
  void inicializar (float x_, float y_) {
    setPosition(x_, y_);
  }
  void fijar() {
    setStatic(true);
    setGrabbable(false);
  }
}
