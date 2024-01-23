# #include <iostream>

# int main(int argc, char** argv) {

#  std::cout << "Programa para repasar las tablas de multiplicar.\n";
#  int n; // numero del que quiero repasar la tabla
#  do {
#    std::cout<<"¿Qué tabla deseas repasar? Introduce un número (0 para salir): ";
#    std::cin >> n;
#    if (n == 0) break; // si introduce un 0 sale del bucle
#    int aciertos = 0; // incializamos el numero de aciertos
#    for (int i = 1; i <= 10; i++) {
#      std::cout << i << " x " << n << " ? ";
#      int resultado;
#      std::cin >> resultado;
#      if (resultado == (i * n)) {
#        aciertos++;
#      }
#    }
#    int porcentaje = aciertos * 10;
#    std::cout << "Tu porcenaje de aciertos es del " << porcentaje << "%\n";
#  } while (n != 0);
#  std::cout << "Termina el programa.\n";
# }

# Asignación de variables
# n           ->  $s0
# aciertos    ->  $s1
# i           ->  $s2
# resultado   ->  $s3
# porcentaje  ->  $s4

    .data
msgTitulo:          .asciiz "Programa para repasar las tablas de multipliccar.\n"
msgTabla:           .asciiz "¿Qué tabla deseas repasar? Introduce un número (0 para salir): "
msgX:               .asciiz " x "
msginterrogacion:   .asciiz " ? "
msgAciertos:        .asciiz "Tu porcentaje de aciertos es del "
msgPorcentaje:      .asciiz "%\n"
msgTermina:         .asciiz "Termina el programa"

    .text
main:
   li  $v0, 4
   la  $a0, msgTitulo
   syscall

do_while:
  li  $v0, 4
  la  $a0, msgTabla
  syscall

  li  $v0, 5
  syscall
  move  $s0, $v0

  beq   $s0, $zero, do_while_fin
  move  $s1, $zero 

  li    $s2, 1
for:
  bgt		$s2, 10, for_fin

  li    $v0, 1
  move  $a0, $s2
  syscall

  li    $v0, 4
  la    $a0, msgX
  syscall

  li    $v0, 1
  move  $a0, $s0
  syscall

  li    $v0, 4
  la    $a0, msginterrogacion
  syscall

  li    $v0, 5
  syscall
  move  $s3, $v0

if:
  mul   $t0, $s2, $s0
  bne   $s3, $t0, if_fin
  addi  $s1, 1

if_fin:

  addi  $s2, 1
  b		  for			
  
for_fin:

  mul   $s4, $s1, 10
  li    $v0, 4
  la    $a0, msgAciertos
  syscall

  li    $v0, 1
  move  $a0, $s4
  syscall

  li    $v0, 4
  la    $a0, msgPorcentaje
  syscall

do_while_fin:
  li    $v0, 4
  la    $a0, msgTermina
  syscall

  li    $v0, 10
  syscall