class Accessori {
  private String nom;
  
  Accessori(String nom) {
    this.nom = nom;
  }
  
  public String toString() {
    return "Accessori: " + nom;
  }
  
  public String getNom() {
    return nom;
  }
  
  public void setNom(String nom) {
    this.nom = nom;
  }
}
