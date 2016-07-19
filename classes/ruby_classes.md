
# Ruby Classes

Let's start by creating a class:

```ruby
class Person

end
```
Pretty simple stuff right?<br>

As you've heard many times before. In Ruby _everything is an object_... The job of a class is to define all of the logic and actions that will be available to your object. 
<br>

In order to **instantiate** (create) objects of a **class**, your class must include an initialize method


**Challenge 1 (part 1)** 

1. Create a Person class
2. Add an initialize method
	3. include the parameters
		- first_name
		- last_name
		- occupation 
<br>

The initialize method runs when you **create** an object (get it? **initialize**).
<br> 
Now, you'll need to turn those *parameters* into *arguments* and make them available throughout the class
<br>

**Challenge 1 (part 2)**

Take the attributes (first\_name, last\_name, and occupation) 
<br>

1. turn them into variables
2. make those variables available througout the class.


*hint: Think about scope and local variables. How do other methods get access to variables stored within this method?*

- - - -
##Instantiation

***Instantation*** - the 'computer-sciencey' way of saying "Let's create an object"

Now that we have an *intialize method* we can create an _instance_ (object) of the Person class.
<br> 

`good_guy = Person.new("jim", "gordon", "detective")`

When the code above runs, here is what happens: 

1. Person.new calls the initialize method
2. which in turn looks for the following paramaters 
	3. first\_name
	4. last\_name
	5. occupation
6. It then takes those paramaters and assigns them to instance variables (so we can have access to them)
7. We then assign the new **object** to the good_guy variable. 
8. So, good_guy is reflecting the *state* of this specific object.

Try printing good\_guy to the screen `puts good_guy` 
<br>
Run the program...

You'll probably notice that you get a return value similar to this:
`#<Person:0x007f84aa1af140>`

So, that's great. but what does it mean?
<br>
In a nutshell, this is showing us that good\_guy belongs to the Person class... and all the numbers are the location of this object in memory. 

Try this:
 print good\_guy to the screen 2 or 3 times and re-run the script several times.
 
 ```ruby
 puts good_guy
 puts good_guy
 puts good_guy
 ```
 
 You'll see that the numbers after `#<Person:` change each time, but they are the same on all 3 lines


```
#<Person:0x007fd83b866788>
#<Person:0x007fd83b866788>
#<Person:0x007fd83b866788>
```

- - - -
##Getters and Setters

So, cool... we can see our object is being created, which is great. But getting back this blob of information isn't really going to be useful to an end-user of our program.

How do we get access to the first_name?

This should be as simple as calling `puts good_guy.first_name` right?
<br>
Try it...
Change the last line of your program and run the script.
<br>

Well... that sucks. you probably got an output like this:

```
#<Person:0x007ff849912898>
#<Person:0x007ff849912898>
people.rb:14:in `<main>': undefined method `first_name' for #<Person:0x007ff849912898> (NoMethodError)
```

Let's break this down <br>

The error message is trying to help us by saying that **first_name** is an undefined method on the object. 
So... how do we fix it?

We could try creating a method. 
 
 **Challenge 2**

1. Create a first_name method 
2. Call the method and make it print to the screen.
 


Okay, so what's happening here? 
We are creating an ***instance method*** that gives us access to the @first_name variable. 
<br>
Now when we call `puts good_guy.first_name` we'll get back the following:

```
#<Person:0x007fde73a4f408>
#<Person:0x007fde73a4f408>
jim
```

This type of method is referred to as a **getter**. That's right, it allows for us to access the object's attribute. (in this case, the attribute is first_name).
<br>


That's great! But what if we want to update the object's first_name attribute?
<br>
To update the attribute you simply type: `object.attribute = "whatever the new attribute should be"`
<br>

So, we could try this:

```ruby
good_guy.first_name = "james"
puts good_guy.first_name 
```

However, that will produce another error:

```
#<Person:0x007f82721ae860>
#<Person:0x007f82721ae860>
jim
people.rb:23:in `<main>': undefined method `first_name=' for #<Person:0x007f82721ae860> (NoMethodError)
```
Ah! another **NoMethodError**, By now, I'm sure you're thinking "Oh! we just need another method!"
<br>
...And you'd be right! we need a **setter** method...
<br> Here's how you do it:

```ruby
 # setter method in ruby
  def first_name=(new_name)
    @first_name = new_name
  end
