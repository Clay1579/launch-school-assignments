#exercises from the "other" section of the first ruby book
#1:

def check_in(word)
  if /lab/ =~ word
    puts word
  else
    puts "No match"
  end
end


check_in("laboratory")
check_in("lab")
check_in("Hitler")

#4: 

def execute(&block)
  block.call
end

execute { puts "Hello from inside the execute method" }