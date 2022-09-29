//
class Meta extends FBox {

  String tipo;
  PImage salida, llegada;

  Meta (int x_, int y_) {
    super(x_, y_);
    salida = loadImage("salida1.png");
    //salida.resize(230, 145);
    salida.resize(x_+80, y_+30);
    llegada = loadImage("meta.png");
    //llegada.resize(140, 400);
    llegada.resize(x_, y_);
  }

  void actualizar(float x_, float y_, String tipo_, int imagen_) {
    setPosition(x_, y_);
    setStatic(true);
    setFill(150);
    tipo = tipo_;
    setName(tipo);
    setGrabbable(false);
    if (imagen_ == 1) {
      attachImage(salida);
    } else if (imagen_ == 2) {
      attachImage(llegada);
    }
  }
}