```
So, what's happening here is pretty simple. (Don't let the = sign throw you off). Because we want to redifine the @first\_name attribute, we'll need to pass a new\_name argument. Then, we take that new_name parameter, turn it into an argument and assign the new value to the @first\_name instance variable.


try running this now:

```ruby
good_guy = Person.new("jim", "gordon", "detective")

puts good_guy
puts good_guy
puts good_guy.first_name
good_guy.first_name = "james"
puts good_guy.first_name
```
You should get the following:

```
#<Person:0x007fe0340fe440>
#<Person:0x007fe0340fe440>
jim
james
```

Awesome! you've just created getter and setter instance methods!

**Challenge 3**

- Write the getter and setter methods for the last_name and occupation attributes.

- - - -

## Instance Methods

Now we can retrieve and update the attributes of this object.<br>
However, in order to review the attributes we'll have to look at them individually 

```ruby
puts good_guy.first_name
puts good_guy.last_name
puts good_guy.occupation
```
or

```ruby
puts "#{good_guy.first_name} #{good_guy.last_name}, #{good_guy.last_name}"
```
Either way, we going to have to repeat this code more than once. Looks like we need an **instance method**
<br>
An instance method is an action that's available to each object in the class. 

**Challenge 4**

1. Create an instance method titled list_attributes 
2. Make it output all of the attributes
<br>

With the list\_attributes method available we can simply call: `puts good_guy.list_attributes`<br>

Update your script and run it to insure that everything is working properly.

```ruby
good_guy = Person.new("jim", "gordon", "detective")

puts good_guy
puts good_guy
puts good_guy.list_attributes
good_guy.first_name = "james"
good_guy.last_name = "Gordon"
good_guy.occupation = "Commissioner"
puts good_guy.list_attributes
```

You should get an output similar to this:

```shell
#<Person:0x007f8284075388>
#<Person:0x007f8284075388>
jim gordon, detective
james Gordon, Commissioner
```


##attr_'s

This is all well and good, but it seems like a lot of code duplication. You're probably thinking, "What if there was a method had all the functionality of getter's and setter's?"
<br>
And if you are thinking that, then you'd be correct! Thankfully Ruby has attr methods that will help us out.
<br>

`attr_reader` is the equivalent of a getter method. Here's how it works:

```ruby
class Person

	attr_reader :first_name, :last_name, :occupation
	
	def initialize(first_name, last_name, occupation)
		@first_name = first_name
		@last_name = last_name
		@occupation = occupation
	end

end
```

So, what's happening here?<br>
`attr_reader` is a method that accepts multiple paramters. So when we call `attr_reader` and pass in the attributes (from our initialize method) we are essentially doing this:<br>
`attr_reader(:first_name, :last_name, occupation)`<br>
`attr_reader` takes those parameters and writes the entire getter method each attribute.

<br>
Pretty cool right?
<br>

Now at this point, you're probably thinking "Well what about the setter method?" <br>
`attr_writer` to the rescue!
<br>
`attr_writer` will take care of all your setter needs. Here's how it looks in the class:

```ruby
class Person

    attr_reader :first_name, :last_name, :occupation
    attr_writer :first_name, :last_name, :occupation
    
    #other code
end
    
