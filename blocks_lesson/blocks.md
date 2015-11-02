#Ruby Blocks

What is a block? 

```ruby 
numbers = [3,2,1]

numbers.each do |x|
	puts "#{x}"
	sleep(1)
end
```

**blocks are the code that sit between the *do* and *end* in your ruby code** 

Procs are for storing your block in a named variable

```ruby
countdown = Proc.new do |x|
	puts "#{x}" 
	sleep(1)
end
```
You can then invoke a Proc in place of your block.

```ruby
numbers.each(&countdown)
```
