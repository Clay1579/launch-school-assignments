
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'en'

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def operation_to_message(op)
  operation = case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
  operation
end

def number?(num)
  integer?(num) || float?(num)
end

def integer?(num)
  num.to_s == num.to_i.to_s
end

def float?(num)
  num.to_f.to_s == num
end

def prompt(key)
  message = messages(key, LANGUAGE)
  Kernel.puts("=> #{message}")
end

prompt('welcome')

name = ''

loop do
  name = Kernel.gets.chomp

  if name.empty?()
    prompt('valid_name')
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop

  number1 = 0
  number2 = 0

  loop do #Input numbers
    prompt('number1')
    number1 = Kernel.gets().chomp()

    if number?(number1)
      break
    else
      prompt('valid_number')
    end
  end

  loop do
    prompt('number2')
    number2 = Kernel.gets().chomp()

    if number?(number2)
      break
    else
      prompt('valid_number')
    end
  end


  operator_string = <<-MSG
  What operation would you like to perform?
  1) add
  2) subtract
  3) multiply
  4) divide
  MSG

  prompt(operator_string)
  operator = ''

  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(valid_operator)
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
    when '1'
      number1.to_i + number2.to_i
    when '2'
      number1.to_i - number2.to_i
    when '3'
      number1.to_i * number2.to_i
    when '4'
      number1.to_f / number2.to_f
    end

  prompt("The result is #{result}")

  prompt('do_again')
  answer = Kernel.gets.chomp

  break unless answer.downcase.start_with?("y")

end

prompt('bye')