import java.util.Vector;

class Percussio extends Instrument implements Plegable {
  private boolean plegable;
  
  Percussio(String nom, int numSerie, float pes, Vector<Accessori> accessoris, boolean plegable) {
    super(nom, numSerie, pes, accessoris);
    this.plegable = plegable;
  }
  
  public boolean getPlegable() {
    return plegable;
  }
  
  public void setPlegable(boolean plegable) {
    this.plegable =  plegable;
  }
  
  public String toString() {
    return super.toString() + ", " + (plegable ? "sí" : "no") + " és plegable";
  }
}
