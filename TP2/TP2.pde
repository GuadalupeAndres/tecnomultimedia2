//TP2 Etapa 4: Entrega Evaluativa
//Grupo
//Guadalupe Andrés 88209/3
//Mercedes Amiel 88142/0
//Robin Berro 81192/1
//Jair Gonzalez 88527/5

import fisica.*;
import ddf.minim.*;

Minim sonidoamb;
Minim perder;
Minim perder2;
Minim ganar;
Minim ganar2;
Minim reloj;
Minim menu;
Minim rebote;
Minim rebote2;
Minim rebote3;
Minim powerup;
Minim caida;
Minim wi;
Minim pausaa;
Minim giro;


AudioPlayer sonidoambiente;
AudioPlayer perdiste;
AudioPlayer ganaste;
AudioPlayer perdiste2;
AudioPlayer ganaste2;
AudioPlayer relojTicTac;
AudioPlayer menuIniciar;
AudioPlayer rebotar;
AudioPlayer rebotar2;
AudioPlayer rebotar3;
AudioPlayer poweruno;
AudioPlayer caidaa;
AudioPlayer wii;
AudioPlayer pause;
AudioPlayer girar;
FWorld mundo;

PGraphics grafico;
Trampolines mochila, cartuchera, mate, termo, libro, galletitas, saltoinicial;
Baseborra base1;
ArrayList <Trampolines> trampolines;
boolean grande, mediano, chico;
Power pausa, menosGravedad, superRebote, obstaculos, menosRebote;
ArrayList <Power> power;
boolean pausaAc, menosGravedadAc, superReboteAc, obstaculosAc, menosReboteAc;
FDistanceJoint atraccion;
FCircle obstaculo;
int xObstaculo;
int yObstaculo;
Monigotito monigotito;
String estado, estado2;
Boton boton1, boton2, boton3;
PImage pInicio, pPerder, pGanar, obstaculoImg;
Contador contador;
int contadorPower;
int objetosDisponibles;

