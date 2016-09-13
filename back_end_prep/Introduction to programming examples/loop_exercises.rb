#2:

x = ""
puts "pick a number to count down from"

while x != 'stop' do
  puts "how's it going?"
  x = gets.chomp
end

#3:

top_south_park_episodes = ['Kenny Dies', 'Douche and turd', '200', '201', 'Where My Country Gone?']

top_south_park_episodes.each_with_index do | episode, index |
  puts "#{index + 1}. #{episode}"
end

#4:

def count_to_zero(number)
  if number <= 0
    puts number
  else
    puts number
    count_to_zero(number-1)
  end
end

count_to_zero(11)