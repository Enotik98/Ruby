require 'test-unit'

class Test1 < Test::Unit::TestCase
  def test_search
    resAnother = f(1, 3, 1, 1, 2, 1)
    resfirst = f(1, 3, 1, -1, 2, 1)
    resSec = f(1, 3, 1, 1, 2, 0)

    first = {1=>2, 2=>1, 3=>-2}
    another = {1=>2, 2=>3, 3=>4}
    sec = {1=>-1.0, 2=>-0.5, 3=>-0.3333333333333333}
    assert_equal( resAnother, another)
    assert_equal(resfirst, first)
    assert_equal(resSec, sec)
  end
end


def f(start_x, end_x, dx, a, b, c)
  puts "Expression's value: ", a.truncate & (b.truncate | c.truncate)

  if a.truncate & (b.truncate | c.truncate) != 0
    a = a.to_f
    b = b.to_f
    c = c.to_f
  else
    a = a.to_i
    b = b.to_i
    c = c.to_i
  end
  res = {}
  (start_x..end_x).step(dx).each do |x|
    if a < 0 && c != 0
      res[x] = a * x**2 + b * x + c
    elsif a > 0 && c == 0
      res[x] = (-a) / (x - c).to_f
    else
      res[x] = a * (x + c)
    end
  end
  res
end
# puts "Enter a"
# a = gets.chomp.to_f
# puts "Enter b"
# b = gets.chomp.to_f
# puts "Enter c"
# c = gets.chomp.to_f
#
# puts "Enter start_x"
# start_x = gets.chomp.to_f
# puts "Enter end_x"
# end_x = gets.chomp.to_f
# puts "Enter dx"
# dx = gets.chomp.to_f
result = f(1, 3, 1, 1, 2, 0)
result.each do |key, value|
  print key, " : ", value, "\n"
end
