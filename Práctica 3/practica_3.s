# Universidad de La Laguna
# Escuela Superior de Ingeniería y Tecnología
# Grado en Ingeniería Informática
# Curso 2022/2023
# Principios de Computadores
# Autor: Daniel Brito Negrín
# Última modificación: 14/04/23


# Asignación de variables:
# nfil  ------------------------> $s0
# ncol  ------------------------> $s1
# maximoElemento  --------------> $s2
# size -------------------------> $s3
# suma  ------------------------> $s6


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
  # // se imprimie el título
  # std::cout << "\nPráctica PR3 de Principios de Computadores. Matrices.\n";

# Imprimir título.
  li      $v0, 4
  la      $a0, titulo
  syscall

  la      $s1, nfil         # Cargar dirección de memoria de nfil.
  lw      $s1, 0($s1)       # Almacenar nfil en $s0.
  la      $s2, ncol         # Cargar dirección de memoria de ncol.
  lw      $s2, 0($s2)       # Almacenar ncol en $s1.

  # std::cout << "\nLa matriz es " << nfil << "x" << ncol << "\n";
matriz:  
  li      $v0, 4
  la      $a0, msg_matriz
  syscall

  li      $v0, 1
  move    $a0, $s1
  syscall

  li      $v0, 4
  la      $a0, msg_x
  syscall

  li      $v0, 1
  move    $a0, $s2
  syscall 

  li      $v0, 4
  la      $a0, newline
  syscall

  # Para poder imprimir la matriz en ensamblador hay que ir imprimiendolos elemento por elemento en 2 bucles, uno para incrementar la fila, y otro para las columnas.
  la		  $s0, mat  # Cargo en memoria la dirección base de la matriz.
  move    $t1, $zero  # Inicializamos índice de filas (i). i = 0
  li      $s3, size   # Cargamos size en $t5.
  li      $s4, maximoElementos # Cargamos maximoElemento en $t6.

  bucle1:
    move  $t2, $zero    # Inicializamos índice de columna (j). j = 0
  bucle2:
    mul   $t4, $t1, $s2   # $t4 = i*ncol
    addu  $t4, $t4, $t2   # $t4 = i*ncol+j
    mul   $t4, $t4, $s3   # $t4 = (i*ncol+j)*size
    addu  $t4, $t4, $s0   # $t4 dirección de la matriz [i,j]
    lw    $t4, 0($t4)     # $t4 elemento de la matriz [i,j]

    li    $v0, 1
    move  $a0, $t4
    syscall   # Imprime el elemento.
    
    li    $v0, 4
    la    $a0, separador
    syscall   # Imprime un espacio.

    addi  $t2, $t2, 1  # Actualización de j. j++
    blt   $t2, $s2, bucle2  # Si j < ncol, volvemos a bucle2

    li    $v0, 4
    la    $a0, newline
    syscall   # Imprime cambio de fila.

    addi  $t1, $t1, 1  # Actualización de i. i++
    blt   $t1, $s1, bucle1  # Si i < nfil, volvemos a bucle1

  # for ( int f = 0; f < nfil; f++) {
    # for (int c = 0; c < ncol; c++ ) {
      # std::cout << mat[f*ncol+c] << "  "; // equivalente a acceso `mat[f][c]`
    # }
    # std::cout << "\n";
  # }
  # std::cout << std::endl;
  li      $v0, 4
  la      $a0, newline
  syscall


  # int opciones{0};
  li      $t0, 0
  # std::cout <<  "(1) Cambiar dimensiones\n" <<
                # "(2) Intercambiar dos elementos\n" <<
                # "(3) Suma de elementos del perimetro\n" <<
                # "(4) Calcula max y min de la diagonal\n" <<
                # "(0) Salir\n" << std::endl;
  # std::cout << "Elija una opcion: ";
