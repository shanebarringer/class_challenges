##Ruby Blocks

What is a block? 

```ruby 
numbers = [3,2,1]

numbers.each do |x|
	puts "#{x}"
	sleep(1)
end
```

**a block contains the code that sits between _*do*_ and _*end*_ in your ruby code** 

Blocks are temporary methods without names. (we could call them anonymous methods). Instead of naming the method, we treat it like an argument to another method. 

*Instead of naming the method however, we treat a block like an argument to another method*

```ruby
some_numbers = [1,2,3,4]

some_numbers.each do |number|
	puts number * number
end
```

**class challenge 1:**

- create an array of at least 4 numbers
- write a block that prints the exponent of each item in your array
	- multiply the individual to to it's own power 
	- **4<sup>4</sup>** (4 * 4 * 4 * 4)
- simply print the new results to the screen (don't worry about returning new values)


## Procs

Procs are for storing your block in a named variable


```ruby
countdown = Proc.new do |x|
	puts "#{x}" 
	sleep(1)
end

# instantiate an object of the Proc class (called a proc object)

```
You can then invoke a Proc in place of your block.

```ruby
numbers.each(&countdown)
```

##### Class Challenge 2: 
- Turn your exponent block into a proc
- Produce a new array with the exponents of your original array


### Class Challenge Answers

##### Challenge 1 Answer: 

```ruby
some_numbers.each do |num|
  puts num ** num
end
```

##### Challenge 2 Answer: 

```ruby 
exponify = Proc.new{|x| x ** x }
exponents = some_numbers.map(&exponify)
```
_ _ _ _

