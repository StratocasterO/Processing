/* TODO afegir que agafi les 5 imatges més properes
        posar al ChatGPT que parteixi d'aquest codi
        afegir reacció a la música

   TODO perquè funcioni s'ha de descarregar un conjunt
        d'imatges (p.e. un dataset de flors) i posar-les
        a la carpeta ./data/flors/
*/



PImage target;
PImage[] tiles;
int numTiles = 3600; // nombre d’imatges petites
int tileSize = 10;   // mida de cada "píxel" mosaic
float colorJitter = 20; // intensitat de variació aleatòria (0 = sense variació)

color[] avgColors;      // mitjanes de color de les imatges
color[][] targetColors; // matriu de colors de la imatge objectiu

void setup() {
  size(600,1000);

  target = loadImage("target.jpg");
  target.resize(width/tileSize, height/tileSize);
  
  avgColors = new color[numTiles];
  
  // --- 1. Carreguem o calculem els colors mitjans de les imatges
  if (existsFile("average_colors.txt")) {
    println("Llegint colors mitjans des d'arxiu...");
    loadAverageColors("average_colors.txt");
  } else {
    println("Calculant colors mitjans...");
    calculateAndSaveAverageColors("flors/flor (", ").jpg", "average_colors.txt");
  }
  
  // --- 2. Carreguem o calculem els colors de la imatge target
  if (existsFile("target_colors.txt")) {
    println("Llegint colors de target...");
    loadTargetColors("target_colors.txt");
  } else {
    println("Calculant colors de la target...");
    saveTargetColors("target_colors.txt");
  }

  // --- 3. Només ara carreguem les imatges (una vegada)
  println("Carregant imatges petites...");
  tiles = new PImage[numTiles];
  for (int i = 0; i < numTiles; i++) {
    String file = "flors/flor (" + nf(i+1) + ").jpg";
    tiles[i] = loadImage(file);
  }

  noLoop();
  println("Configuració acabada.");
}

void draw() {
  background(0);
  
  for (int x = 0; x < target.width; x++) {
    for (int y = 0; y < target.height; y++) {
      color c = targetColors[x][y];
      PImage tile = getClosestTile(c);
      image(tile, x * tileSize, y * tileSize, tileSize, tileSize);
    }
  }
  println("Mosaic completat!");
}

// -------------------------------
// FUNCIONS DE SUPORT
// -------------------------------

boolean existsFile(String filename) {
  java.io.File f = new java.io.File(dataPath(filename));
  return f.exists();
}

// Desa els colors mitjans de totes les imatges petites
void calculateAndSaveAverageColors(String prefix, String suffix, String filename) {
  String[] lines = new String[numTiles];
  
  for (int i = 0; i < numTiles; i++) {
    String file = prefix + nf(i+1) + suffix;
    PImage img = loadImage(file);
    color avg = averageColor(img);
    avgColors[i] = avg;
    
    lines[i] = int(red(avg)) + "," + int(green(avg)) + "," + int(blue(avg));
    println("Analitzada: " + file);
  }
  
  saveStrings(filename, lines);
  println("Arxiu de colors mitjans desat com: " + filename);
}

// Llegeix els colors mitjans des del fitxer (sense carregar imatges)
void loadAverageColors(String filename) {
  String[] lines = loadStrings(filename);
  for (int i = 0; i < lines.length && i < numTiles; i++) {
    String[] parts = split(lines[i], ',');
    avgColors[i] = color(int(parts[0]), int(parts[1]), int(parts[2]));
  }
}

// Desa els colors de la imatge target (un per píxel)
void saveTargetColors(String filename) {
  targetColors = new color[target.width][target.height];
  String[] lines = new String[target.width * target.height];
  int idx = 0;
  
  for (int x = 0; x < target.width; x++) {
    for (int y = 0; y < target.height; y++) {
      color c = target.get(x, y);
      targetColors[x][y] = c;
      lines[idx++] = int(red(c)) + "," + int(green(c)) + "," + int(blue(c));
    }
  }
  saveStrings(filename, lines);
  println("Arxiu de target desat com: " + filename);
}

// Carrega els colors de la imatge target
void loadTargetColors(String filename) {
  String[] lines = loadStrings(filename);
  targetColors = new color[target.width][target.height];
  int idx = 0;
  
  for (int x = 0; x < target.width; x++) {
    for (int y = 0; y < target.height; y++) {
      String[] parts = split(lines[idx++], ',');
      targetColors[x][y] = color(int(parts[0]), int(parts[1]), int(parts[2]));
    }
  }
}

// Calcula color mitjà d’una imatge
color averageColor(PImage img) {
  img.loadPixels();
  float r = 0, g = 0, b = 0;
  for (color px : img.pixels) {
    r += red(px);
    g += green(px);
    b += blue(px);
  }
  int total = img.pixels.length;
  return color(r/total, g/total, b/total);
}

// Retorna la imatge amb color més proper (amb variació)
PImage getClosestTile(color targetColor) {
  float bestDist = 999999;
  int bestIndex = 0;
  
  for (int i = 0; i < numTiles; i++) {
    float d = dist(red(targetColor), green(targetColor), blue(targetColor),
                   red(avgColors[i]), green(avgColors[i]), blue(avgColors[i]));
    d += random(-colorJitter, colorJitter);
    if (d < bestDist) {
      bestDist = d;
      bestIndex = i;
    }
  }
  
  return tiles[bestIndex];
}