opciones: 
  li      $v0, 4
  la      $a0, menu
  syscall
  # std::cin >> opciones; 
  li      $v0, 5
  syscall
  move    $t0, $v0

# switch (menu) {

  beq     $t0, 1, caso1   # Si $s6 = 1, saltamos a caso1.
  beq     $t0, 2, caso2   # Si $s6 = 2, saltamos a caso2.
  beq     $t0, 3, caso3   # Si $s6 = 3, saltamos a caso3.
  beq     $t0, 4, caso4   # Si $s6 = 4, saltamos a caso4.
  beqz    $t0, caso0      # Si $s6 = 0, saltamos a caso0.

  li      $v0, 4    # Si no es igual a ninguna de esas opciones salta mensaje de error.
  la      $a0, error_op
  syscall

  b		opciones			# Volvemos al opciones.

  # case 1 : {
    # std::cout << "Introduzca numero de filas: ";
    # std::cin >> nfil;
    # std::cout << "Introduzca numero de columnas: ";
    # std::cin >> ncol;
    # break;
  # }
caso1:
  li      $v0, 4
  la      $a0, msg_nfilas
  syscall

  li      $v0, 5
  syscall
  move    $t0, $v0   

  # Si nfil($t0) <= 0, saltamos a caso1_error_fil
  blez		$t0, caso1_error_fil


  li      $v0, 4
  la      $a0, msg_ncols
  syscall

  li      $v0, 5
  syscall
  move    $t1, $v0

  # Si ncol($t1) <= 0, saltamos a caso1_error_col
  blez    $t1, caso1_error_col
  # Hacemos $t0 = nfil*ncol
  mul     $t3, $t0, $t1
  # Si $t0 > maximoElementos($t6), saltamos a caso1_error_dime
  bgt     $t3, $s4, caso1_error_dime
  
  # Si no saltamos, guardamos la nfil en $s1
  move    $s1, $t0
  # Si no saltamos, guardamos ncol en $s2
  move    $s2, $t1
  # Si todos los datos introducidos son correctos, saltamos a matriz para que nos la imprima con los nuevos valores de nfil y ncol
  b		      matriz
  
caso1_error_fil:
  li      $v0, 4
  la      $a0, error_nfilas
  syscall

  b       matriz

caso1_error_col:
  li      $v0, 4
  la      $a0, error_ncols
  syscall

  b	      matriz

caso1_error_dime:
  li      $v0, 4
  la      $a0, error_dime
  syscall

  b		    matriz

  # case 2: {
caso2:
    # int fil_1{}, col_1{}, fil_2{}, col_2{};
    # std::cout << "Introduzca fila del primer elemento a cambiar: ";
  li      $v0, 4
  la      $a0, msg_i
  syscall
    # std::cin >> fil_1;
  li      $v0, 5
  syscall
  move    $t0, $v0

  bge     $t0, $s1, caso2_error_fil # fil_1 > nfil
  bltz    $t0, caso2_error_fil      # fil_1 < 0
    # std::cout << "Introduzca columna del primer elemento a cambiar: ";
  li      $v0, 4
  la      $a0, msg_j
  syscall
    # std::cin >> col_1;
  li      $v0, 5
  syscall
  move    $t1, $v0

  bge     $t1, $s2, caso2_error_col # col_1 > ncol
  bltz    $t1, caso2_error_col      # col_1 < 0
  
    # std::cout << "Introduzca fila del segundo elemento a cambiar: ";
  li      $v0,4
  la      $a0, msg_r
  syscall
    # std::cin >> fil_2;
  li      $v0, 5
  syscall
  move    $t2, $v0

  bge     $t2, $s1, caso2_error_fil # fil_2 > nfil
  bltz    $t2, caso2_error_fil      # fil_2 < 0
    # std::cout << "Introduzca columna del segundo elemento a cambiar: ";
  li      $v0, 4
  la      $a0, msg_s
  syscall
    # std::cin >> col_2;
  li      $v0, 5
  syscall
  move    $t3, $v0

  bge     $t3, $s2, caso2_error_col # col_2 > ncol
  bltz    $t3, caso2_error_col      # col_2 < 0 

    # int aux = mat[fil_1*ncol + col_1];
    # mat[fil_1*ncol + col_1] = mat[fil_2*ncol + col_2];
    # mat[fil_2*ncol + col_2] = aux;
    # break;
    # }
  move    $s5, $zero
