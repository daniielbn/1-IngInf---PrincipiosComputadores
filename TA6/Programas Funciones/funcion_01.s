#// Programa con funciones

##include <iostream>

#int sumaNumeros(int a, int b) {
#  return a + b;
#}

#int main() {
#  std::cout << "Suma de numeros\n";
#  
#  int i = 4;
#  int j = 5;
#  int suma = sumaNumeros(i, j);
#  
#  std::cout << i << " + " << j << " = " << suma << "\n";
#}

	.data
strTitulo:	.asciiz	"Suma de numeros\n"
strMas:		.asciiz	" + "
strIgual:	.asciiz	" = "
strSalto:	.asciiz	"\n"

	.text
	
#int sumaNumeros(int a, int b) {
#  return a + b;
#}

# #############################################################
#int main() {
# Asignación variables registros
# int i -> $s0
# int j -> $s1
# int suma -> $s2
main:

#  std::cout << "Suma de numeros\n";
	li	$v0,4
	la	$a0,strTitulo
	syscall
#  
#  int i = 4;
	li	$s0,4
#  int j = 5;
	li	$s1,5
#  int suma = sumaNumeros(i, j);
#  
#  std::cout << i << " + " << j << " = " << suma << "\n";
	li	$v0,1
	move	$a0,$s0
	syscall
	
	li	$v0,4
	la	$a0,strMas
	syscall

	li	$v0,1
	move	$a0,$s1
	syscall

	li	$v0,4
	la	$a0,strIgual
	syscall

	li	$v0,1
	move	$a0,$s2
	syscall

	li	$v0,4
	la	$a0,strSalto
	syscall


#}
	li	$v0,10
	syscall

