$a = false
$b = true
$c = true
$x = 90
$y = -1
$z = 5
def task1 (a, b, c, x, y, z)
  print "a) #{!(a || b) && (a && !b)} \n"
  print "b) #{(z != y)<=>(6 >= y) && a || b && c && x >= 1.5} \n"
  print "c) #{(8 - x*2 <= z) && (x**2 <= y**2) || (z >= 15)} \n"
  print "d) #{ x > 0 && y < 0 || z >= (x*y + (-y/x)) + (-z)} \n"
  print "e) #{!(a || b && !(c || (!a || b)))} \n"
  print "f) #{x**2 + y**2 >= 1 && x >= 0 && y >= 0} \n"
  print "g) #{(a && (c && b == b || a) || c) && b} \n"
end

def task2 (x, p)
  print "\n2) #{((Math.log(x) / Math.log(1/3) > Math.log(0.7) / Math.log(1/3)) && (Math.sqrt(x) > x*x) && !p)} \n"
end

def Y(x)
  case x
  when -4..0
    print "use 1"
    if x == -4 then
      return print " проміжок не знайден "
    else
      return ((x - 2).abs.to_f / (x**2 * Math.cos(x)).to_f)**(1.0/7.0)
    end
  when 0..12
    print "use 2"
    return 1.0/((Math.tan(x + (1.0/Math::E))).to_f/(Math.sin(x)**2).to_f)**(1.0/(7.0/2.0))
  else
    print "use 3"
    return 1.0/(1.0 + x/ (1.0 + x/ (1.0 + x).to_f).to_f).to_f

  end
end

def task3_2
  res = 0.0
  (0..8).each do |i|
    res += (1.0/3**i).to_f
  end
  print"task 3.2 : #{res.to_s}\n"
end

def task3_5(n)
  return n == 0 ? 0 : Math.sqrt(2.0 + task3_5(n - 1))
end
print "task 1 \n"
task1($a, $b, $c, $x, $y, $z)
task2(3, true )
print "task 2 \n"
puts "Y(-4) = #{Y(-4)}"
puts "Y(0) = #{Y(0)}"
puts "Y(1) = #{Y(1)}"
puts "Y(11.3) = #{Y(11.3)}"
puts "Y(-5) = #{Y(-5)}"
puts "Y(13) = #{Y(13)}"

task3_2

print "task 3.5 : #{task3_5(3)}"
