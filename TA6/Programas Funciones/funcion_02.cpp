// Programa con funciones

#include <iostream>

// devuelve 1 si a es divisible entre b, 0 en caso contrario
int divisible(int a, int b) {
  int resto = a % b;
  int divisible = 0;
  if (resto == 0) {
    divisible = 1;
  }
  return divisible;
}

// devuelve el mayor divisor de x
int mayorDivisor(int x) {
  for (int d = (x-1); d > 1; d--) {
    int divis = divisible(x,d);
    if (divis) {
      return d;
    }
  }
  return 1;
}

int main() {
  int n;
  std::cout << "Introduce numero: ";
  std::cin >> n;
  int mayorDiv = mayorDivisor(n);
  std::cout << mayorDiv << " es mayor divisor de " << n << "\n";
}
