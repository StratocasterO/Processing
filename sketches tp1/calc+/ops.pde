int suma(int a, int b) {
  return a + b;
}

int resta(int a, int b) {
  return suma(a, -b);
}

int multi(int a, int b) {
  int res = 0;
  for (int i = 0; i < a; i ++) res = suma(res, b);
  return res;
}

int pote(int a, int b) {
  int res = 1;
  for (int i = 0; i < b; i ++) res = multi(res, a);
  return res;
}
