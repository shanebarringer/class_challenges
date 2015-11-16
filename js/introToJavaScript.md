#Intro to JavaScript

##Agenda 

This class is an intro to JavaScript. We will using the concepts we've learned from Ruby to enhance your understanding of JS. By the end of this class you should be familiar with the following. 

- JavaScript History
- What is JS?
- Fuctional vs Object Oriented
- Fundamental JS
- JS in the Browser
- DOM manipulation

Learning these skills is imperative to building fully functional Applications with Rails. And while this intro is not comprehensive, you will be equipped with basic knowledge to accomplish your goals and continue your path of learning. 



##History and Overview

- 1995 Netscape wanted to add scripting to web pages
- Brandon Eich wrote the first version in 10 days
- **JavaScript is not Java**
- JS is not Object Oriented... it is functional

- - - - 


## The JS Console

Because JS works in the browser, you can use the `console` in your DevTools as a `REPL` (think IRB).

You can open the JS Console by typing `cmd` +  `option` + `j`

Here you can: 

- test and log output from your pgogram
- scratch out ideas and concepts
- test out those new ideas
- interact with JavaScript variables, objects, etc. that have loaded with the page.

**Make it interactive:**

- console.log
- alert
- prompt
- confirm

**Further your understanding**

[W3 JS popups](http://www.w3schools.com/js/js_popup.asp)


## Variables

variable declarations are similar to Ruby, with the exception that you prepend the `var` keyword and end your declaration with a `;`

```javascript
var x = 1;
var y = "2";
var z = true;
```


**Challenge 1**

- When the page opens, ask the user for their name
- store user's input in a 'name' variable
- greet the person by name

<br>

**Challenge 1 Answer:**

```javascript
var name = prompt("Hi! what's your name?");

alert("It's nice to meet you " + name + ".");
```


**Futher your understanding**

[YDKJS Variables](https://github.com/getify/You-Dont-Know-JS/blob/master/up%20&%20going/ch1.md#variables)

## Coercion 

In Ruby, you can easily convert between strings, integers and floats with the `.to_s`, `.to_i`, and `.to_f` methods. The computer-sciency term for this process is coercion. 

JS has two types of coercion - Implicit and Explicit.<br>
Meaning that JS will do it's best to interperet/compare the values in an appropriate manner. 

**Implicit** coercion 

```javascript
7 + 7 + 7; // = 21


// First two 7's are calculated... then concatened into a string. 
// returning a string value
7 + 7 + "7"; // = "147"

// The entire expression is implicitly converted into a string and concatenated 
"7" + 7 + 7; // = "777"
```

Above, when we add Integers (numbers) together, we get a sum of 21. <br> However, in our second example. The first two 7's are calculated and then, converted into a string and concatenated with the string value of 7.<br>
In the final example, the entire expression is almost immediately converted into a string. 

**Explicit** coercion:

As you can see, JavaScript is trying to be helpful, and sometimes this *is* the desired behavior.
<br>
However, what happens when you retrieve data from a user and it needs to be forcibly coerced? This is where **Explicit** coercion comes in.

Let's say you are helping a local non-profit raise funds and the pledges are coming in through the website. Obviously, the data is going to come in a string. It then needs to be coerced into a number (so that it can be added). 

Here's an example:

```javascript
var amountRaisedSoFar = 1000;

var newDonation = prompt("How much would you like to donate?"); 

amountRaisedSoFar = Number(new_donation) + amountRaisedSoFar;

console.log("We have now raised: " + amountRaisedSoFar + "!");
```

Here we are taking the user input in as a string, then converting it into a number when adding it to the amountRaisedSoFar variable. 

Do you think this has permanently changed to newDonation variable? <br>
If so, why?  <br>
If not, how could we?<br>


Other helpful explicit coercion methods:

- `parseInt()` 
- `parseFloat()`
- `toString()`


All this talk of coercion brings us to our next topic...


**Dig Deeper:**

[YDKJS - Converting Between Types](https://github.com/getify/You-Dont-Know-JS/blob/master/up%20&%20going/ch1.md#converting-between-types)

## Values and Types

Types are kind-of super important in JS (as you don't have traditional classes). In Ruby, to find the class of an object, you can call the `.class` method.

JS offers us the `typeof` operator. Let's go ahead and check out how it works.

The types of data we've dealt with so far

```
var greet = "hi"
typeof greet; // "string"

var x = 25;
typeof x; // "number"

// you're familiar with boolean values from Ruby
var x = true
typeof x; // "boolean"

```

There are up to 7 types that can be returned by the typeof operator. You can find the rest in [Kyle Simpson's writeup on Values and Types](https://github.com/getify/You-Dont-Know-JS/blob/master/up%20&%20going/ch2.md#values--types). Go read that before continuing this lesson. 

**Dig Deeper**

- Did you read Kyle's writeup yet? if not... go do it now!

- - - -

## Null and Undefined

I don't want to get too far into the weeds here, but it's probably a good time to take a quick look at `undefined` and `null`

According to the [Mozilla Documentation](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/undefined)
> A variable that has not been assigned a value is of type undefined.

```javascript
var something;
typeof something // "undefined"
```
 
According to [Ajay Matharu](http://www.ajaymatharu.com/javascript-difference-between-undefined-and-null/)
> On the other hand, null is an assignment value. It can be assigned to a variable as a representation of no value.

(slightly modified) code sample from [Mozilla Documentation](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/null):

```javascript
// foo does not exist, it is not defined and has never been initialized:
foo
// "ReferenceError: foo is not defined"

// foo is known to exist now but it has no type or value:
var foo = null; foo
// "null"
```

Don't spend too much time on `null` at the moment. It will become clear when the time arises to use it. 


**Dig Deeper**

- Read all of the above links :)
- [StackOverflow Explanation](http://stackoverflow.com/questions/5076944/what-is-the-difference-between-null-and-undefined-in-javascript)

- - - -

## Equality ? 

As in Ruby, most (if not all) of the standard operators are available for you to use freely. yay!

Branching in JS works very similar to branching in JS:

**Ruby version:**

```ruby
cups = 1

if cups < 3
	puts "Yes. I'll take another cup of coffee!"
else
	puts "I think I'm okay for now"
end
```

****

```javascript
var cups = 1

if(cups < 3){
	console.log("Yes. I'll take another cup of coffee!");
} else {
	console.log("I think I'm okay for now.");
}
```

*sidenote:* JS uses `else if` where ruby uses `elsif`

The usual suspects:

- `>`
- `<`
- `>=`
- `<=`
- `!=`
- `==`
- `||`
- `&&`


A few new additions:

- `===`
- `!==`


#### === ???

Yes, JS has a triple `=` equality operator. So, what's the difference? 

Taking into account what you just learned about `type`...<br>
The double equals `==` tries to ignore the `type` when comparing. While the triple equals `===` evaluates `type` along with any other comparisions being made. <br>
These are called loose and strict equality checks. To avoid trouble, get in the habit of using the `strict equality` operator 

```javascript
var x = 10;
//Type coersion!
if(x == '10') {
    console.log(true); //true
}

if(x === '10') {
    console.log(true); //false
}
```


#### Truthy and Falsey Values

Like Ruby, only a handful of values evaluate to false (falsey) (by default)

Those valeus are: `false`, `0`, `null` and `undefined`

```javascript
var whatever;
if(false || 0 || null || whatever) {
    console.log(true)
} else {
    console.log(false);
}
```

Pretty much any other value (or object) in JS is `true` (or truthy)

```javascript
if('abc') {
    //true
}

if(10 && 'abc' && true) {
    //true
}
```

oh! good news! the JS ternary operator in almost exactly like the Ruby ternary operator. yay!

```ruby 
favorite = "ruby"

favorite == "ruby" ? puts("ruby is still my favorite language") : puts("I need to re-evaluate my life choices")
```

```javascript
var favorite = "ruby";

favorite === "ruby" ? console.log("ruby is still my favorite language") : console.log("I need to re-evaluate my life choices");
```

**Dig Deeper**

- [YDKJS - Blocks and Conditionals](https://github.com/getify/You-Dont-Know-JS/blob/master/up%20&%20going/ch1.md#blocks)

- - - - 

## Iteration

There are 2 main types of iteration in JS, the `while` loop and the `for` loop. 

#### The while loop

Interestingly enough, the `while` loop is very similar to Ruby's implementation. 

Ruby **while** loop	

```ruby
x = 0

while x < 10 do 
	puts "#{x}"	
	x += 1
end

```

JS **while** loop

```javascript
var x = 0;

while(x < 10) {
	console.log(x);    
	x += 1;
}
```

#### The for loop

In Ruby, (as you know) there are several handy methods that perform iterations for us. In JavaScript those methods don't exist. However, like many other programming languages. JS offers the ever-veristale and super-handy `for` loop. 

Let's take a look at the same loop above constructed with `for`

```javascript

for (var i = 0; i <= 9; i ++) {
    console.log( i );
}
```

Let's work through each part of the loop. 

within the parentheses, there are 3 key things happening: 

1. We are **setting** a variable's value (in this case, to 0)
2. We are **comparing** the variable's value to the desired break-point
3. we are **incrementing** tha value of the variable on each iteration


**Challenge 2** - 99 Bottles

- Using a `for` loop.
- Write a simple version of "99 bottles of beer on the wall"<br>
(note: make sure you're logging the result to the console)
- Once you get the program running, log "Hey! We need more beer!" to the console when your counter hit's 0



**Challenge 2 Answer**

```javascript
var bottle = 99;

for (bottle; bottle >= 0; bottle --){

  if (bottle === 0) {
    console.log("Hey! Go buy more beer!");
  } else {
      console.log(bottle + " bottles of beer on the wall");
  }
}
```

The `for` loop works with also works with arrays (which we'll get into shortly)