void setup() {
  size(1200, 800);
  Fisica.init(this);
  grafico = createGraphics(width, height);
  mundo = new FWorld ();
  //botones
  boton1 = new Boton ("Jugar", width/2, height/2 - 50, 135, 50, 30);
  boton2 = new Boton ("Volver a Jugar", width/2, height - 200, 250, 50, 30);
  boton3 = new Boton ("Reiniciar", width-100, 50, 150, 50, 30);
  //
  monigotito = new Monigotito();
  mundo.add(monigotito);
  //imagenes
  pInicio = loadImage("inicio.png");
  pGanar = loadImage("ganaste.png");
  pPerder = loadImage("perdiste.png");
  obstaculoImg = loadImage("app.png");
  obstaculoImg.resize(50, 70);
  //estados iniciales
  estado = "menu";
  estado2 = "nada";
  //
  contador = new Contador(100, 100);
  //
  mundo.setEdges();
  mundo.setGravity(0, 1000);
  //
  Abismo abismo = new Abismo(width, 10);
  abismo.setPosition(600, height);
  mundo.add(abismo);
  //distintos tipos de trampolines
  trampolines = new ArrayList <Trampolines>();
  power = new ArrayList <Power>();
  //
  objetosDisponibles = int(random(1, 8));
  //
  mochila = new Trampolines (180, 250, "grande");
  mochila.inicializar(width/2, height - 160, 2);
  trampolines.add(mochila);
  //
  termo = new Trampolines (80, 200, "grande");
  termo.inicializar(width - 500, height - 200, 3);
  trampolines.add(termo);
  //
  cartuchera = new Trampolines (120, 60, "mediano");
  cartuchera.inicializar(width - 300, height - 200, 5);
  trampolines.add(cartuchera);
  //
  libro = new Trampolines (100, 120, "mediano");
  libro.inicializar(width - 300, height - 200, 6);
  trampolines.add(libro);
  //
  mate = new Trampolines (60, 60, "chico");
  mate.inicializar(width - 600, height - 200, 0);
  trampolines.add(mate);
  //
  galletitas = new Trampolines (100, 100, "chico");
  galletitas.inicializar(width - 700, height - 200, 1);
  trampolines.add(galletitas);
  //
  if (objetosDisponibles == 1) {
    mundo.add(mochila);
    mundo.add(cartuchera);
    mundo.add(galletitas);
  } else if (objetosDisponibles == 2) {
    mundo.add(termo);
    mundo.add(libro);
    mundo.add(mate);
  } else if (objetosDisponibles == 3) {
    mundo.add(mochila);
    mundo.add(libro);
    mundo.add(mate);
  } else if (objetosDisponibles == 4) {
    mundo.add(termo);
    mundo.add(cartuchera);
    mundo.add(mate);
  } else if (objetosDisponibles == 5) {
    mundo.add(mochila);
    mundo.add(libro);
    mundo.add(galletitas);
  } else if (objetosDisponibles == 6) {
    mundo.add(termo);
    mundo.add(libro);
    mundo.add(galletitas);
  } else if (objetosDisponibles == 7) {
    mundo.add(mochila);
    mundo.add(cartuchera);
    mundo.add(mate);
  } else if (objetosDisponibles == 8) {
    mundo.add(termo);
    mundo.add(cartuchera);
    mundo.add(galletitas);
  }
  //salida al lado de la base para que empieze saltando
  saltoinicial = new Trampolines (30, 94, "chico");
  saltoinicial.inicializar(50, 740, 4);
  trampolines.add(saltoinicial);
  mundo.add(saltoinicial);
  //base sin contacto
  base1 = new Baseborra (20, 5);
  base1.inicializar(15, 700);
  mundo.add(base1);
  //
  pausa = new Power (40, "pausa");
  pausa.inicializar(random(600, 790), random(350, 500));
  power.add(pausa);
  mundo.add(pausa);
  //
  menosGravedad = new Power (40, "menosGravedad");
  menosGravedad.inicializar(random(300, 590), random(350, 400));
  power.add(menosGravedad);
  mundo.add(menosGravedad);
  //
  obstaculos = new Power (40, "obstaculos");
  obstaculos.inicializar(random(800, 1000), random(350, 400));
  power.add(obstaculos);
  mundo.add(obstaculos);
  //
  xObstaculo = int(random(100, width - 100));
  yObstaculo = int(random(0, 300));
  obstaculo = new FCircle ( 50 );
  obstaculo.setPosition (xObstaculo, yObstaculo);
  obstaculo.setNoStroke();
  obstaculo.setStatic(true);
  obstaculo.setGrabbable(false);
  mundo.add(obstaculo);
  //
  atraccion = new FDistanceJoint(obstaculo, monigotito);
  atraccion.setLength(10);
  atraccion.setDamping(8);
  atraccion.setFrequency(1);
  atraccion.setNoStroke();
  //////////////////////////////
  sonidoamb = new Minim(this);
  sonidoambiente = sonidoamb.loadFile("sonido_fondo.mp3");
  perder = new Minim(this);
  perdiste = perder.loadFile("perder_musica.mp3");
  perder2 = new Minim(this);
  perdiste2 = perder2.loadFile("perder_sonido.mp3");
  ganar = new Minim(this);
  ganaste = ganar.loadFile("ganar_musica.mp3");
  ganar2 = new Minim(this);
  ganaste2 = ganar2.loadFile("ganar_sonido.mp3");
  reloj = new Minim(this);
  relojTicTac = reloj.loadFile("tic_tac.mp3");
  menu = new Minim(this);
  menuIniciar = menu.loadFile("cambienesto.mp3");
  rebote = new Minim(this);
  rebotar = rebote.loadFile("boing_2.mp3");
  rebote2 = new Minim(this);
  rebotar2 = rebote2.loadFile("boing_1.mp3");
  rebote3 = new Minim(this);
  rebotar3 = rebote3.loadFile("boing_3.mp3");
  powerup = new Minim(this);
  poweruno = powerup.loadFile("power_up.mp3");
  caida = new Minim(this);
  caidaa = caida.loadFile("caida_1.mp3");
  wi = new Minim(this);
  wii = wi.loadFile("cayendo_1.mp3");
  pausaa = new Minim(this);
  pause = pausaa.loadFile("fin_tic_tac.mp3");
  giro = new Minim(this);
  girar= giro.loadFile("girar_1.mp3");
  //
  Meta meta = new Meta (150, 400);
  meta.actualizar(width - 80, 700, "Meta", 2);
  mundo.add(meta);
  //
  Meta salida = new Meta (100, 100);
  salida.actualizar(10, 750, "Salida", 1);
  mundo.add(salida);
}

