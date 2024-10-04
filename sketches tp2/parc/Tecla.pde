class Tecla extends Instrument {
  private boolean afinat;
  
  Tecla(String nom, int numSerie, float pes, Accessori[] accessoris, boolean afinat) {
    super(nom, numSerie, pes, accessoris);
    this.afinat = afinat;
  }
  
  public boolean getAfinat() {
    return afinat;
  }
  
  public void setAfinat(boolean afinat) {
    this.afinat =  afinat;
  }
  
  public String toString() {
    return super.toString() + ", " + (afinat ? "" : "no ") + "està afinat";
  }
}
