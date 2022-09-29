//
class Trampolines extends FBox {

  String tipo;
  PImage termoImg, galletitasImg, mochilaImg, mateImg, invisible, libro, cartuchera;

  Trampolines (int x_, int y_, String tipo_) {
    super (x_, y_);
    tipo = tipo_;

    termoImg = loadImage("termo.png");
    galletitasImg = loadImage("donsatur.png");
    mochilaImg = loadImage("mochila.png");
    mateImg = loadImage("mate2.png");
    invisible = loadImage("invisible.png");
    libro = loadImage("libro.png");
    cartuchera = loadImage("cartuchera.png");

    termoImg.resize(x_, y_);
    galletitasImg.resize(x_, y_);
    mochilaImg.resize(x_, y_);
    mateImg.resize(x_, y_);
    invisible.resize(x_, y_);
    libro.resize(x_, y_);
    cartuchera.resize(x_, y_);
  }

  void inicializar (float x_, float y_, int imagen_) {
    if (tipo.equals("chico")) {
      setFill(0);
      setName("chico");
      setDensity(1000);
    } else if (tipo.equals("mediano")) {
      setFill(50);
      setName("mediano");
      setDensity(1000);
    } else if (tipo.equals("grande")) {
      setFill(100);
      setName("grande");
      setDensity(1000);
    }
    setPosition(x_, y_);

    if (imagen_ == 0) {
      attachImage(mateImg);
    } else if (imagen_ == 1) {
      attachImage(galletitasImg);
    } else if (imagen_ == 2) {
      attachImage(mochilaImg);
    } else if (imagen_ == 3) {
      attachImage(termoImg);
    } else if (imagen_ == 4) {
      attachImage(invisible);
    } else if (imagen_ == 5) {
      attachImage(cartuchera);
    } else if (imagen_ == 6) {
      attachImage(libro);
    }
  }

  void fijar() {
    setStatic(true);
    setGrabbable(false);
  }

  void desfijar() {
    setStatic(false);
    setGrabbable(true);
  }
}
