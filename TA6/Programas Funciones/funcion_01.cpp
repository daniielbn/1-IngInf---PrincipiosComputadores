// Programa con funciones

#include <iostream>

int sumaNumeros(int a, int b) {
  return a + b;
}

int main() {
  std::cout << "Suma de numeros\n";
  
  int i = 4;
  int j = 5;
  int suma = sumaNumeros(i, j);
  
  std::cout << i << " + " << j << " = " << suma << "\n";
}
