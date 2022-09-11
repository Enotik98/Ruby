#Task 1
def task1 (dots)
  sum = 0.to_f
  for i in 0..dots.size-1 do
    if i == dots.size-1
      sum += (dots[i][0] + dots[0][0])*(dots[i][1] - dots[0][1])
    else
      sum += (dots[i][0] + dots[i+1][0])*(dots[i][1] - dots[i+1][1])
    end
  end
  sum = (sum.abs)/2
end

#Task 2
def task2 (p, t, r)
  $p = 4
  $t = 32
  $r = 16

  $res = p**r * (1 - 1/(p**t))

end

#Task 3
def BinaryToDecimal (value_)
  $Base = 2
  $val = 0
  value_.split('').map(&:to_i).reverse.each_with_index do
    |dig, index|
    if dig == 1
      $val += $Base**index
    end
  end

  $val
end

#Task 4
def DecimalToBinary (value)
  res = ''
  while value > 0
    res += (value % 2).to_s
    value /= 2
  end

  res.reverse
end

dotsV3 = [[69,43],[110, 46], [147, 50], [186, 45], [238, 37], [298, 34], [344, 34], [396, 57], [429, 79], [482, 149],
        [485, 215], [488, 273], [443, 314], [350, 307], [271, 299], [207, 275], [177, 206], [136, 168], [97, 141],
        [47, 95], [49, 71], [56, 57]]
print "task1 = " + task1(dotsV3).to_s + "\n"
dotsTest = [[1,1],[4, 2], [5, 3]]
print "task1 test = " + task1(dotsTest).to_s + "\n"
print "task 2 = " + task2(4, 32, 16).to_s + "\n"
print "task2 test = " + task2(6, 15, 10).to_s + "\n"

task3 = "10000100101"
print "task 3: " + task3 + " to Decimal = "+ BinaryToDecimal(task3).to_s + "\n"

task4 = 451
print "task 4: " + task4.to_s + " to Binary = " + DecimalToBinary(task4).to_s + "\n"