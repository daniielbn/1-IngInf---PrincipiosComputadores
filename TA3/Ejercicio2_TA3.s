    .data
  msgdividendo:  .asciiz "Escribe un dividendo: "
  msgdivisor:    .asciiz "\nEscribe un divisor: "
  msgerror:      .asciiz "\nEl error ha sido: "
  msgresultado:  .asciiz "\nEl resultado de esta división es: "
  msgindeterminacion: .asciiz "\nIndeterminación."
  msginfinitopos:     .asciiz "\nInfinito positivo: "
  msginfinitoneg:     .asciiz "\nInfinito negativo: "

    .text
main:
  li  $v0, 4 # Imprimir cadena de texto.
  la  $a0, msgdividendo # Dirección de memoria de la cadena de texto.
  syscall

  li  $v0, 6 # Leer un flotante(dividendo).
  syscall

  mov.s $f2, $f0  # Muevo el flotante leído.

  li  $v0, 4 # Imprimir cadena de texto.
  la  $a0, msgdivisor # Dirección de memoria de la cadena de texto.
  syscall

  li  $v0, 6 # Leer un flotante(divisor).
  syscall

  mov.s $f4, $f0  # Muevo el flotante leído.

  li.s  $f30, 0.0 # Cargo en $f30 el 0.

  # Comprobar que el divisor no sea cero.
  c.eq.s  $f4, $f30
  bc1t  error # Si el divisor el cero, salta a error.

  div.s $f6, $f2, $f4 # Divido dividendo ($f2) entre divisor ($f4) y almaceno el resultado en $f6.
  mul.s $f8, $f4, $f6 # Multiplico el divisor por el cociente.
  sub.s $f14, $f2, $f8. # Restar el resultado anterior del dividendo.

  li.s  $f16, 0.0000001  # Cargamos un número positivo pequeño para compararlo con el resto(-).

if:
  c.le.s  $f14, $f16 # $f14 <= 0.000000000000001.
  bc1t    else  # Si el dividendo es menor o igual que el número que hemos cargado salta al else
  
  li  $v0, 4 # Imprimir cadena de texto.
  la  $a0, msginfinitopneg # Dirección de la cadena de texto.
  syscall
  b		resultado			# Salta a resultado.

else:
  c.le.s $f14, $f16  # Si $f14 <= 0.0000000000000001.
  bc1f  resultado
  
  li  $v0, 4 # Imprimir cadena de texto.
  la  $a0, msginfinitopos  # Dirección de la cadena de texto.
  syscall
  b		resultado			# Salta a resultado.
  
resultado:
  mov.s $f12, $f6 # Muevo el cociente a $f12 (Parámetros de salida).
  li  $v0, 2  # Imprimir flotante.
  syscall
  b		exit			# Salto a exit.
# Mensaje de error.
error:
  li  $v0, 4  # Imprimir cadena de texto.
  la  $a0, msgindeterminacion  # Dirección de memoria de la cadena de texto.
  syscall
  b		exit			# Salto a exit.
# Salida limpia del sistema.
exit:
  li  $v0, 10
  syscall
