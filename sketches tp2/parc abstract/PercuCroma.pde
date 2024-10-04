class PercuCroma extends Percussio implements Afinable {
  private boolean afinat;
  
  PercuCroma(String nom, int numSerie, float pes, Vector<Accessori> accessoris, boolean plegable, boolean afinat) {
    super(nom, numSerie, pes, accessoris, plegable);
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
