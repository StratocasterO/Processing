class Instrument {
  private String nom;
  private int numSerie;
  private float pes;
  private Accessori[] accessoris;

  Instrument() {
    // default constructor (useful when instantiating without parameters, but not necessary)
  }
  
  Instrument(String nom, int numSerie, float pes, Accessori[] accessoris) {
    this.nom = nom;
    this.numSerie = numSerie;
    this.pes = pes;
    this.accessoris = accessoris;
  }

  public String toString() {
    return "Instrument: " + nom + ", numero de serie: " + numSerie + ", pes: " + pes + " kg, accessoris: " + this.getAccessoris();
  }

  public String getNom() {
    return nom;
  }
  
  public void setNom(String nom) {
    this.nom =  nom;
  }
  
  public String getAccessoris() {
    if (this.accessoris.length == 0) return "cap"; // si no té accessoris
    
    String accessoris = "";
    
    for (int i = 0; i < this.accessoris.length; i++) {
      accessoris += this.accessoris[i].getNom();
      if (i != this.accessoris.length - 1) accessoris += ", ";  // no afegeix separador a l'últim accessori
    }
    
    return accessoris; 
  }
}
