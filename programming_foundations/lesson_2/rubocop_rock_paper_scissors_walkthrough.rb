VALID_CHOICES = %w(rock paper scissors)

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'scissors' && second == 'paper') ||
    (first == 'paper' && second == 'rock')
end

def display_result(player, computer)
  if win?(player, computer)
    prompt("You win!")
  elsif win?(computer, player)
    prompt("You Lose!")
  else
    prompt("It's a tie!")
  end
end

choice = ''

loop do
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That is not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{choice}; computer chose #{computer_choice}")

  display_result(choice, computer_choice)

  prompt("Would you like to play again? y to confirm")
  do_again = gets.chomp.downcase

  break if do_again != 'y'
end

prompt("Thanks for playing! Goodbye")
