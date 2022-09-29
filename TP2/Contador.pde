// contador de tiempo

class Contador {
  int maxImagenes = 16;
  int cambiaImg = 0;
  PImage [] reloj = new PImage[maxImagenes];
  int tiempo, tam, x, y;

  Contador(int x_, int y_) {
    for (int i = 0; i<reloj.length; i++) {
      reloj[i] = loadImage("reloj_000"+i+".png");
    }
    tiempo = 0;
    tam = 80;
    x = x_;
    y = y_;
  }

  void iniciar() {
    tiempo ++;
    if (frameCount%60 == 0) {
      cambiaImg = (cambiaImg + 1)%reloj.length;
    }
  }

  void dibujar() {
    image(reloj[cambiaImg], x, y, tam, tam);
  }

  boolean tiempoCumplido() {
    if (tiempo == 900) {
      return true;
    } else {
      return false;
    }
  }

  void terminar() {
    cambiaImg = 0;
    tiempo = 0;
  }
}
