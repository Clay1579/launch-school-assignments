def prompt(message)
  puts "=> #{message}"
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num
end

def number?(num)
  integer?(num) || float?(num) && num > 0
end

prompt("Welcome to the loan calculator")

loop do

  loan_amount = 0
  loan_duration_y = 0
  loan_duration_m = 0
  apr_p = 0
  mpr_p = 0
  mpr_f = 0
  monthly_payment = 0.0

  prompt("please enter the loan amount")
  loop do #Loan amount
    loan_amount = gets.chomp
    break if number?(loan_amount) == true && loan_amount.to_i > 0
    prompt("Please enter an actual loan amount guy")
  end

  prompt("Please enter the annual loan percentage rate")
    loop do
      apr_p = gets.chomp
      break if number?(apr_p) == true && apr_p.to_i > 0
      prompt("please enter an actual apr guy")
    end

  prompt("Please enter the loan duration in years")
    loop do 
      loan_duration_y = gets.chomp
      break if number?(loan_duration_y) == true && loan_duration_y.to_i > 0
      prompt("Please enter an actual loan duration guy")
    end

  loan_duration_m = loan_duration_y.to_i * 12
  mpr_p = apr_p.to_i.to_f / 12
  mpr_f = mpr_p.to_f / 100

      
  monthly_payment = loan_amount.to_f * (mpr_f / (1 - (1 + mpr_f)**-loan_duration_m.to_i))

  prompt("Your monthly payment is: $#{format('%02.2f', monthly_payment)}")

  prompt("Would you like to make another calculation? 'y' to confirm")
  repeat = gets.chomp.downcase
  break if repeat != 'y'
end

prompt("Thanks for using the calculator")
