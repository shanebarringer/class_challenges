# Create a Tip Calculator
-

----
### Step 1 - tip_amount method
- - - - 
- create a bill_amount variable that stores the amount of the check (w/o gratutity) 
	

- create a method named tip_amount
	- insure that it takes the bill_amount variable as an argument
	- returns 20% of the total bill

- Run the script to insure that the tip_amount is doing what you expect (I recommend using whole numbers like 100 while testing)


	*hint: you'll need to multiply using a float, and don't forget to convert your answer into the proper data-type!*

----
### Step 2 - total\_with_grat method
- - - -
- Create a method that SUMS the bill_amount + the tip\_amount

- print the total bill to the screen

	*hint: you'll need to pass the bill_amount variable into the method as an argument*

----
### Step 3 - Refactor!

----

- This looks good, but you'll notice that we are running the same method several times. 

- Because we are writing clean, DRY code... 
	- we can actually call the total\_with_grat() method one time 
	- this will take care of all the calculations for us
- Give it a try! 

----

### Extra Credit!

----

- Now, 1 more thing... we need to fix that float to reflect two decimal points... 

- The easiest way to do this, is to use the [sprintf method](http://ruby-doc.org/core-2.2.0/Kernel.html#method-i-sprintf)
	- Go read up on the documentation and try to apply the correct formatting using sprintf()
<br>

----
<br>
<br>

##Answers

### Step 1 - Answer 
- - - -

```ruby
puts "hi what was your total bill?"
bill_amount = gets.chomp.to_i
```
<br>

```ruby 
def tip_amount(amount)total_with_grat
  return amount * (0.2)
end

puts "hi what was your total bill?"
bill_amount = gets.chomp.to_i
puts tip_amount(bill_amount)

```
----
### Step 2 - Answer

```ruby
def total_with_grat(amount)
  return tip_amount(amount) + amount
end
```
<br>

```ruby
puts "your total is #{total_with_grat(bill_amount)}"
```
<br>

```ruby
def tip_amount(amount)
  return amount * (0.2)
end

def total_with_grat(amount)
  return tip_amount(amount) + amount
end

puts "hi what was your total bill?"
bill_amount = gets.chomp.to_i

tip_amount(bill_amount)
total_with_grat(bill_amount)

puts "your total is #{total_with_grat(bill_amount)}"
```

----
### Step 3 - Answer

```ruby 
def tip_amount(amount)
  return amount * (0.2)
end

def total_with_grat(amount)
  return tip_amount(amount) + amount
end

puts "hi what was your total bill?"
bill_amount = gets.chomp.to_i
puts "your total bill is: $#{total_with_grat(bill_amount))}"
```
----
### Extra Credit - Answer

----
```ruby
puts "your total bill is: $#{sprintf('%.2f', total_with_grat(bill_amount))}"
```

---- 

### Full Answer

----

```ruby 
def tip_amount(amount)
  return amount * (0.2)
end

def total_with_grat(amount)
  return tip_amount(amount) + amount
end

puts "hi what was your total bill?"
bill_amount = gets.chomp.to_i
puts "your total bill is: $#{sprintf('%.2f', total_with_grat(bill_amount))}"
```

