#hash exercises
#1:

family = {  
  uncles: ["bob", "joe", "steve"],
  sisters: ["jane", "jill", "beth"],
  brothers: ["frank","rob","david"],
  aunts: ["mary","sally","susan"]
}

immediate_family = family.select do |k, v|
  k == :sisters || k == :brothers
end

arr = immediate_family.values.flatten

p arr

#2:

person = {name: "bob"}
weight = {weight: "150 lbs"}

puts bob.merge(weight)
puts bob
puts weight
puts bob.merge!(weight)
puts bob
puts weight

#3:

bob = {age: 23, number:6, random: 2100}

bob.each_key {|key| puts key}
bob.each_value {|value| puts value}
bob.each {|key, value| puts "Bob's #{key} is #{value}"}

#5:

if bob.has_value?(23)
  puts "Got it!"
else
  puts "Nope!"
end

#6:

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

result = {}

words.each do |word|
  key = word.split('').sort.join
  if result.has_key?(key)
    result[key].push(word)
  else
    result[key] = [word]
  end
end

result.each do |k, v|
  puts "------"
  p v
end

