a = Array.new 10
b = Array.new 10
for i in 0..10
  a[i] = rand(10)
  b[i] = rand(10)
end
a.each { |x| print x }
print"\n"
b.each { |x| print x }
c = a.find_all{|elem| (b.include?(elem))}
print"\n"
c.each { |x| print x }

