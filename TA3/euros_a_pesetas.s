    .data # Sección declaración de datos.
  msgentrada: .asciiz "Introduzca el importe en pesetas: "
  msgsalida:  .asciiz "\nEl importe en euros es: "

    .text
main:
  li  $v0, 4 # Imprimo cadena de texto.
  la  $a0, msgentrada  # Dirección de memoria de la cadena.
  syscall

  li  $v0, 5 # Leo entero.
  syscall

  mtc1  $v0, $f4 # Realizo una copia cruda de $v0 en $f4.

  cvt.s.w $f6, $f4  # Convierto $f4 en un flotante simple en $f6.
  li.s  $f8, 166.386  # Cargo 1€ en pesetas.
  div.s $f10, $f6, $f8  # Divido el número de pesetas entre la conversión de un euro a pesetas ($f10 = $f6 / $f8).

  li  $v0, 4  # Imprimo cadena de texto.
  la  $a0, msgsalida  # Dirección de memoria de la cadena.
  syscall

  mov.s  $f12, $f10
  li  $v0, 2 # Imprimo un flotante.
  syscall
  # Realizamos una salida limpia del sistema.
  li $v0, 10
  syscall
# END


