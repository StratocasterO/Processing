//Instrument(String nom, int numSerie, float pes, Accessori[] accessoris)
import java.util.Vector;

Vector<Instrument> parc;
Instrument violi, piano, teclat, flauta, trombo, vibrafon, marimba;
Vector<Accessori> accGuitarra, accPiano, accTrombo, accVioli, accVibrafon, accMarimba;

void setup() {
  // Instrument genèric -> ja no existeixen!
  // violi = new Instrument("Violí Stradivarius", 15, 2.2, accVioli);
  
  // Instruments de tecla
  accPiano = new Vector<Accessori>();
  accPiano.add(new Accessori("banqueta"));
  
  piano = new Tecla("Steinway & Sons", 12876, 240.0, accPiano, true);
  
  teclat = new Tecla("Moog One", 4321, 32.8, new Vector<Accessori>(), true);  // instrument sense accessoris
  
  // Instruments de vent
  
  flauta = new Vent("Flauta baixa Yamaha", 236, 1.8, new Vector<Accessori>(), false);
  
  accTrombo = new Vector<Accessori>();
  accTrombo.add(new Accessori("embocadura Bach"));
  accTrombo.add(new Accessori("oli per la vara"));

  trombo = new Vent("Trombó Yamaha 235", 2255, 3.2, accTrombo, true);
  
  // Instruments de percussio
  accVibrafon = new Vector<Accessori>();
  accVibrafon.add(new Accessori("baquetes dures"));
  accVibrafon.add(new Accessori("baquetes toves"));
  accVibrafon.add(new Accessori("tamboret"));
  
  vibrafon = new Percussio("Vibrafon Yamaha", 1234, 60.0, accVibrafon, true);
  
  // Instrument de percussio afinable
  
  accMarimba = new Vector<Accessori>();
  accMarimba.add(new Accessori("baquetes"));
  accMarimba.add(new Accessori("llima per afinar"));
  
  marimba = new PercuCroma("Marimba Adams", 3142, 55.2, accMarimba, false, true);
  
  parc = new Vector<Instrument>();
  parc.add(piano);
  parc.add(teclat);
  parc.add(flauta);
  parc.add(trombo);
  parc.add(vibrafon);
  parc.add(marimba);
    
  for (int i = 0; i < parc.size(); i++) {
    println(parc.get(i).toString());
  }
  
  println("\n " + getPes(parc));
  println("\n " + getAcc(parc));
  println("\n " + getAfinacio(parc));
}

void draw() {
  // not necessary here
}

String getPes(Vector<Instrument> parc) {
  float pes = 0;
  for (int i = 0; i < parc.size(); i++) pes += parc.get(i).getPes();
  return "El pes total del parc d'instruments és de " + pes + " kg";
}

String getAcc(Vector<Instrument> parc) {
  int acc = 0;
  for (int i = 0; i < parc.size(); i++) acc += parc.get(i).accessoris.size();
  return "El nombre total d'accessoris al parc d'instruments és de " + acc;
}

String getAfinacio(Vector<Instrument> parc) {
  int desafinats = 0;
  for (int i = 0; i < parc.size(); i++) ; // TODO isAfinable?
  return "todo";
}

// TODO el mateix pero per saber els instruments de cada familia
