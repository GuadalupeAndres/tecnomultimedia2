//clase que va a definir al personaje

class Monigotito extends FBox {

  PImage monigoteSaltando, monigoteQuieto, monigoteGirando;
  int contador = 0;

  Monigotito() {
    super (15, 30);
    setPosition(15, 650);
    setName("Monigotito");
    setDamping(0);
    setFill(250, 170, 8);
    setNoStroke();
    setRestitution(0.1);
    setGrabbable(false);
    setFriction(0);
    setRotatable(false);
    monigoteQuieto = loadImage("sprites1.png");
    monigoteSaltando = loadImage("sprites2.png");
    monigoteGirando = loadImage("sprites3.png");
    monigoteQuieto.resize(65, 40);
    attachImage(monigoteQuieto);
  }

  void mover() {
    setVelocity(90, 0);
  }

  void saltar() {
    if (contador<2) {
      monigoteSaltando.resize(65, 40);
      attachImage(monigoteSaltando);
    } else {
      monigoteGirando.resize(65, 40);
      attachImage(monigoteGirando);
    }
    contador++;
    if (grande) {
      addImpulse(40, -500);
      grande= false;
    } else if (mediano) {
      addImpulse(60, -700);
      mediano= false;
    } else if (chico) {
      addImpulse(80, -1000);
      chico= false;
    }
  }

  void quieto() {
    setVelocity(0, 0);
  }
}
