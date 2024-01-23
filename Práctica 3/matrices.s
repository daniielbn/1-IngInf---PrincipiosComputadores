# Esqueleto PR3

maximoElementos=400 # numero de enteros maximo reservado para la matriz 1600 bytes
size=4 # bytes que ocupa un entero
    .data
mat:   .word   100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119
       .word   120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139
       .word   140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159
       .word   160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179
       .word   180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199
       .word   200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219
       .word   220, 221, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239
       .word   240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255, 256, 257, 258, 259
       .word   260, 261, 262, 263, 264, 265, 266, 267, 268, 269, 270, 271, 272, 273, 274, 275, 276, 277, 278, 279
       .word   280, 281, 282, 283, 284, 285, 286, 287, 288, 289, 290, 291, 292, 293, 294, 295, 296, 297, 298, 299
       .word   300, 301, 302, 303, 304, 305, 306, 307, 308, 309, 310, 311, 312, 313, 314, 315, 316, 317, 318, 319
       .word   320, 321, 322, 323, 324, 325, 326, 327, 328, 329, 330, 331, 332, 333, 334, 335, 336, 337, 338, 339
       .word   340, 341, 342, 343, 344, 345, 346, 347, 348, 349, 350, 351, 352, 353, 354, 355, 356, 357, 358, 359
       .word   360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374, 375, 376, 377, 378, 379
       .word   380, 381, 382, 383, 384, 385, 386, 387, 388, 389, 390, 391, 392, 393, 394, 395, 396, 397, 398, 399
       .word   400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 411, 412, 413, 414, 415, 416, 417, 418, 419
       .word   420, 421, 422, 423, 424, 425, 426, 427, 428, 429, 430, 431, 432, 433, 434, 435, 436, 437, 438, 439
       .word   440, 441, 442, 443, 444, 445, 446, 447, 448, 449, 450, 451, 452, 453, 454, 455, 456, 457, 458, 459
       .word   460, 461, 462, 463, 464, 465, 466, 467, 468, 469, 470, 471, 472, 473, 474, 475, 476, 477, 478, 479
       .word   480, 481, 482, 483, 484, 485, 486, 487, 488, 489, 490, 491, 492, 493, 494, 495, 496, 497, 498, 499

nfil:   .word   20 # nuemro de filas de la matriz
ncol:   .word   10 # numero de columnas de la matriz

titulo:     .asciiz "\nPráctica PR3 de Principios de Computadores. Manejo de Matrices.\n"
msg_matriz: .asciiz "\nLa matriz es "
msg_x:      .asciiz "x"
separador:  .asciiz "  " # separador entre numeros
newline:    .asciiz "\n"
menu:       .ascii  "\n(1) Cambiar dimensiones\n(2) Intercambiar dos elemento\n"
            .ascii  "(3) Suma elementos del perimetro\n(4) Calcula max y min de la diagonal\n"
            .asciiz "(0) Salir\n\nElija opcion: "

error_op:   .asciiz "\nError: opcion incorrecta.\n"
msg_nfilas: .asciiz "Introduzca numero de filas: "
msg_ncols:  .asciiz "Introduzca numero de columnas: "
error_nfilas:   .asciiz "\nError: dimension incorrecta. Numero de fila incorrecto.\n"
error_ncols:    .asciiz "\nError: dimension incorrecta. Numero de columna incorrecto.\n"
error_dime:     .asciiz "\nError: dimension incorrecta. Excede el maximo numero de elementos (400).\n"
msg_i:      .asciiz "Introduzca fila del primer elemento a cambiar: "
msg_j:      .asciiz "Introduzca columna del primer elemento a cambiar: "
msg_r:      .asciiz "Introduzca fila del segundo elemento a cambiar: "
msg_s:      .asciiz "Introduzca columna del segundo elemento a cambiar: "
msg_suma:   .asciiz "\n\nSuma de los elementos del perímetro: "
msg_max:    .asciiz "\nEl máximo de la diagonal principal es "
msg_min:    .asciiz " y el mínimo "
msg_fin:    .asciiz "\nFin del programa.\n"
coma:       .asciiz ", "

    .text
main:
    li      $v0, 4     # Imprimir cadena de texto
    la      $a0, titulo
    syscall
     
    la $s0, nfil     # carga la dirección de memoria de nfil en $s0
    lw $s0, ($s0)    # carga el valor de nfil en $s0
    la $s1, ncol     # carga la dirección de memoria de ncol en $s1
    lw $s1, ($s1)    # carga el valor de ncol en $s1
matriz:
    li      $v0, 4         # Imprimir cadena de texto
    la      $a0, msg_matriz  
    syscall

    # Imprime el valor de nfil
    li $v0, 1        # carga el código para imprimir un entero en $v0
    move $a0, $s0    # mueve el valor de nfil a $a0
    syscall          # realiza la llamada al sistema para imprimir el valor de $a0
    
    # Imprime una x
    li $v0, 4        # carga el código para imprimir una cadena en $v0
    la $a0, msg_x       # carga la dirección de memoria de msg_x en $a0
    syscall

    # Imprime el valor de ncol
    li $v0, 1        # carga el código para imprimir un entero en $v0
    move $a0, $s1    # mueve el valor de ncol a $a0
    syscall          # realiza la llamada al sistema para imprimir el valor de $a0
    
    # Imprime un salto de línea
    li $v0, 4        # carga el código para imprimir una cadena en $v0
    la $a0, newline       # carga la dirección de memoria de nl en $a0
    syscall

    la      $t0, mat        # Cargar dirección base de la matriz.
    move    $t1, $zero      # $t1 = índice de filas(i).
    li      $t3, size       # $t3 contiene el tamaño de cada elemento.
    li      $t9, maximoElementos    # $t9 contiene el número máximo de elementos.

