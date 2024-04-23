String infileName = "alemany.txt"; // fitxer dins de la carpeta `data`

String abc = "abcdefghijklmnopqrstuvwxyz";
char c1, c2;
String s1, s2;
String[] linesIn;

void setup(){
  noLoop();
  size(500, 850);
  linesIn = loadStrings(infileName); // llegir les Strings del fitxer. Separador '\n'
  background(0);
  
   for (int i=0; i<abc.length(); i++){
     text(abc.charAt(i), 25, 18+(height/26)*i);
   }
   for (int i=0; i<abc.length(); i++){
     text(abc.charAt(i), width-25, 18+(height/26)*i);
   }
}

void draw(){
  stroke(255, 2);
  for(int i=0; i<linesIn.length; i++){
     for (int j=0; j<linesIn[i].length(); j++){
       
       if(j<linesIn[i].length() - 1){
         c1 = linesIn[i].charAt(j);
         c2 = linesIn[i].charAt(j+1);
       }
       
       // no són espais o salts de línia
       if(c1 != ' ' || c1 != '\n' || c2 != ' ' || c2 != '\n'){
         s1 = str(c1);
         s2 = str(c2);
         
         if (c1 >= 65 && c1 <= 90 && c2 >= 65 && c2 <= 90){ // és majuscula
           s1 = str(c1).toLowerCase();
           s2 = str(c2).toLowerCase();
         }
         
         if (c1 >= 97 && c1 <= 122 && c2 >= 97 && c2 <= 122){ // és minúscula
           int pos1 = 13 + (height/26) * abc.indexOf(c1);
           int pos2 = 13 + (height/26) * abc.indexOf(c2);
           line(40, pos1, width-38, pos2);
         }
       }      
     }
   }
 }
