# suma = $s0
# i = $t0 (No hay llamadas fuera de esa función por eso se usa el registro $t0)
  .text
main:
  move $v0, $zero # Igualamos suma = 0
  move $t0, $zero # Inicialización de i
for:
  # Condición invertida / salimos si i > 100
  bgt		$t0, 100, forFin
  add   $s0, $s0, $t0

  addi	$t0, $t0, 1 # Actualización i++
  b		  for # Vuelvo a la condición
forFin:
  # Después del for

# ==============Programa en C++================
# // Sumar 100 enteros
# suma = 0;
#
# for(int i = 0; i <= 100; i++) {
#   suma += 1;
# }
# //Después del for
  