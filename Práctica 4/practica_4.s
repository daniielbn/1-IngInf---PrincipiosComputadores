# Universidad de La Laguna
# Grado en Ingeniería Informática
# Escuela Superior de Ingeniería y Tecnología
# Asignatura: Principios de Computadores
# Archivo: practica_4.s
# Autor: Daniel Brito Negrín
# Fecha ultima modificacion: 24/04/2023 

size = 4     # bytes que ocupa cada elemento
maxdim = 40  # dimension maxima que puede tener un vector
    .data
v1:         .space 160
v2:         .space 160 
n1:         .word 0 # numero eltos vector 1. Inicialmente suponemos vacios
n2:         .word 0 # numero eltos vector 2. Inicialmente suponemos vacios
space:      .asciiz " "
newline:    .asciiz "\n"
title:      .asciiz "\nPractica 4 de Principios de Computadores. Subrutinas.\n"
menu:       .ascii  "\n(1) Cambiar dimension de un vector\n(2) Cambiar un elemento de un vector\n"
            .ascii  "(3) Invertir un vector\n(4) Calcular el producto escalar de dos vectores\n"
            .asciiz "(0) Salir\n\nElija opcion: ";
cabvec:     .asciiz "\nVector con dimension "
error_op:   .asciiz "\nError: opcion incorrecta.\n"
elige_vec:  .asciiz "\nElija vector para realizar la operacion (1) para v1 (2) para v2: "
elige_elto: .asciiz "\nElija el indice del elemento a cambiar: "
newval:     .asciiz "\nIntroduce nuevo valor para el elemento elegido: "
newdim:     .asciiz "\nIntroduzca nueva dimension para el vector (1-40): "
error_dim:  .asciiz "\nError: Dimension incorrecta.\n"
error_ind:  .asciiz "\nError: Indice incorrecto.\n"
error_d_dim:    .asciiz "\nError: Los vectores tienen distinta dimension.\n"
msg_prodesc:    .asciiz "\nEl producto escalar de los vectores es: "
msg_fin:    .asciiz "\nFIN DEL PROGRAMA."


    .text
print_vec:
# $a0 = dirección de la memoria donde está almacenado el vector.
# $a1 = dimensión del vector.
# $a3 = cadena de texto que sirve de separador entre elementos del vector.

# Necesitamos guardar las variables en la pila para no perderlas al llamar a la función.
add     $sp $sp -24
sw      $ra, 20($sp)
sw      $s4, 16($sp)
sw      $s3, 12($sp)
sw      $s2, 8($sp)
sw      $s1, 4($sp)
sw      $s0, 0($sp)

# Movemos los parámetros de entrada de la función a los registros salvados.
move    $s0, $a0        # $s0 = v
move    $s1, $a1        # $s1 = n
move    $s2, $a2        # $s2 = space

move    $s3, $zero      # Inicialización del índice i.
        bucle_print_vec:
                mul     $s4, $s3, 4     # $s4 = i*size
                add     $s4, $s4, $s0   # $s4 = v + i * size
                l.s     $f12, 0($s4)    # Cargamos en memoria $s4, en la variable $f12.

                li      $v0, 2          # Imprimimos elemento.

                syscall
                li      $v0, 4          # Imprimimos separador.
                move    $a0, $s2
                syscall

                addi    $s3, $s3, 1     # Actualización el ínidice i.
                blt     $s3, $s1, bucle_print_vec  # Si el índice ($s3) < n(dimensión del vector), saltamos al bucle nuevamente.

        bucle_print_vec_fin:
        lw      $s0, 0($sp)
        lw      $s1, 4($sp)
        lw      $s2, 8($sp)
        lw      $s3, 12($sp)
        lw      $s4, 16($sp)
        lw      $ra, 20($sp)
        add     $sp $sp 24
        jr		$ra					
        

    print_vec_fin:

change_elto:
# $a0 = dirección de la memoria donde está almacenado el vector.
# $a1 = Índice del elemento que se desea modificar.
# $a2 = Dato que queremos almacenar en el elemento deseado.
    add     $sp $sp -16
    sw      $s0, 0$sp)
    sw      $s1, 4($sp)
    sw      $s2, 8($sp)
    sw      $ra, 12($sp)

    move    $s0, $s0
    move    $s1, $s1
    mov.s   $f20, $f12

    mul     $t0, $s1, 4
    add     $t0, $t0, $s0
    s.s     $f20, 0($t0)

    lw      $s0, 0($sp)
    lw      $s1, 4($sp)
    lw      $s2, 8($sp)
    lw      $ra, 12($sp)
    addi    $sp $sp 16

    jr      $ra

main:

    li      $v0, 4
    la      $a0, title
    syscall

