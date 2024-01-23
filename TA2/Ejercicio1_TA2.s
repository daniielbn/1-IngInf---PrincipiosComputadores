    .data
msg_min: .asciiz "El mínimo es: "
msg_max: .asciiz "El máximo es: "
msg_sum: .asciiz "La suma es: "

    .text
main:
    # Inicialización de los registros
    li $t1, 10 # Primer número
    li $t2, 5 # Segundo número
    
    # Cálculo del mínimo
    slt $t3, $t1, $t2 # Si $t1 es menor que $t2, $t3 = 1
    bne $t3, $zero, min_t1 # Si $t3 = 1, salta a min_t1
    add $t3, $zero, $t2 # Si $t3 = 0, $t3 = $t2
    j maximo # Salta a maximo
    
min_t1:
    add $t3, $zero, $t1 # $t3 = $t1
    j maximo # Salta a maximo
    
maximo:
    # Cálculo del máximo
    slt $t4, $t1, $t2 # Si $t1 es menor que $t2, $t4 = 0
    bne $t4, $zero, max_t2 # Si $t4 = 1, salta a max_t2
    add $t4, $zero, $t2 # Si $t4 = 0, $t4 = $t2
    j suma # Salta a suma
    
max_t2:
    add $t4, $zero, $t1 # $t4 = $t1
    
suma:
    # Cálculo de la suma
    add $t5, $zero, $zero # Inicializa $t5 en 0
    add $t6, $zero, $t3 # $t6 es una copia de $t3
loop:
    add $t5, $t5, $t6 # Suma el valor de $t6 a $t5
    addi $t6, $t6, 1 # Incrementa $t6 en 1
    ble $t6, $t4, loop # Si $t6 <= $t4, salta a loop
    
    # Imprime el mínimo, el máximo y la suma
    la $a0, msg_min # Carga la cadena del mensaje del mínimo en $a0
    li $v0, 4 # Carga el código de la llamada al sistema para imprimir cadena en $v0
    syscall # Imprime el mensaje del mínimo
    
    move $a0, $t3 # Mueve el valor de $t3 (el mínimo) a $a0
    li $v0, 1 # Carga el código de la llamada al sistema para imprimir entero en $v0
    syscall # Imprime el valor del mínimo
    
    la $a0, msg_max # Carga la cadena del mensaje del máximo en $a0
    li $v0, 4 # Carga el código de la llamada al sistema para imprimir cadena en $v0
    syscall # Imprime el mensaje del máximo
    
    move $a0, $t4 # Mueve el valor de $t4 (el máximo) a $a0
    li $v0, 1 # Carga el código de la llamada al sistema para imprimir entero en $v
    
    la $a0, msg3 # Carga la cadena del mensaje de la suma en $a0
    syscall # Imprime el mensaje de la suma
    move $a0, $t5 # Mueve el valor de $t5 (la suma) a $a0
    syscall # Imprime el valor de la suma

exit: 
    li $v0, 10 # Carga el código de la llamada al sistema para salir del programa en $v0
    syscall # Sale del programa 