
VALID_CHOICES = { r: 'rock', p: 'paper', sc: 'scissors',
                  l: 'lizard', sp: 'spock' }

WINNING_CONDITIONS = { r: %w(sc l), p: %w(r sp), sc: %w(p l),
                       l: %w(p sp), sp: %w(r sc) }

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  if WINNING_CONDITIONS[first.to_sym].include? second.to_s
    true
  else
    false
  end
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
  VALID_CHOICES.each do |key, value|
    puts "#{key} = #{value}"
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

def translate(thing)
  VALID_CHOICES[thing.to_sym].to_s
end

def score(player, computer, scores)
  if win?(player, computer)
    scores[:player_score] += 1
  elsif win?(computer, player)
    scores[:computer_score] += 1
  end
end

def timer
  seconds = 4
  4.times do
    prompt("next round will start in #{seconds} seconds")
    sleep(1)
    seconds -= 1
  end
end

def another_game
  play_again = ''
  loop do
    play_again = gets.chomp.downcase
    break if play_again == 'y' || play_again == 'n'
    prompt("you must answer 'y' or 'n'")
  end
  play_again
end

choice = ''
scores = { player_score: 0, computer_score: 0 }

loop do
  scores[:player_score] = 0
  scores[:computer_score] = 0
  round = 0

  loop do
    system("clear")
    round += 1
    puts("----------round #{round}----------")
    choices()
    prompt("Choose one: #{VALID_CHOICES.values.join(', ')}")

    loop do
      choice = gets.chomp.downcase.to_sym

      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("That is not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.keys.sample.to_sym

    prompt("You chose: #{translate(choice)}")
    prompt("computer chose: #{translate(computer_choice)}")

    display_result(choice, computer_choice)
    score(choice, computer_choice, scores)

    prompt("your score is: #{scores[:player_score]}")
    prompt("the computer's score is #{scores[:computer_score]}")

    break if scores[:player_score] == 5 || scores[:computer_score] == 5
    timer
  end

  if scores[:player_score] >= scores[:computer_score]
    prompt("you win the game!")
  else
    prompt("You lose the game!")
  end

  prompt("would you like to play again? y to confirm, n to cancel")

  break if another_game == 'n'
end

prompt("Thanks for playing!")