loop1:
    move    $t2, $zero      # $t2 = índice de columnas(j).

loop2:
    mul     $t4, $t1, 20    # $t4 = i*ncol
    addu    $t4, $t4, $t2   # $t4 = i*ncol+j
    mul     $t4, $t4, $t3   # $t4 = (i*ncol+j)*size
    addu    $t4, $t4, $t0   # $t4 dirección de matriz[i, j]
    lw      $t4, 0($t4)     # $t4 elemento matriz [i, j]

    li      $v0, 1
    move    $a0, $t4
    syscall

    li      $v0, 4     # Carga el código del sistema para imprimir un carácter en $v0
    la      $a0, separador  # Carga el carácter espacio en $a0
    syscall 
    
    addi    $t2, $t2, 1
    blt     $t2, $s1, loop2    # siguiente columna

    li      $v0, 4 # Imprimir cadena de texto.
    la      $a0, newline
    syscall

    addi    $t1, $t1, 1
    blt     $t1, $s2, loop1    # siguiente fila




opciones: 
    li      $v0, 4 # Imprimir cadena de texto.
    la      $a0, menu
    syscall 

    li      $v0, 5  # Leer entero.
    syscall
    
    move    $t0, $v0    # $t0 = $v0

    li      $t1, 1
    li      $t2, 2
    li      $t3, 3
    li      $t4, 4

    beq		$t0, $t1, opcion_1  # Si $t0 = 1, saltamos a la opción 1
    beq     $t0, $t2, opcion_2  # Si $t0 = 2, saltamos a la opción 2
    beq     $t0, $t3, opcion_3  # Si $t0 = 3, saltamos a la opción 3
    beq     $t0, $t4, opcion_4  # Si $t0 = 4, saltamos a la opción 4
    beqz    $t0, opcion_0       # Si $t0 = 0, saltamos a la opción 0
    b		opcion_error	    # Si introduces otro número fuera del rango salta a opcion_error

opcion_error:
    li      $v0, 4
    la      $a0, error_op
    syscall
    b       opciones
    

opcion_1:
    li      $v0, 4
    la      $a0, msg_nfilas
    syscall

    li      $v0, 5
    syscall
    move    $s0, $v0

    li      $v0, 4
    la      $a0, msg_ncols
    syscall
    
    li      $v0, 5
    syscall
    move    $s1, $v0


    beqz    $s0, opcion_1_error_fil
    beqz    $s1, opcion_1_error_col
    mul     $t8, $s0, $s1   # Cálculo de los elementos de la matriz nueva.
    bgt     $t8, $t9, opcion_1_error_elementos


    #  $s0 = nfil   //  $s1 = ncol  //  $s2 = i //  $s3 = j
cambio_dimension:
    b		matriz			# Salto para imprimir la matriz nuevamente
    
    
opcion_1_error_fil:
    li      $v0, 4
    la      $a0, error_nfilas
    syscall
    b		opciones			# Salto a opciones
    
opcion_1_error_col:
    li      $v0, 4
    la      $a0, error_ncols
    syscall
    b		opciones			# Salto a opciones

opcion_1_error_elementos:
    li      $v0, 4
    la      $a0, error_dime
    syscall
    b		opciones			# Salto a opciones
    

opcion_2:
    li      $v0, 4 
    la      $a0, msg_i
    syscall

    li      $v0, 5
    syscall
    move    $t0, $a0            # Almaceno en $t0 la fila del primer elemento a cambiar.

    li      $v0, 4 
    la      $a0, msg_j
    syscall

    li      $v0, 5
    syscall
    move    $t1, $a0            # Almaceno en $t1 la columna del primer elemento a cambiar.

    li      $v0, 4 
    la      $a0, msg_r
    syscall

    li      $v0, 5
    syscall
    move    $t2, $a0            # Almaceno en $t2 la fila del segundo elemento a cambiar.

    li      $v0, 4 
    la      $a0, msg_s
    syscall

    li      $v0, 5
    syscall
    move    $t3, $a0            # Almaceno en $t3 la columna del segundo elemento a cambiar.

    bgt     $t0, $s0, opcion_2_error_fil
    bgt     $t2, $s0, opcion_2_error_fil
    bgt     $t1, $s1, opcion_2_error_col
    bgt     $t2, $s1, opcion_2_error_col

    li      $v0, 4         # Imprimir cadena de texto
    la      $a0, msg_matriz  
    syscall

    li      $v0, 1
    move    $a0, $s3
    syscall

    li      $v0, 4
    la      $a0, msg_x
    syscall

    li      $v0, 1
    move    $a0, $s4
    syscall

    b		opciones			# Salto a opciones

opcion_2_error_fil:
    li      $v0, 4
    la      $a0, error_nfilas
    syscall
    b		opciones			# Salto a opciones

opcion_2_error_col:
    li      $v0, 4
    la      $a0, error_ncols
    syscall
    b		opciones			# Salto a opciones

opcion_3:
    # Suma de los elementos perimentrales
    li      $v0, 4
    la      $a0, msg_suma
    syscall 


    b		opciones			# Salto a opciones
    
opcion_4:
    # Cálculo del valor máx y mín de la diagonal principal
    li      $v0, 4
    la      $a0, msg_max
    syscall

    # Imprimir el cálculo del valor máx

    li      $v0, 4
    la      $a0, msg_min
    syscall

    # Imprimir el cálculo del valor mín.

    b		opciones			# Salto a opciones



opcion_0:
    li      $v0, 4
    la      $a0, msg_fin
    syscall

    li      $v0, 10    # Carga el código del sistema para terminar el programa en $v0
    syscall       # Termina el programa