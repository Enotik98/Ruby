require 'test-unit'
class Test_ < Test::Unit::TestCase
  def test_integRectangle
    func1 = integRectangle(0.2, 2.1, 1000000.0) {|x| f1(x)}
    func1 = func1.round(5)
    func2 = integRectangle(0.0, Math::PI/2, 1000000.0) {|x| f2(x)}
    func2 = func2.round(5)
    assert_equal(func1, 2.86589)
    assert_equal(func2, 2.90524)
  end
  def test_integTrapezoid
    func1 = integTrapezoid(0.2, 2.1, 1000000.0) {|x| f1(x)}
    func1 = func1.round(5)
    func2 = integTrapezoid(0.0, Math::PI/2, 1000000.0) {|x| f2(x)}
    func2 = func2.round(5)
    assert_equal(func1, 2.86589)
    assert_equal(func2, 2.90524)
  end

end
def integRectangle(a, b, n, h = (b - a)/n)
  x = a + h/2
  sum = 0
  (1..n).each {
    y = yield(x)
    sum += h * y
    x += h
  }
  return sum
end

def integTrapezoid(a, b, n, h = (b-a)/n)
  x = a + h
  sum = h * ((yield(a)/2.0) - (yield(b)/2.0))
  loop do
    y = yield(x)
    sum += h * y
    x += h
    break if x > b
  end
  return sum
end

def f1(x)
  Math.sqrt(Math.exp(x) - 1)
end
def f2(x)
  Math.exp(x) * Math.sin(x)
end

func1 = integRectangle(0.2, 2.1, 1000000.0) {|x| f1(x)}
p func1.round(5)
func2 = integRectangle(0.0, Math::PI/2, 1000000.0) {|x| f2(x)}
p func2.round(5)
func1 = integTrapezoid(0.2, 2.1, 1000000.0) {|x| f1(x)}
p func1.round(5)
func2 = integTrapezoid(0.0, Math::PI/2, 1000000.0) {|x| f2(x)}
p func2.round(5)