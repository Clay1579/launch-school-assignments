#The final exercises from the first ruby book
#1:

array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

array.each do |x|
  puts x
end

#2:

array.each do |x|
  if x > 5
    puts x
  end
end

#3:

array2 = array.select { |number| number % 2 != 0}

#4:

array.unshift(0)
array.push(11)

#5:

array.pop
array.push(3)

#6:

array.uniq

#8:

hash = {:name => 'bob'}
hash = {name: 'joe'}

#9:

h = {a:1, b:2, c:3, d:4}

h[:b]
h[:e] = 5
h.delete_if do |k, v|
  v < 3.5
end

#10:

hash = {names: ['rick', 'mohammed', 'hassan']}

#12:

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
fields = [:email, :address, :phone]

contacts["Joe Smith"][:email] = contact_data[0][0]
contacts["Joe Smith"][:address] = contact_data[0][1]
contacts["Joe Smith"][:phone] = contact_data[0][2]
contacts["Sally Johnson"][:email] = contact_data[1][0]
contacts["Sally Johnson"][:address] = contact_data[1][1]
contacts["Sally Johnson"][:phone] = contact_data[1][2]

#13:

puts "Joe's email is #{contacts["Joe Smith"][:email]}"
puts "Sally's phone number is #{contacts["Sally Johnson"][:phone]}"

#14:

contacts.each_with_index do |(name, hash), idx|
  fields.each do |field|
    hash[field] = contact_data[idx].shift
  end
end

#15:

array3 = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

array3.delete_if { |word| word.start_with?("s") }

array4 = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

array4.delete_if { |word| word.start_with?("s", "w") }

#16:

a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']

a = a.map { |pairs| pairs.split }
a = a.flatten
p a