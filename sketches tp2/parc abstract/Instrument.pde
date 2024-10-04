/* Canvis de Array a Vector:
       Accessori[]  ->  Vector<Accessori>
       .lenght      ->  .size()
       [i]          ->  get(i)
*/
import java.util.Vector;

abstract class Instrument {
  private String nom;
  private int numSerie;
  private float pes;
  private Vector<Accessori> accessoris; // els vectors són arrays sense dimensió definida

  Instrument() {
    // default constructor (necessary for inheritance)
  }
  
  Instrument(String nom, int numSerie, float pes, Vector<Accessori> accessoris) {
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
  
  public float getPes() {
    return pes;
  }
  
  public void setPes(float pes) {
    this.pes =  pes;
  }
  
  public String getAccessoris() {
    if (this.accessoris.size() == 0) return "cap"; // si no té accessoris //<>//
    
    String accessoris = "";
    
    for (int i = 0; i < this.accessoris.size(); i++) {
      accessoris += this.accessoris.get(i).getNom();
      if (i != this.accessoris.size() - 1) accessoris += ", ";  // no afegeix separador a l'últim accessori
    }
    
    return accessoris; 
  }
}