```

Now you can delete all that getter and setter code in your class. Go ahead, do it now. 
<br>

Whew! that feels better right? 
<br>

However, now that I'm looking at this, it seems like we still have some code duplication. Good news! Ruby has a method that combines the attr\_reader and attr\_writer methods into one. 

**Challenge 5**

Go to the [documentation](http://ruby-doc.org/core-2.0.0/Module.html#method-i-attr) and find the solution.

<br>

Finally, run your code and make sure everything is still working. 
- - - -

## Inheritance 

So now we have a class for People, we can create as many People objects as we want. Which is great... for normal people... but what about Superhero's? <br>
I mean, yeah, they have all the same attributes as normals, but they also have superpowers and sweet costumes. 

How do we account for that in our Person class? <br>
Easy answer... We don't.

We'll need to create a Superhero class 

**Challenge 6** 
Create a Superhero class


<br>
Okay, so now we have a superhero class. The good news is that superhero's have a lot of the same attributes as regular people. So we can make our Superhero class inherit from the Person class. 

```ruby
class Superhero < Person

end
```

Now Superhero get's access to all the methods in our Person class. <br> 
Go ahead and test it. 

**Challenge 7**

Instantiate a superhero object named batman <br>
*for now, make "Batman" his occupation*

Try calling the list_attributes instance method on our batman object. <br> 
It works right? pretty cool eh? <br>
Even though our Superhero class doesn't define the method, it has access due to inheritance


Also, worth noting, the initialize method fired even though the Superhero class doesn't have one defined.
<br>

As discussed before, Superhero's have special powers and secret identities. (Which is why we need to create another separate class for them).<br>
In programming terms, this would mean that *objects of the Superhero class have special actions (methods)*. These special actions are only available to **objects** of the **Superhero class**. <br>


**Challenge 8**

To get a better understanding of this, let's create an instance method for the Superhero class.<br>
All Superhero's have a secret identity right? 

- Create an instance method that (when called) reveals the secret identity of the superhero object.
- Call it to insure that it works as expected. 


Great! So now our Superhero objects have access to all of the methods and abilities of the person class, but also have their own instance method's and actions. 
- - - - 

## Super

In the above example, we've chosen to *override* the `initialize` method. This is so that we can get more functionality out of our the method in our new class. 
While this is simply done by using the same method name, often you'll want some of the same functionality from the method you've overwritten. Ruby makes this very simple by giving you the `super` keyword. 

*`super` will first call the original method (inherited from the parent class) and then run the actions of your current method*

- - - -
## Answers

####Challenge 1
```ruby
#(part 1)
class Person
	def initlialize(first_name, last_name, occupation)
	
	end
end
```	
```ruby
# (part 2)
def initialize(first_name, last_name, occupation)
	@first_name = first_name
	@last_name = last_name
	@occupation = occupation
end
```

####Challenge 2
```ruby
def first_name
	@first_name
end
```
  
####Challenge 3
```ruby
def last_name
	@last_name
end

def last_name=(new_name)
	@last_name = new_name
end

def occupation
	@occupation
end

def occupation=(new_occupation)
	@occupation = new_occupation
end  
```

####Challenge 4
```ruby
def list_attributes
  "#{@first_name} #{@last_name}, #{@occupation}"
end
```

### Challenge 5
```ruby
attr_accessor :first_name, :last_name, :occupation
```

### Challenge 6
```ruby
class Superhero

end
```

### Challenge 7
```ruby
batman = Superhero.new("bruce", "wayne", "batman")
```

### Challenge 8
```ruby
def secret_identity
  "#{@first_name} #{last_name}"
end
```

### Result
```ruby
class Person
  attr_accessor :first_name, :last_name, :occupation

  def initialize(first_name, last_name, occupation)
  	@first_name = first_name
  	@last_name = last_name
  	@occupation = occupation
  end

  def list_attributes
    "#{@first_name} #{@last_name}, #{@occupation}"
  end
end

class Superhero < Person
  attr_accessor :super_power, :hero_name

  def initialize(first_name, last_name, occupation, super_power)
    super(first_name, last_name, occupation)
    @hero_name = occupation
    @super_power = super_power
  end

  def secret_identity
    "#{@first_name} #{last_name}"
  end
end
```
