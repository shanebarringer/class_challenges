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
