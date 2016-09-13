#flow control exercises
#2:

def caps(string)
  if string.length > 10
    string.upcase
  end
end

puts caps('joe smith')
puts caps('donald trump is an idiot!')
puts caps('unknown')

#3:

puts "put a number between 0 and 100"
number = gets.chomp.to_i

if number < 0
  puts "not within 0 and 100"
elsif number > 0 && number <= 50
  puts "the number is between 0 and 50"
elsif number > 50 && number <= 100
  puts "the number is between 50 and 100"
elsif number > 100
  puts "the number is greater than 100"
end

#5:

case number
when number < 0
  puts "below 0"
when 0..50
  puts "between 0 and 50"
when 51..100
  puts "between 50 and 100"
when number > 100 
  puts "over 100"
end