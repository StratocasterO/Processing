//Instrument(String nom, int numSerie, float pes, Accessori[] accessoris)
import java.util.Vector;

Parc parc;
Instrument violi, piano, teclat, flauta, trombo, vibrafon, marimba;
Vector<Accessori> accGuitarra, accPiano, accTrombo, accVioli, accVibrafon, accMarimba;

void setup() {
  // Instrument genèric -> ja no existeixen!
  // violi = new Instrument("Violí Stradivarius", 15, 2.2, accVioli);
  
  // Instruments de tecla
  accPiano = new Vector<Accessori>();
  accPiano.add(new Accessori("banqueta"));
  
  piano = new Tecla("Steinway & Sons", 12876, 240.0, accPiano, false);
  
  teclat = new Tecla("Moog One", 4321, 32.8, new Vector<Accessori>(), true);  // instrument sense accessoris
  
  // Instruments de vent
  
  flauta = new Vent("Flauta baixa Bach", 236, 1.8, new Vector<Accessori>(), false);
  
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
  
  parc = new Parc(); //<>//
  parc.add(piano);
  parc.add(teclat);
  parc.add(flauta);
  parc.add(trombo);
  parc.add(vibrafon);
  parc.add(marimba);
  
  println(parc); // el mètode println() invoca automàticament el mètode .toString() de l'objecte que li passes
  parc.showDetails();
  println();
  parc.showPes();
  println();
  parc.showAcc();
  println();
  parc.showAfinacio();
  println();
  parc.showFamilies();
}

void draw() {
  // not necessary here
}
