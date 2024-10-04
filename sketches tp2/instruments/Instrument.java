class Instrument {
  private String nom;
  private int numSerie;
  private float pes;
  private String aula;
 
  Instrument() {}
 
  Instrument(String nom, int numSerie, float pes, String aula) {
    this.nom = nom;
    this.numSerie = numSerie;
    this.pes = pes;
    this.aula = aula;
  }
 
  public String getNom() { return nom; }
  public void setNom(String nom) { this.nom = nom; } 
 
  public int getNumSerie() { return numSerie; }
  public void setNumSerie(int numSerie) { this.numSerie = numSerie; } 
 
  public float getPes() { return pes; }
  public void setPes(float pes) { this.pes = pes; } 
 
  public String getAula() { return aula; }
  public void setAula(String aula) { this.aula = aula; } 
}

// guardant l'arxiu com a .java podem usar private i public, si no Processing ho fa tot public
