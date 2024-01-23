# Segunda opción para hacer un while (Poner la condición al final sin invertirla)
# suma = $s0
# numero = $v0
  .text
main:
  move  $s0, $zero # suma = 0
  # Leo entero por consola
  li    $v0, 5
  syscall # Entero a $v0
  # Saltamos a la condición del while
  b     whileCondicion
while:
  add $s0, $s0, $v0
  # Leo entero por consola
  li  $v0, 5
  syscall # Entero a $v0
whileCondicion:
  # Repetimos si numero > 0
  bgtz  $v0, while
whileFin:
  # Después del while


#=============Programa en C++================

# Sumar 100 enteros
# suma = 0;
# std::cin >> numero;
# while (numero > 0) {
#   suma += numero;
#   std::cin >> numero;
# }
# Después del while
