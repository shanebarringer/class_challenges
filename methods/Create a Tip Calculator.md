# Create a Tip Calculator
-


### Step 1
- - - - 
- create a variable that stores the amount of bill (w/o gratutity) 

- create a method that returns 20% of the total bill

```
def calculation(amount)
  return amount * (0.2)
end


puts "hi what was your total bill?"
answer = gets.chomp.to_i
puts calculation(answer)

```
- check it out and make sure that calculation is doing what you expect (I recommend using whole numbers like 100)

----
### Step 2
- - - -
- Add in a method that SUMS the total bill + plus the tip amount

- print the total bill to the screen

``` 
def calculation(amount)
  return amount * (0.2)
end

def total(amount)
  return calculation(amount) + amount
end

puts "hi what was your total bill?"
answer = gets.chomp.to_i

calculation(answer)
total(answer)

puts "your total is #{total(answer)}"
```

----
### Step 3 - Refactor!

- This looks good, but you'll notice that we are running the same method several times. 

- Because we are writing clean, DRY code, we can actually call the total(amount) method one time. 

``` 
def calculation(amount)
  return amount * (0.2)
end

def total(amount)
  return calculation(amount) + amount
end

puts "hi what was your total bill?"
answer = gets.chomp.to_i
puts "your total bill is: $#{total(answer))}"
```
- Now, 1 more thing... we need to fix that float to reflect an actual dollar amount. The easiest way to do this, is to use the sprintf method

```
puts "hi what was your total bill?"
answer = gets.chomp.to_i
puts "your total bill is: 
$#{sprintf('%.2f', total(answer))}"
```




