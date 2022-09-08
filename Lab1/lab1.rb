
#Lab 1 V 3
print "Enter x: \n"
$sx = gets.chomp
print "Enter a: \n"
$sa = gets.chomp
print "Enter b: \n"
$sb = gets.chomp

$x = $sx.to_s.to_f
$a = $sa.to_s.to_f
$b = $sb.to_s.to_f

$result = ((6.2 * 10**2.7 * Math.tan(Math::PI - $x**3))/(Math::E + (Math.log10(Math.acos(($b**3).abs))**(1/2)))) +
  Math.atan((10**2 * Math.sqrt($a))/(2*$x + 87.2))

print "Result : " +$result.to_s, "\n"