void draw() {
  if (estado.equals("menu")) {
    background(250);
    image(pInicio, 0, 0, width, height);
    boton1.actualizar();
    menuIniciar.play();
  } else if (estado.equals("acomodar")) {
    estado2 = "graficos";
    relojTicTac.play();
    contador.iniciar();
    if (contador.tiempoCumplido()) {
      mundo.remove(base1);
      relojTicTac.pause();
      contador.terminar();
      estado = "iniciar";
    }
  } else if (estado.equals("iniciar")) {
    for (int i=0; i<trampolines.size(); i++) {
      trampolines.get(i).fijar();
    }
    if (menosGravedadAc) {
      disminuirGravedad();
    }
    if (obstaculosAc) {
      obstaculoAtraccion();
    }
    if (pausaAc) {
      pausar();
    }
  } else if (estado.equals("perder")) {
    image(pPerder, 0, 0, width, height);
    boton2.actualizar();
    perdiste.play();
    perdiste2.play();
    sonidoambiente.close(); //si lo escribo al reves se me anula
  } else if (estado.equals("ganar")) {
    image(pGanar, 0, 0, width, height);
    ganaste.play();
    ganaste2.play();
    sonidoambiente.close();
    boton2.actualizar();
  } else if (estado.equals("reiniciar")) {
    estado = "menu";
    estado2 = "nada";
    menosGravedadAc = false;
    pausaAc = false;
    superReboteAc = false;
    obstaculosAc = false;
    grande = false;
    mediano = false;
    chico = false;
    sonidoambiente.pause();
    perdiste.pause();
    ganaste.pause();
    relojTicTac.pause();
    setup();
  }
  if (estado2.equals("graficos")) {
    mundo.step();
    grafico.beginDraw();
    grafico.background(255);
    //mundo.drawDebug(grafico);
    mundo.draw(grafico);
    grafico.endDraw();
    image(grafico, 0, 0);
    boton3.actualizar();
    if (estado.equals("acomodar")) {
      contador.dibujar();
    }
    if (pausaAc) {
      contador.dibujar();
    }
    sonidoambiente.play();
    perdiste.pause();
    ganaste.pause();
    menuIniciar.pause();
  }
}

void contactPersisted(FContact contacto) {
  FBody cuerpo1 = contacto.getBody1();
  FBody cuerpo2 = contacto.getBody2();
  String nombre1 = conseguirNombre(cuerpo1);
  String nombre2 = conseguirNombre(cuerpo2);
  if (nombre1 == "Monigotito" && nombre2 == "Salida" || nombre2 == "Monigotito" && nombre1 == "Salida") {
    monigotito.mover();
  }
}

void contactStarted(FContact contacto) {
  FBody cuerpo1 = contacto.getBody1();
  FBody cuerpo2 = contacto.getBody2();
  String nombre1 = conseguirNombre(cuerpo1);
  String nombre2 = conseguirNombre(cuerpo2);

  if (nombre1 == "Monigotito" && nombre2 == "menosGravedad" || nombre2 == "Monigotito" && nombre1 == "menosGravedad") {
    menosGravedadAc = true;
    poweruno.rewind();
    poweruno.play();
  }
  if (nombre1 == "Monigotito" && nombre2 == "pausa" || nombre2 == "Monigotito" && nombre1 == "pausa") {
    pausaAc = true;
    pause.play();
    relojTicTac.rewind();
    relojTicTac.play();
  }
  if (nombre1 == "Monigotito" && nombre2 == "obstaculos" || nombre2 == "Monigotito" && nombre1 == "obstaculos") {
    obstaculosAc = true;
    wii.play();
  }
  if (nombre1 == "Monigotito" && nombre2 == "Abismo" || nombre2 == "Monigotito" && nombre1 == "Abismo") {
    mundo.remove(monigotito);
    caidaa.play();
    estado = "perder";
    estado2 = "nada";
  }
  if (nombre1 == "Monigotito" && nombre2 == "Meta" || nombre2 == "Monigotito" && nombre1 == "Meta") {
    if (contacto.getNormalX() == 0) {
      mundo.remove(monigotito);
      estado = "ganar";
      estado2 = "nada";
    }
  }
  if (nombre1 == "Monigotito" && nombre2 == "grande" || nombre2 == "Monigotito" && nombre1 == "grande") {
    monigotito.saltar();
    rebotar.rewind();
    rebotar.play();
    grande = true;
  }
  if (nombre1 == "Monigotito" && nombre2 == "mediano" || nombre2 == "Monigotito" && nombre1 == "mediano") {
    monigotito.saltar();
    rebotar2.rewind();
    rebotar2.play();
    mediano = true;
  }
  if (nombre1 == "Monigotito" && nombre2 == "chico" || nombre2 == "Monigotito" && nombre1 == "chico") {
    monigotito.saltar();
    rebotar3.rewind();
    rebotar3.play();
    chico = true;
  }
}

void mousePressed() {
  if (estado.equals("menu")) {
    if (boton1.estaEncima()) {
      cambiarEstado("acomodar");
    }
  }
  if (estado.equals("perder") || estado.equals("ganar")) {
    if (boton2.estaEncima()) {
      cambiarEstado("reiniciar");
    }
  }
  if (estado.equals("acomodar") || estado.equals("iniciar")) {
    if (boton3.estaEncima()) {
      cambiarEstado("reiniciar");
    }
  }
}
//
void cambiarEstado(String nuevoEstado_) {
  estado = nuevoEstado_;
  if (nuevoEstado_.equals("menu")) {
    //
  } else if (nuevoEstado_.equals("acomodar")) {
    //
  } else if (nuevoEstado_.equals("ganar")) {

    //
  } else if (nuevoEstado_.equals("perder")) {

    //
  } else if (nuevoEstado_.equals("iniciar")) {
    //
  }
}
