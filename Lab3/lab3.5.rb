PI = 3.141
N = 3
c = 1

def Y(x, n, c)
  return (((x + c)**(-n/4.0) * c**(1.0/n))/(x**(2-n) * c**(-3.0/4.0)))**(4.0/3.0) +
    ((x**2 - 1.0)/(x**3 - 3.0*x + (1.0/n)))
end
def Z(x)
  return Math.sin(15.0/8.0 * PI - 2.0 * x)**2 - Math.cos(17.0/8.0 * PI - 2.0 * x)**2 + Math.cos(x)**(1/x)
end
def task1(c, n)
  x = 1.0
  step = (n - 1).to_f / (n + c).to_f
  puts "step : #{step}"

  while x <= n
    puts "x: #{x} | y : #{Y(x, n, c).round(10)}"
    x += step
  end
end
def task2(c, n)
  x = Math::PI / n
  step = (Math::PI - x) / ((3.0/2.0)*n + c).to_f
  puts "step : #{step}"
  while x <= PI
    puts "x: #{x} | z: #{Z(x)}"
    x += step
  end
end
def F(x, n, c)
  case x
  when 2..n
    return Y(x, n, c)
  when n..2*n
    return Z(x)
  else
    return Y(x, n, c) + Z(x)
  end
end
def task3(c, n)
  x = 2.0
  step = (c - 2).to_f / (2*n).to_f
  puts " step: #{step}"
  while x <= c
    puts "x: #{x} | y: #{F(x, n, c)}"
    x += step
    return if x == c && step == 0
  end
end
puts "Y #{Y(1, N, 1)}" #x = 1 , N=3, C=1 == 0.5
puts "Z #{Z(1)}" #x = 1, == 1.0013
puts " task 1"
puts task1(c, N)
puts " task 2"
puts task2(c, N)
puts " task 3"
c = 4
puts task3(c, N)
