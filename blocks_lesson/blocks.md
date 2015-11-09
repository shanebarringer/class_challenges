#Ruby Blocks

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

```ruby
some_numbers = [1,2,3,4]

some_numbers.each do |number|
	puts number * number
end
```

**class challenge:**

print the exponent of each item. 

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

_ _ _ _

