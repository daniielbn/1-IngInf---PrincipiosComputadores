// Programa para evaluar polinomio tercer grado

#include <iostream>
int main(void) {
  float a,b,c,d;
  std::cout << "\nEvaluacion polinomio f(x) = a x^3  + b x^2 + c x + d  en un intervalo [r,s]\n";
  std::cout << "\nIntroduzca los valores de a,b,c y d (separados por retorno de carro):\n";
  std::cin >> a;
  std::cin >> b;
  std::cin >> c;
  std::cin >> d;
  int r,s;
  do {
    std::cout << "Introduzca [r,s] (r y s enteros, r <= s)  (separados por retorno de carro):\n";
    std::cin >> r;
    std::cin >> s;
  } while (r > s);
  for (int x = r ; x <= s ; x++) {
    float f = a*x*x*x + b*x*x + c*x + d;
    if (f >= 2.1) {
      std::cout << "\nf(" << x << ") = " << f;
    }
  }
  std::cout << "\n\nTermina el programa\n";
}
