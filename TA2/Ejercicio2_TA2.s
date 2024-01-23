    .text
main:
    add $t3, $zero, $zero   # Se inicializa $t3 = 0

    # Verifica si $t1 y $t2 son <= 0
    blez    $t1, end # Salta a end, si $t1 es <= 0
    blez    $t2, end # Salta a end, si $t2 es <= 0

    addi    $t4, $zero, 1   # Inicializar $t4 = 1
loop:
    blt     $t4, $t1, check_divisible   # Si $t4 < $t1, salta a check_divisible
    b	    end     # Salta a end, si $t4 > $t1
check_divisible:
    div		$t4, $t2			# Divide $t4 entre $t2
    mfhi	$t5     # Obtiene el residuo de la división y lo almacena en $t5
    beq		$t5, $zero, increment   # Si el residuo es zero, salta a increment
    addi    $t4, $t4, 1 # Si el residuo no es cero, $t4 incrementa en 1
    b		loop			# Salto a loop
increment:
    addi    $t3, $t3, 1 # Incrementa el contador en 1
    addi    $t4, $t4, 1 # Incrementa $t4 en 1
    b		loop			# Salto a loop
end:
    # Fin del programa
    
    