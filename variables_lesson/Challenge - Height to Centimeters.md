# Challenge - Height to Centimeters
- - - -
### Part 1 - Variables
-
1. Create a file named `height_to_centimeters.rb`
1. Store your name and height (in inches) into variables. 
1. Concatenate those variables into a sentence and have it print to the screen.
1. For example: Shane is 60 inches tall
	

1. Once complete, add in a weight variable:

- - - - 
### Part 2 - Add User Input

1. Make the program interactive
2. Ask the user for input on:
	- name
	- height
	- weight
3. Store that input in a variable 


- - - -
### Part 3 - Create the Conversion

1. Create variables that will convert the data to the metric system 
2. To get height in centimeters multiply the your previous height variable by 2.54


3. To get weight in Kilograms multiply the weight variable by 0.453592

	```ruby
	weight_kilograms = weight_pounds * 0.453592
	```
		
4. Print the new data to the terminal

- - - -
### Challenge Answers

#### Part 1

```ruby
my_name = 'John Smith'
		
height_inches = 60
		
puts my_name + " is " + 
height_inches.to_s + " inches tall."
```

```ruby
weight_pounds = 160
```
#### Part 2

```ruby
puts "Hi! what's your name?"
my_name = gets.chomp
		
puts "How tall are you (in inches)?
height_inches = gets.chomp
		
puts "If you don't mind me asking,
how much do you weight?
weight_pounds = gets.chomp
			
puts "#{my_name} is #{height_inches} 
inches tall and weighs #{weight_pounds}"
```		

#### Part 3

```ruby
height_centimeters = height_inches * 2.54
```
```ruby		
puts "{my_name} is #{height_centimeters} cm 
and #{weight_kilograms} kg"
```		

##### Completed Code

```ruby
puts "Hi! what's your name?"
my_name = gets.chomp

puts "How tall are you (in inches)?"
height_inches = gets.chomp.to_f

puts "If you don't mind me asking,
how much do you weight?"
weight_pounds = gets.chomp.to_f

height_centimeters = height_inches * 2.54

weight_kilograms = weight_pounds * 0.453592

puts "#{my_name} is #{height_centimeters} cm and #{weight_kilograms} kg"
```
