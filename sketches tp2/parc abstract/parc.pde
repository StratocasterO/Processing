import java.util.Vector;

class Parc {
  private Vector<Instrument> instruments;
  
  Parc() {
    instruments = new Vector<Instrument>();
  }

  public void add(Instrument instrument) {
    instruments.add(instrument);
  }

  public String toString() {
    if (this.instruments.size() == 0) return "No hi ha instruments al parc";
    String text = "";
    for (int i = 0; i < this.instruments.size(); i++) text += "  - " + instruments.get(i).getNom() + "\n";
    return "Al parc hi ha els següents instruments: \n" + text;
  }

  public void showDetails() {
    for (int i = 0; i < this.instruments.size(); i++) println(this.instruments.get(i).toString());
  }

  public void showPes() {
    float pes = 0;
    for (int i = 0; i < this.instruments.size(); i++) pes += this.instruments.get(i).getPes();
    println("El pes total del parc d'instruments és de " + pes + " kg");
  }

  public void showAcc() {
    int acc = 0;
    for (int i = 0; i < this.instruments.size(); i++) acc += this.instruments.get(i).accessoris.size();
    println("El nombre total d'accessoris al parc d'instruments és de " + acc);
  }

  public void showAfinacio() {
    int afinats = 0; //<>//
    int desafinats = 0;
    for (int i = 0; i < this.instruments.size(); i++) {
      if (this.instruments.get(i) instanceof Afinable) {
        //if (this.instruments.get(i).getAfinat()) afinats++; ERROR: diu que no existeix la funció getAfinat()
        //else desafinats++;
      }
    }
    println("Instruments afinats: " + afinats);
    println("Instruments desafinats: " + desafinats);
    println("% d'afinació del parc: " + (desafinats == 0 ? "100" : (100 * afinats / desafinats)));
  }

  public void showFamilies() {
    int perc = 0;
    int percAfi = 0;
    int vent = 0;
    int tecla = 0;
    for (int i = 0; i < this.instruments.size(); i++) {
      if (this.instruments.get(i) instanceof Percussio) perc++;
      if (this.instruments.get(i) instanceof PercuCroma) percAfi++;
      if (this.instruments.get(i) instanceof Vent) vent++;
      if (this.instruments.get(i) instanceof Tecla) tecla++;
    }
    println("Al parc hi ha " + perc + " instruments de percussió (" + percAfi + " dels quals afinables), " + vent + " de vent i " + tecla + " de tecla");
  }
}
