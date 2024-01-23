# Primera opción para hacer un while (Invertir condición)
# suma = $s0
# numero = $v0
  .text  # Sección de código de usuario

main:
  move  $s0, $zero

  # Leo entero por consola
  li  $v0, 5
  syscall # Entero en $v0

while:
  # Salimos del while si numero <= 0
  blez  $v0, whileFin
  add   $s0, $s0, $v0

  # Leo entero por consola
  li    $v0, 5
  syscall # Entero en $v0
  b     while # Vuelvo a la condición
whileFin:
  # Después del while



#=============Programa en C++================

#Sumar 100 enteros
# suma = 0;
# std::cin >> numero;
# while (numero > 0) {
#   suma += numero;
#   std::cin >> numero;
# }
# Después del while