# aux = mat[fil_1*ncol + col_1];
  mul     $t4, $t0, $s2
  addu    $t4, $t4, $t1
  mul     $t4, $t4, $s3
  addu    $t4, $t4, $s0
  lw      $s5, 0($t4)
# mat[fil_1*ncol + col_1] = mat[fil_2*ncol + col_2];
  mul     $t4, $t2, $s1
  addu    $t4, $t4, $t3
  mul     $t4, $t4, $s3
  addu    $t4, $t4, $s0
  lw      $t5, 0($t4)
  mul     $t4, $t0, $s1
  addu    $t4, $t4, $t1
  mul     $t4, $t4, $s3
  addu    $t4, $t4, $s0
  sw      $t5, 0($t4)    
# mat[fil_2*ncol + col_2] = aux;
  mul     $t4, $t2, $s1
  addu    $t4, $t4, $t3
  mul     $t4, $t4, $s3
  addu    $t4, $t4, $s0
  sw      $s5, 0($t4)

  b       matriz			

caso2_error_fil:
  li      $v0, 4
  la      $a0, error_nfilas
  syscall   # Imprime mensaje de error.

  b		    matriz			# Volvemos a imprimir la matriz.
  
caso2_error_col:
  li      $v0, 4
  la      $a0, error_ncols
  syscall # Imprime mensaje de error.

  b		    matriz			# Volvemos a imprimir la matriz.
  
  # case 3: {
caso3:
  move    $t0, $zero  # Inicialización de la suma.
  move    $t1, $zero  # Inicialización del índice i.
  move    $t2, $zero  # Inicialización del índice j.
  suma_perimetro:
    # Suma del perimetro superior.
      lw    $t3, mat($t1)
      add   $t0, $t0, $t2
      addi  $t1, $t1, 1

    # Suma del perimetro derecho.
      lw    $t3, mat($t1)
      add   $t0, $t0, $t3
      addi  $t2, $t2, 1

    # Suma del perimetro inferior.
      lw    $t3, mat($t1)
      add   $t0, $t0, $t3
      addi  $t1, $t1, -1

    # Suma del perimetro izquierdo.  
      lw    $t3, mat($t1)
      add   $t0, $t0, $t3
      addi  $t2, $t2, -1

      beq   $t1, $zero, caso5_fin
      bne   $t3, $zero, suma_perimetro
      beq   $t1, $t2, caso5_fin

  caso5_fin:
      li    $v0, 4
      la    $a0, msg_suma
      syscall

      li    $v0, 1
      move  $a0, $t0
      syscall
  # case 4: {
caso4:
    # int sumatorio{0};
    # int max{mat[0]}, min{mat[0]};
    # int compar{nfil}; 
    # if(nfil > ncol) {
      # compar = ncol;
    # }
    # for(int f = 0; f < compar; f++) {
      # if(max < mat[f*ncol + f]) {
        # max = mat[f*ncol + f];
      # }
      # if(min > mat[f*ncol + f]) {
        # min = mat[f*ncol + f];
      # }
    # }
    # std::cout << "El maximo de la diagonal principal es " << max << " y el minimo " << min << std::endl;
    # break;
  # }
  # case 0: {
caso0:
    # std::cout << "Fin del programa." << std::endl;
    # return 0;
  # }
  li      $v0, 4
  la      $a0, msg_fin
  syscall

  # Salida limpia del sistema.
  li      $v0, 10
  syscall
  # }
 # }
# }
