    .data # Sección declaración de datos.
  msgentrada: .asciiz "Introduzca el radio de una círculo: "
  msgsalida:  .asciiz "\nEl área de este círculo es: "

    .text # Sección de código del usuario.
main: 
  li  $v0, 4 # Imprimir cadena.
  la  $a0, msgentrada # Dirección de memoria de la cadena.
  syscall
  li  $v0, 5 # Leo entero.
  syscall

  mtc1  $v0, $f4  # Hago copia "cruda" de $v0.
  cvt.s.w $f6, $f4  # Almaceno la copia cruda en $f2.

  li.s  $f8, 3.14159 # Cargo número pi

  mul.s $f10, $f6, $f6 # Multiplico el radio por sí mismo.
  mul.s $f12, $f8, $f10 # Multplico PI * R^2.

  mov.s $f14, $f12 # Muevo el resultado del área a $f12
  li $v0, 4 # Imprimir cadena.
  la $a0, msgsalida # Dirección de memoria de la cadena.
  syscall
  li  $v0, 2  # Imprimir flotante.
  syscall

  # Salida limpia del sistema
  li $v0, 10
  syscall