require 'test-unit'
class Test_ < Test::Unit::TestCase
  def test_calc
    sum = cal(method(:func), 0.5, 50)
    sum = sum.round(6)
    assert_equal(sum, 0.463648)
    sum = cal(method(:func), 0.9, 50)
    sum = sum.round(6)
    assert_equal(sum, 0.732815)
  end
end
def func(x, i)
  ((-1)**i) * ((x**(2*i+1))/(2*i + 1))
end
def cal (f, x, n)
  x_range = 0.1..1
  n_range = 10..58
  eps = 0.001

  unless x_range.include? x
    raise " x is out range"
  end

  res, cur = 0.0
  if n_range.include? n
    (0..n).each do|i|
      cur = f.call(x, i)
      res += cur
    end
  else
    i = 0.0
    while  cur.abs >= eps
      cur = f.call(x, i).to_f
      res += cur
      i += 1
    end
  end
  res
end

