//

class Power extends FCircle {

  String tipo;
  PImage antifaz, joycon, taza, telefono, tesito;

  Power (int x_, String tipo_) {
    super (x_);
    setStrokeWeight(3);
    setStatic(true);
    setGrabbable(false);
    tipo = tipo_;
    antifaz = loadImage("antifaz.png");
    joycon = loadImage("joycon.png");
    taza = loadImage("taza.png");
    telefono = loadImage("telefono.png");
    tesito = loadImage("tesito.png");
    antifaz.resize(70, 50);
    joycon.resize(50, 50);
    taza.resize(50, 50);
    telefono.resize(50, 70);
    tesito.resize(50, 55);
  }

  void inicializar (float x_, float y_) {
    if (tipo.equals("pausa")) {
      setFill(0, 100, 0);
      setName("pausa");
      setStatic (true);
      attachImage(tesito);
    } else if (tipo.equals("menosGravedad")) {
      setFill(0, 255, 0);
      setName("menosGravedad");
      setStatic (true);
      attachImage(antifaz);
    } else if (tipo.equals("superRebote")) {
      setFill(0, 200, 50);
      setName("superRebote");
      setStatic (true);
      attachImage(taza);
    } else if (tipo.equals("obstaculos")) {
      setFill(255, 0, 0);
      setName("obstaculos");
      setStatic (true);
      attachImage(telefono);
    } else if (tipo.equals("menosRebote")) {
      setFill(100, 0, 0);
      setName("menosRebote");
      setStatic (true);
      attachImage(joycon);
    }
    setPosition(x_, y_);
  }
}
