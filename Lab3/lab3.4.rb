#task 4 v3
class Integer
  def fact
    return (1..(self.zero? ? 1 : self)).inject(:*)
  end
end
EPS = 0.00001

def Sum1(n)
  sum = 0
  num = 0
  while num > EPS or num == 0
    num = ((n - 1).fact.to_f / (n + 1).fact.to_f)**(n * (n + 1))
    sum += num
    n += 1
  end

  sum
end

def Sum2(n)
  sum = 0
  num = 0
  while num > EPS or num == 0
    num = 1.0 / ((4.0 * n - 1.0)*(4.0 * n + 1.0))
    sum += num
    n += 1
  end
  sum
end
def Sum3(n)
  sum = 0
  num = 0
  while num > EPS or num == 0
    num = ((3 * n - 1).to_i.fact * (2 * n - 1).to_i.fact).to_f / ((3 * n).to_i.fact * 3**(2*n) * (2 * n).to_i.fact).to_f
    sum += num
    n += 1
  end
  sum
end

x = 1.0/2.0 - Math::PI/8.0

puts "1: #{Sum1(2)}"
puts "2: x #{x} == ∑ #{Sum2(1)} :  #{x == Sum2(1)}"
puts "3: #{Sum3(1)}"