# Darle valores al vector v1, del 10 al 49

    la      $s0, v1     # Almacenamos en $s0 el vector v1.
    lw      $s2, n1     # Cargamos en memoria el espacio del vector.

    move    $t1, $zero  # Inicialización del índice i.
    bucle_v1:
            mul     $t2, $t1, size      # $t2 = i * size
            add     $t2, $t2, $s0       # $t2 = v1 + i * size
            add     $t3, $t1, 10        # $t3 = v1[i] + 10 + i

            mtc1    $t3, $f4            # Copia cruda de $t3 a flotante simple.
            cvt.s.w $f4, $f4            # Conversión de $f4 a flotante simple y se almacena en $f4
            s.s     $f4, 0($t2)         # v1[i] = $t2

            add     $t6, $t1, 1         # Actualización del valor del vector.
            move    $s2, $t6
            sw      $s2, n1

            add     $t1, $t1, 1          # Actualización del índice i.
            blt     $t1, maxdim, bucle_v1  # Si $t1 < maxdim, volvemos al bucle_v1.
    bucle_v1_fin:



# Darle valores al vector v2, del 40 al 1.

    la      $s1, v2     # Cargamos la dirección de memoria de v2.
    lw      $s3, n2     # Cargamos, también, la dimensión de v2.

    move    $t1, $zero      # Inicializamos el índice i.
    li      $t5, 40         # Inicializamos el 40, para poder darle valores decrecientes al vector
    bucle_v2:
            mul     $t2, $t1, size      # $t2 = i * size
            add     $t2, $t2, $s1       # $t2 = v2[i] + i * size
            sub     $t3, $t5, $t1       # $t3 = v2[i] + 40 - 1

            mtc1    $t3, $f4            # Movemos $t3 a un registro flotante para realizar la conversión de entero a flotante simple.
            cvt.s.w $f4, $f4            # Lo convertimos a flotante.
            s.s     $f4, 0($t2)         # Almacenamos el valor de v2[i].

            add     $t6, $t1, 1         # Actualización de la dimensión del vector v2.
            move    $s3, $t6
            sw      $s3, n2

            add     $t1, $t1, 1         # Actualización del índice 1.
            
            blt     $t1, maxdim, bucle_v2   # Si el índice i ($t1) < maxdim, saltamos a bucle_v2.

    bucle_v2_fin:

vector:
    # Imprimimos mensaje de control sobre el vector, indicando su dimensión.
    li      $v0, 4
    la      $a0, cabvec
    syscall

    li      $v0, 1
    move    $a0, $s2
    syscall

    li      $v0, 4
    la      $a0, newline
    syscall

    # Le pasamos tres parámetros a la función print_vect.
    la      $a0, v1         # Cargo en memoria de v1.
    move    $a1, $s2         # Cargo en memoria de n1
    la      $a2, space      # Cargo en memoria la cadena de texto "space"
    jal		print_vec		# Salto a la subrutina print_vec		
    
    # Salto de línea.
    li      $v0, 4
    la      $a0, newline
    syscall

    # Imprimimos mensaje de control sobre el vector, indicando su dimensión.
    li      $v0, 4
    la      $a0, cabvec
    syscall

    li      $v0, 1
    move    $a0, $s3
    syscall

    li      $v0, 4
    la      $a0, newline
    syscall


    # Le pasamos tres parámetros a la función print_vec.
    la      $a0, v2
    move    $a1, $s3
    la      $a2, space
    jal     print_vec


    # Imprimimos el menú.
    li      $v0, 4
    la      $a0, newline
    syscall

    li      $v0, 4
    la      $a0, menu
    syscall

    li      $v0, 5
    syscall
    move    $t1, $v0

    # Dependiendo del valor introducido por consola, saltaremos a una u otra opción.
    beq     $t1, 1, opcion_1
    beq     $t1, 2, opcion_2
    beq     $t1, 3, opcion_3
    beq     $t1, 4, opcion_4
    beqz    $t1, opcion_0

    li      $v0, 4
    la      $a0, error_op
    syscall

    b		vector		
    

