require 'matrix'
require 'test-unit'
class Test_ < Test::Unit::TestCase
  attr_accessor :a, :res
  def setup
    @a = [[1, 1, 7, 3, 0, 8, 2, 8],
                [2, 1, 7, 1, 1, 0, 2, 6],
                [9, 0, 1, 5, 7, 7, 2, 1],
                [5, 4, 5, 1, 7, 6, 9, 9],
                [6, 3, 1, 4, 1, 2, 7, 9],
                [4, 7, 5, 8, 1, 1, 9, 3],
                [8, 4, 4, 2, 4, 0, 1, 1],
                [5, 3, 7, 2, 5, 9, 2, 1]]
    @res = [[1, 2, 9, 5, 6, 4, 8, 5],
                 [1, 1, 0, 4, 3, 7, 4, 3],
                 [7, 7, 1, 5, 1, 5, 4, 7],
                 [3, 1, 5, 1, 4, 8, 2, 2],
                 [0, 1, 7, 7, 1, 1, 4, 5],
                 [8, 0, 7, 6, 2, 1, 0, 9],
                 [2, 2, 2, 9, 7, 9, 1, 2],
                 [8, 6, 1, 9, 9, 3, 1, 1]]

  end
  def test1
    a = Matrix[*@a]
    a = a.transform(8)
    a = a.to_a
    assert_equal(a, @res)
  end
end
class Integer
  def random
    return rand(10)
  end
end

class Matrix
  attr_accessor :matrix, :size
  def []=(i, j, value)
    @rows[i][j] = value
  end
  def transform(size)
    @size = size
    matrix = Array.new(size) {Array.new(size)}
    (0...size).each {|i|
      (0...size).each {|j|
        matrix[i][j] = @rows[j][i]
      }
    }
    @matrix = matrix
  end
end

x = 0
arr = (0..7).map{ Array.new(8)}

a = Matrix[*arr]
(0..7).each { |i|
  (0..7).each { |j|
    if i == j
      a[i, j] = 1
    else
      a[i, j] = x.random
    end

  }
}
puts a.to_a.map(&:inspect)
print"\n"

a = a.transform(8)
puts a.to_a.map(&:inspect)


