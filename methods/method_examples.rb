# step 1
def greeting
  puts "hi, what's your name?"
  name = gets.chomp
  puts "nice to meet you #{name}"
end

# step 2
def argument_greeting(name)
  puts "hi! #{name}! it's nice to meet you"
end

# step 3
def return_name
  puts "hi, what's your name?"
  name = gets.chomp
  name.upcase
end

# step 4
def better_greeting
  puts "nice to meet you #{return_name}"
end

# write a method that YELLS the person's name
# write a addition method
# write a tip calculation method

# argument_greeting(return_name)

@todos = []

def todo
  puts 'what would you like to add?'
  foo = gets.chomp
  @todos << foo
  @todos
end

loop do
  puts 'would you like to add another item?'
  answer = gets.chomp
  break if answer == 'no'
  todo
  puts "#{@todos}"
end

puts "so your total todos are: \n#{@todos.join("\n")}"

def tip_amount(amount)
  amount * (0.2)
end

def total_with_grat(amount)
  tip_amount(amount) + amount
end

puts 'hi what was your total bill?'
bill_amount = gets.chomp.to_i
puts "your total bill is: $#{sprintf('%.2f', total_with_grat(bill_amount))}"

students = %w(foo bar baz)
students.map(&:capitalize)
