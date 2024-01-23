# #include <iostream>
# int main(void) {
#   float a,b,c,d;
#   std::cout << "\nEvaluacion polinomio f(x) = a x^3  + b x^2 + c x + d  en un intervalo [r,s]\n";
#   std::cout << "\nIntroduzca los valores de a,b,c y d (separados por retorno de carro):\n";
#   std::cin >> a;
#   std::cin >> b;
#   std::cin >> c;
#   std::cin >> d;
#   int r,s;
#   do {
#     std::cout << "Introduzca [r,s] (r y s enteros, r <= s)  (separados por retorno de carro):\n";
#     std::cin >> r;
#     std::cin >> s;
#   } while (r > s);
#   for (int x = r ; x <= s ; x++) {
#     float f = a*x*x*x + b*x*x + c*x + d;
#     if (f >= 2.1) {
#       std::cout << "\nf(" << x << ") = " << f;
#     }
#   }
#   std::cout << "\n\nTermina el programa\n";
# }

# Asignación de variables:
# a         ->  $f1
# b         ->  $f2
# c         ->  $f3
# d         ->  $f4
# r         ->  $s0
# s         ->  $s1
# x         ->  $s2 // $f14
# f         ->  $f10

#  Sección de datos de usuario
    .data
msg_titulo:     .asciiz "\nEvaluacion polinomio f(x) = a x^3  + b x^2 + c x + d  en un intervalo [r,s]\n"
msg_valores:    .asciiz "\nIntroduzca los valores de a,b,c y d (separados por retorno de carro):\n"
msg_r_y_s:      .asciiz "Introduzca [r,s] (r y s enteros, r <= s)  (separados por retorno de carro):\n"
msg_f:          .asciiz "\nf("
msg_parentesis: .asciiz ") = "
msg_fin:        .asciiz "\n\nTermina el programa\n"

# Sección de código de usuario
    .text
main:
    li		$v0, 4 		# Imprimir cadena de texto.
    la		$a0, msg_titulo		# Dirección de memoria de la cadena de texto.
    syscall

    li      $v0, 4      # Imprimir cadena de texto.
    la      $a0, msg_valores    # Dirección de memoria de la cadena de texto.
    syscall

    li      $v0, 6      # Pedir la variable a.
    syscall
    mov.s   $f2, $f0    # Guardar el valor de a en el registro $f2.
    
    li      $v0, 6      # Pedir la variable b.
    syscall
    mov.s   $f4, $f0    # Guardar el valor de b en el registro $f4.

    li      $v0, 6      # Pedir la variable c.
    syscall
    mov.s   $f6, $f0    # Guardar el valor de c en el registro $f6.

    li      $v0, 6      # Pedir la variable d.
    syscall
    mov.s   $f8, $f0    # Guardar el valor de d en el registro $f8.
    
do_while:
    li      $v0, 4      # Imprimir cadena de texto.
    la      $a0, msg_r_y_s  # Dirección de memoria de la cadena de texto.
    syscall

    li      $v0, 5      # Pedir la variable r.
    syscall
    move    $s0, $v0    # Mover la variable r al registro $s0.

    li      $v0, 5      # Pedir la variable s.
    syscall
    move    $s1, $v0    # Mover la variable s al registro $s1.
    
    # si s es menor o igual q r, salta a do_while_fin
    ble		$s1, $s0, do_while_fin

    move    $s2, $s0    # Inicialización // x = r 
for:
    bgt     $s2, $s1, for_fin       # Si x > s, saltamos a for_fin.

    # Convertir x a flotante simple para poder operar con números flotantes.
    mtc1  $s2, $f10     # Realizo una copia cruda de $s2 (x) en $f5.
    cvt.s.w $f12, $f10  # Convierto $f5 en un flotante simple en $f6.

    # Cálculo de f(x) = a*x*x*x + b*x*x + c*x + d.
    mul.s   $f14, $f12, $f12    # x*x.
    mul.s   $f16, $f14, $f12    # x*x*x.

    # a*x*x*x
    mul.s   $f20, $f2, $f16

    # b*x*x
    mul.s   $f22, $f4, $f14

    # c*x
    mul.s   $f24, $f6, $f12

    # f(x) = a*x*x*x + b*x*x + c*x + d.
    add.s   $f26, $f20, $f22    # a*x*x*x + b*x*x.
    add.s   $f28, $f26, $f24    # a*x*x*x + b*x*x + c*x .
    add.s   $f10, $f28, $f8     # a*x*x*x + b*x*x + c*x + d.
    


    li.s    $f14, 2.1   # Carga inmediata de $f13 para compararlo con f.
if:
    c.le.s  $f10, $f14  # Si f <= 2.1.
    bc1t    exit         # salta a for.
 
    li      $v0, 4      # Imprimir cadena de texto.
    la      $a0, msg_f      # Dirección de memoria de la cadena de texto.
    syscall

    li      $v0, 1      # Imprimir entero.
    move    $a0, $s2    # Muevo x a $a0 para que se imprima.
    syscall

    li      $v0, 4      # Imprimir cadena de texto.
    la      $a0, msg_parentesis      # Dirección de memoria de la cadena de texto.
    syscall

    li      $v0, 2     # Imprimir flotante.
    mov.s    $f12, $f10    # Muevo f a $f12 para que se imprima.
    syscall
    
    addi	$s2, 1   # Actualización de x++

    b		for			# De vuelta al for
do_while_fin:
    b		exit			# Salto a exit.
    
for_fin:
    b		exit			# Salto a exit.

exit:
    li  $v0, 4              # Imprimir cadena de texto.
    la  $a0, msg_fin        # Dirección de la cadena de texto.
    syscall


    li  $v0, 10             # Salida limpia del sistema.
    syscall
    
  