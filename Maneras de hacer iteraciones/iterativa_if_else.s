  .text
main:
if:
  bge		$s0, $s1, else
  move  $s3, $s1
  b		  ifFin
else:
  move $s3, $s0
ifFin:
  # Después del if-else

#==============Programa en C++===============
# if ($s0 < $s1) {
#   $s3 = $s1
# } else {
#   $s3 = $s0
# } // Después del if