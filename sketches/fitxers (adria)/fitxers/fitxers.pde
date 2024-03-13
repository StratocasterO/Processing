String infileName = "dies.txt"; //Fitxer dins de la carpeta `data`
String intFile = "numeros.txt"; //Fitxer dins de la carpeta `data`

String outFileName = "seid.txt"; //Fitxer amb el text de 'dies.txt' al revés

String[] linesIn = loadStrings(infileName); //Llegir les Strings del fitxer. Separador '\n'
String[] linesOut = new String[linesIn.length];

String[] intIn = loadStrings(intFile);
int[] numbers = new int[intIn.length];


for(int i=0; i<linesIn.length;i++){
  //Reverse file
  linesOut[i] = linesIn[linesIn.length-1-i]; 
}
for(int i=0; i<intIn.length;i++){
  //int[] array from file
  numbers[i] = int(intIn[i]);
}

println(numbers);

saveStrings(outFileName, linesOut); //Crear un nou fitxer
