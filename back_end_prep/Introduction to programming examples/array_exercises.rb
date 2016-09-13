#array exercises
#1:

arr = [1, 3, 5, 7, 9, 11]
number = 3

arr.each do |num|
  if num  == number
    puts "#{number} is in the array"
  end
end

#7:

array1 = [1, 2, 3, 4, 5]
array2 = []

array1.each do |x|
  array2 << x + 2
end

p array1
p array2