//funciones nombres para los contactos
String conseguirNombre(FBody cuerpo) {
  String nombre = "nada";
  if (cuerpo != null) {
    nombre = cuerpo.getName();
    if (nombre == null) {
      nombre = "nada";
    }
  }
  return nombre;
}

//Funciones power ups
void pausar() {
  mundo.remove(pausa);
  contador.iniciar();
  for (int i=0; i<trampolines.size(); i++) {
    trampolines.get(i).desfijar();
  }
  monigotito.setStatic(true);
  if (contador.tiempoCumplido()) {
    for (int i=0; i<trampolines.size(); i++) {
      trampolines.get(i).fijar();
    }
    monigotito.setStatic(false);
    relojTicTac.close();
    pausaAc = false;
    contador.terminar();
  }
}

void disminuirGravedad() {
  mundo.setGravity(70, -100);
  contadorPower++;
  mundo.remove(menosGravedad);
  if (contadorPower % 240 ==0) {
    contadorPower = 0;
    mundo.setGravity(0, 1000);
    menosGravedadAc = false;
  }
}

void obstaculoAtraccion() {
  contadorPower++;
  mundo.setGravity(0, 0);
  mundo.remove(obstaculos);
  obstaculo.setStroke(1);
  mundo.add(atraccion);
  obstaculo.attachImage(obstaculoImg);
  if (contadorPower % 240 ==0) {
    mundo.remove(atraccion);
    mundo.remove(obstaculo);
    mundo.setGravity(0, 1000);
    contadorPower = 0;
  }
}
