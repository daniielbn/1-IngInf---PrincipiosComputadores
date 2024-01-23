  .data   # Sección declaración de datos
entero: .asciiz "Introduzca un entero: "
suma:   .asciiz "La suma es: "
carro:  .asciiz "\n"

  .text   # Sección de código de usuario
main:
  li  $v0, 4  # $v0 = 4, imprime cadena de texto
  la  $a0, entero # $a0 = dirección de memoria de la cadena a imprimir
  syscall
  # Leo el primer entero y lo almaceno en $t1
  li  $v0, 5  # $v0 = 5, leer un entero
  syscall
  move  $t0, $v0  # Almaceno el entero leido en $t0
  li  $v0, 4 # $v0 = 4, imprime cadena de texto
  la  $a0, entero # $a0 = dirección de memoria de a cadena a imprimir
  syscall
  # Leo el segundo entero y lo almaceno en $t1
  li  $v0, 5 # $v0 = 5, leer un entero
  syscall
  move $t1, $v0 # Almaceno el segundo entero en $t1
  # Hacemos la suma
  add  $t3, $t0, $t1  # $t3 = $t0 + $t1
  li  $v0, 4 # $v0 = 4, imprime una cadena de texto
  la  $a0, suma # $a0 = dirección de memoria de la cadena a imprimir
  syscall
  li  $v0, 1 # Entero a imprimir
  move $a0, $t3 # $a0 = entero a imprimir
  syscall
  li  $v0, 4 # $v0 = 4, imprime cadena de texto
  la  $a0, carro
  syscall
  # Se hace una salida limpia del sistema
  li  $v0, 10
  syscall
# END