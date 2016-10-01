VALID_CHOICES = %w(r p sc l sp)
ABBREVIATION_TRANSLATION = %w(rock paper scissors lizard spock)

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  (first == 'r' && second == 'sc') ||
    (first == 'sc' && second == 'p') ||
    (first == 'p' && second == 'r') ||
    (first == 'r' && second == 'l') ||
    (first == 'l' && second == 'sp') ||
    (first == 'sp' && second == 'sc') ||
    (first == 'sc' && second == 'l') ||
    (first == 'l' && second == 'p') ||
    (first == 'p' && second == 'sp') ||
    (first == 'sp' && second == 'r')
end

def display_result(player, computer)
  if win?(player, computer)
    prompt("You win this round!")
  elsif win?(computer, player)
    prompt("You lose this round!")
  else
    prompt("This round is a tie!")
  end
end

def choices
  current = 0
  loop do
    prompt("#{VALID_CHOICES[current]} = #{ABBREVIATION_TRANSLATION[current]}")
    current += 1
    break if current >= 5
  end
end

def translate
  choose = {r: "rock", p: "paper", sc: "scissors", l: "lizard", sp: "spock"}
  if choose.has_key?(:rock)
    prompt(choose[:rock])
  end  
end

translate

def score(player, computer)
  if win?(player, computer)
    increment_player_score()
  elsif win?(computer, player)
    increment_computer_score()
  end
end

def increment_player_score
  $player_score += 1
end

def increment_computer_score
  $computer_score += 1
end

def timer
  b = 4
  loop do
    prompt("next round will start in #{b} seconds")
    sleep(1)
    b -= 1
    break if b.zero?
  end
end

choice = ''

loop do
  $player_score = 0
  $computer_score = 0
  round = 0

  loop do
    system("clear")
    round += 1
    puts("----------round #{round}----------")
    choices()
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")

    loop do
      choice = gets.chomp.downcase

      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("That is not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.sample

    prompt("You chose #{translate(choice)}; computer chose #{translate(computer_choice)}")

    display_result(choice, computer_choice)
    score(choice, computer_choice)

    prompt("your score is #{$player_score}; the computer's score is #{$computer_score}")

    break if $player_score == 5 || $computer_score == 5
    timer
  end

  if $player_score >= $computer_score
    prompt("you win the game!")
  else
    prompt("You lose the game!")
  end

  prompt("would you like to play again? y to confirm")
  play_again = gets.chomp.downcase
  break if play_again != 'y'
end

prompt("Thanks for playing!")
