class Vent extends Instrument {
  private boolean desinfectat;
  
  Vent(String nom, int numSerie, float pes, Accessori[] accessoris, boolean desinfectat) {
    super(nom, numSerie, pes, accessoris);
    this.desinfectat = desinfectat;
  }
  
  public boolean getDesinfectat() {
    return desinfectat;
  }
  
  public void setDesinfectat(boolean desinfectat) {
    this.desinfectat =  desinfectat;
  }
  
  public String toString() {
    return super.toString() + ", " + (desinfectat ? "" : "no ") + "està desinfectat";
  }
}
