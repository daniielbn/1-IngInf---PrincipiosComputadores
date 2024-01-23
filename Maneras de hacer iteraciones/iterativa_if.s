  .text
main:
if:
  beq		$s0, $s1, ifFin
  move  $s3, $s1
ifFin:
  # Después del if

#==============Programa en C++===============
# if ($s0 != $s1) {
#   $s3 = $s1
# }
# // Después del if