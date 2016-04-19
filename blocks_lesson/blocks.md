##Ruby Blocks

#### What is a block? 

The best way for you to understand blocks in Ruby is to look at the code:

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

#### Special Arguments
Blocks allow you to pass a series of instructions to a method as a special argument

You are already super familiar with blocks as you've been using them with `.each` `.map` etc. 

Let's break down `.map`. <br> First we'll start with an array:

```ruby
students = ["aj", "melvin", "ashley"]
```

Next we'll call `.map` on the students array and use the `.upcase` method on each item:

```ruby
completed_homework = students.map do |student|
	student.upcase
end
```

The end result will be:

```ruby
completed_homework
#=> ["AJ", "MELVIN", "ASHLEY"]
```

So, what happened here?

- `.map` returns a new array
	- containing the modified contents of the previous array
	- leaving the original array as-is
- The new array (that `.map` returns) is a result of the **block**'s instructions 
	- `.map` takes a block
	- uses the block instruction to transform the array items
	- returns the results as a new array

### Using `&:`

Ruby offers a handy way to shorten your code if you're using the same operation of each of your array elements. 

Let's look at our previous example of transforming the student array to see how this would work:

```ruby
upcased = students.map(&:upcase)
```
We know that we are going to use the upcase method on each item in the array.<br>
Using the `&:` syntax notifies the ruby interpreter that it should take the same action on each array item. 

*note: While this pattern is not necessary, you will find it heavily used in many Ruby Libraries*

**class challenge 1:**

- create an array of at least 4 numbers
- write a block that prints the exponent of each item in your array
	- multiply the individual to to it's own power 
	- **4<sup>4</sup>** (4 * 4 * 4 * 4)
- simply print the new results to the screen (don't worry about returning new values)


## Yield

Yield can be a confusing concept to initially understand. However, if you don't overthink it, you'll find that a magical concept that can be very useful. 

Let's look at an example

```ruby
def my_method
  puts "reached the top"
  yield
  puts "reached the bottom"
end

my_method do
  puts "reached yield"
end
```

As stated in this [excellent](http://mixandgo.com/blog/mastering-ruby-blocks-in-less-than-5-minutes) blog on Ruby Blocks: 
> when the execution of my_method reaches the line with the call to yield, the code inside the block gets executed. Then, when the code inside the block finishes, the execution of my_method continues.

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


## Homework

- Complete the remaining Ruby Monk Challenges
  - [Introduction to Ruby Methods](https://rubymonk.com/learning/books/1-ruby-primer/chapters/19-ruby-methods/lessons/57-being-methodical)
  - [Introduction to Lambdas and Blocks](https://rubymonk.com/learning/books/1-ruby-primer/chapters/34-lambdas-and-blocks-in-ruby/lessons/77-lambdas-in-ruby)
  - [Introduction to Modules](https://rubymonk.com/learning/books/1-ruby-primer/chapters/35-modules/lessons/79-getting-modular)
  - [Introduction to IO](https://rubymonk.com/learning/books/1-ruby-primer/chapters/42-introduction-to-i-o/lessons/89-streams)
- Complete the 02_calculator challenge in the Learn Ruby Test Suite
- Read [this](http://mixandgo.com/blog/mastering-ruby-blocks-in-less-than-5-minutes) article