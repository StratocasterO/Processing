//Instrument(String nom, int numSerie, float pes, Accessori[] accessoris)

Instrument[] parc;
Instrument violi, piano, teclat, flauta, trombo, vibrafon;
Accessori[] accGuitarra, accPiano, accTrombo, accVioli, accVibrafon;

void setup() {
  // Instrument genèric
  accVioli = new Accessori[3];
  accVioli[0] = new Accessori("resina");
  accVioli[1] = new Accessori("arc");
  accVioli[2] = new Accessori("costella");
  
  violi = new Instrument("Violí Stradivarius", 15, 2.2, accVioli);
  
  // Instruments de tecla
  accPiano = new Accessori[1];
  accPiano[0] = new Accessori("banqueta");
  
  piano = new Tecla("Steinway & Sons", 12876, 240.0, accPiano, true);
  
  teclat = new Tecla("Moog One", 4321, 32.8, new Accessori[0], true);  // instrument sense accessoris
  
  // Instruments de vent
  
  flauta = new Vent("Flauta baixa Yamaha", 236, 1.8, new Accessori[0], false);
  
  accTrombo = new Accessori[2];
  accTrombo[0] = new Accessori("embocadura Bach");
  accTrombo[1] = new Accessori("oli per la vara");

  trombo = new Vent("Trombó Yamaha 235", 2255, 3.2, accTrombo, true);
  
  // Instruments de percussio
  accVibrafon = new Accessori[3];
  accVibrafon[0] = new Accessori("baquetes dures");
  accVibrafon[1] = new Accessori("baquetes toves");
  accVibrafon[2] = new Accessori("tamboret");
  
  vibrafon = new Percussio("Vibrafon Yamaha", 1234, 60.0, accVibrafon, false);
  
  parc = new Instrument[6];
  parc[0] = violi;
  parc[1] = piano;
  parc[2] = teclat;
  parc[3] = flauta;
  parc[4] = trombo;
  parc[5] = vibrafon;
  
  for (int i=0; i < parc.length; i++) {
    println(parc[i].toString());
  }
}

void draw() {
  
}
