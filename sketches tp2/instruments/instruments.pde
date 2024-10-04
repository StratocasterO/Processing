Instrument guitarra1, guitarra2;
Instrument[] teclats;

void setup() {
  guitarra1 = new Instrument("Fender Telecaster", 12345678, 4.5, "A114");
  guitarra2 = new Instrument("Gibson Les Paul", 999999999, 9.0, "A203");
  
  guitarra1.setPes(5.2);
  println("L'instrument " + guitarra1.getNom() + " pesa " + guitarra1.getPes() + " km");

  teclats = new Instrument[4];
  for (int i = 0; i < teclats.length; i++) {
    teclats[i] = new Instrument(); // possible perquè hem afegit un constructor per defecte
  }
}
