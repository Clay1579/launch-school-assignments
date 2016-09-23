VALID_CHOICES = ['rock', 'paper', 'scissors']

def prompt(message)
  puts "=> #{message}"
end

def display_result(player, computer)
  if (player == 'rock' && computer == 'scissors') ||
    (player == 'scissors' && computer == 'paper')||
    (player == 'paper' && computer == 'rock')
    prompt("You win!")
  elsif (player == 'rock' && computer == 'paper') ||
    (player == 'scissors' && computer == 'rock') ||
    (player == 'paper' && computer == 'scissors')
    prompt("You lose!")
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
 