opcion_1:
    li      $v0, 4
    la      $a0, elige_vec
    syscall

    li      $v0, 5
    syscall
    move    $t1, $v0        # en $t1 tenemos el vector con el que vamos a operar.

    if_v1:
    bne     $t1, 1, if_v2   # Si $t1 != 1, comprobamos si $t1 = 2.

    b		if_v2_fin	    # Si $t1 = 1, saltamos fuera del if	.
    
    if_v1_fin:

    if_v2:      
    bne     $t1, 2, opcion_1_error_op # Si $t1 != 2, saltamos al error.
    if_v2_fin:

    li      $v0, 4
    la      $a0, newdim
    syscall

    li      $v0, 5
    syscall
    move    $t2, $v0        # en $t2 tenemos la nueva dimension del vector de $t1.

    bgt     $t2, 40, opcion_1_error_dim # Si $t2 > 40, salta error.
    blez    $t2, opcion_1_error_dim     # Si $t2 <= 0, salta error.

    if_vector_v1:
        bne     $t1, 1, if_vector_v2    # Si $t1 != 1, saltamos a v2.
        move    $s2, $t2                # Hacemos el cambio de dimensión de v1.

        b		vector		            # Imprimimos los vectores.
        
    if_vector_v2:
        move    $s3, $t2                # Cambiamos la dimensión de v2.
        
        b		vector		            # Imprimimos los vectores.
        

opcion_1_error_op:
    li      $v0, 4
    la      $a0, error_op
    syscall
    
    b		vector			# Volvemos al bucle principal
    
opcion_1_error_dim:
    li      $v0, 4
    la      $a0, error_dim
    syscall
    
    b		vector			# Volvemos al bucle principal
    

opcion_2:
    li      $v0, 4
    la      $a0, elige_vec
    syscall

    li      $v0, 5
    syscall
    move    $t1, $v0        # en $t1 tenemos el vector con el que vamos a operar.

    if_v1_op2:
    bne     $t1, 1, if_v2_op2   # Si $t1 != 1, comprobamos si $t1 = 2.

    b		if_v2_op2_fin	    # Si $t1 = 1, saltamos fuera del if	.
    
    if_v1_op2_fin:

    if_v2_op2:      
    bne     $t1, 2, opcion_2_error_op # Si $t1 != 2, saltamos al error.
    if_v2_op2_fin:

    li      $v0, 4
    la      $a0, elige_elto
    syscall

    li      $v0, 5
    syscall
    move    $t2, $v0        # en $t2 tenemos la nueva dimension del vector de $t1.

    bltz    $t2, opcion_2_error_dim # Si $t2 < 0, salta error.

    v1_error:
    bne     $t1, 1, v2_rror        # Comprobamos si estamos trabajando en v1, si no es así, saltamos a v2.
    bge     $t2, $s2, opcion_2_error_dim    # Si $t2 > $s2, salta error.

    b       elemento
    v2_error:
    bge     $t2, $s3, opcion_2_error_dim    # Si $t2 < $s3, salta error.

elemento:
    li      $v0, 4
    la      $a0, newval
    syscall

    li      $v0, 2
    syscall
    mov.s   $f20, $f12

cambio_elemento:
    v1:
        bne     $t1, 1, v2      # Si $t1 != 1, saltamos al v2.

        # Le pasamos los tres parámetros a la subrutina.
        la      $a0, $s0
        move    $a1, $t2
        l.s     $a2, $f12
        jal     change_elto

        b       matriz

    v2:
        la      $a0, $s2
        move    $a1, $t2
        l.s     $a2, $f12
        jal     change_elto



opcion_2_error_op:
    li      $v0, 4
    la      $a0, error_op
    syscall
    
    b		vector			# Volvemos al bucle principal

opcion_2_error_dim:
    li      $v0, 4
    la      $a0, error_dim
    syscall
    
    b		vector			# Volvemos al bucle principal

opcion_3:
    li      $v0, 4
    la      $a0, elige_vec
    syscall

    li      $v0, 5
    syscall
    move    $t1, $v0        # en $t1 tenemos el vector con el que vamos a operar.

    if_v1_op3:
    bne     $t1, 1, if_v2_op3   # Si $t1 != 1, comprobamos si $t1 = 2.

    b		if_v2_op3_fin	    # Si $t1 = 1, saltamos fuera del if	.
    
    if_v1_op3_fin:

    if_v2_op3:      
    bne     $t1, 2, opcion_3_error_op # Si $t1 != 2, saltamos al error.
    if_v2_op3_fin:

    li      $v0, 4
    la      $a0, newdim
    syscall

    li      $v0, 5
    syscall
    move    $t2, $v0        # en $t2 tenemos la nueva dimension del vector de $t1.

    bgt     $t2, 40, opcion_3_error_dim # Si $t2 > 40, salta error.
    blez    $t2, opcion_3_error_dim     # Si $t2 <= 0, salta error.

opcion_3_error_op:
    li      $v0, 4
    la      $a0, error_op
    syscall
    
    b		vector			# Volvemos al bucle principal

opcion_3_error_dim:
    li      $v0, 4
    la      $a0, error_dim
    syscall
    
    b		vector			# Volvemos al bucle principal

opcion_4:

opcion_4_fin:

opcion_0:
    li      $v0, 4
    la      $a0, msg_fin
    syscall

    li      $v0, 10             # Salida limpia del sistema.
    syscall