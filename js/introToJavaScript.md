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

- test and log output from your program
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
- [YDKJS - More Advanced Conditionals](https://github.com/getify/You-Dont-Know-JS/blob/master/up%20&%20going/ch2.md#conditionals)

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
- - - -


## Arrays

As you dig deeper in programming you'll discover that arrays are everywhere. 

Thankfully, arrays in JS are very similar to arrays in ruby.

You declare an array like so:

```javascript
var students = ['paul', 'emily', 'dylan'];
```

Accessing array items 

```javascript
var x = students[0]; // "paul"
var y = students[1]; // "emily"
```

updating array items 

```javascript
students[0] = "Paul"; 
students[0]; // "Paul"
```

Editing Arrays

```javascript
//Add item to an array

var teachers = ['Shane', 'Lee'];
teachers[2] = 'Zack'; // ['Shane', 'Lee', 'Zack'];
teachers[4] = 'Cam Newton'; // ['Shane', 'Lee', 'Zack', undefined, 'Cam Newton'];


//Push, pop, shift and unshift - like a pez dispenser (and just like ruby)

var teachers = ['Shane', 'Lee'];
teachers.push('Zack'); //['Shane', 'Lee', 'Zack']

var teacher1 = teachers.pop(); //teacher1 == 'Zack', teachers == ['Shane', 'Lee']
teachers.unshift('Zack'); // ['Zack', Shane', 'Lee']

var teacher2 = teachers.shift(); //teacher2 == 'Zack', teachers = ['Shane', Lee']

//Slicing and splicing
var a = [1,2,3,4];
a.slice(0,2); //[1,2]
a.splice(1,0,'a','b'); //dumbest API ever
```

There are *lots* of other array operations. Check out the dig deeper section for more examples. 

#### Array Iteration

As hinted at earlier, you can use a `for` loop to iterate over an array:

```javascript
var teachers = ['Shane', 'Lee', 'Zack']
for(var i = 0; i < teachers.length; i++) {
    console.log(teachers[i]);
}
```
*note: also, make sure to checkout the forEach loop*

**Dig Deeper**

[YDKJS - Arrays](https://github.com/getify/You-Dont-Know-JS/blob/master/up%20&%20going/ch2.md#arrays)

- - - -

## Objects

While JavaScript is not Object Oriented (in theory), you can still create objects. and interestingly enough they operate almost identical to a Ruby `hash`. 

```javascript
var cohort = {
    name: 'Code Immersion',
    awesome: true,
    teacher: "Shane"
}
```

#### Addressing Objects

Object properties can be referenced in two ways. The more common *dot* notation, or *bracket* notation, which is useful if you have a property name saved in a string.

```javascript
cohort.name
// or
cohort['name']
```

A more complex example of an object 

```javascript
var cohort = {
    name: 'Code Immersion',
    awesome: true,
    teachers: ['Shane', 'Zack'],
    students: [
        {
            name: 'Renee',
            computer: {
                OS: 'Linux',
                type: 'laptop'
         		}
        },
        {
            //...
        }
    ]
};

cohort.students[0].computer.OS; // 'Linux'
```


#### Mutation

Properties of objects can also mutated after an object has been created

```javascript
cohort.name = "Code Immersion with Ruby"
```

You can also assign entirely new keys, delete existing ones.

```javascript
cohort.fun = true; //add a property
delete cohort.name; //remove one
```

**Dig Deeper**

[YDKJS - Objects](https://github.com/getify/You-Dont-Know-JS/blob/master/up%20&%20going/ch2.md#objects)

- - - - 

## Functions

Functions in JS === Methods in Ruby

However, Functions are first-class citizens (as JS is a *functional* language)

**Ruby Method:**

```ruby
def addem(x, y)
	x + y
end
```

**JS Function:**

```javascript
function addem(x,y){
	return x + y;
}
```

Basically, functions are defined by using the `function` keyword. The block (to be executed when the function is called) is wrapped in curly braces. 

#### Functions are OBJECTS

Functions are first class Objects in JavaScript. This means they can be instantiated, assigned, reassigned, and passed around just like any other variable.

```javascript
var greet = function(name){
 console.log("hi " + name);
}
```

The passing of a function into another function as parameter is a critical pattern in JS.

```javascript
var sayHi = function() {
    console.log('Hiiiiiiiii!!!!!')
}

setTimeout(sayHi, 2000); // calls the greet function after 2 seconds
```

This pattern is HEAVILY used in JS to handle asynchronous events. For example, in a web application, you might create a function and tell JS to run it when a button is clicked.


**Challenge 3:** Tip Calculator

Remember that tip calculator you created in Ruby? Let's create one on JS!

- Create a tip calculator factors in a 20% gratuity
- Use a popup to capture the user's bill amount (pre-tip)
- Convert that input to a number 
- Log the total with tip to the screen.


**Challenge 3 Answer:**

```javascript
function grat(){
  return Number(amount) * 0.2;
 }

 function totalWithTip(){
  return Number(amount) + grat();
 }

 var amount = prompt("Hi! what was the total of your bill?");
 console.log("Your total amount is: " + totalWithTip());
```

Now, let's add a `$` amount to the result 

```javascript
function grat(){
  return Number(amount) * 0.2;
 }

 function totalWithTip(){
  return Number(amount) + grat();
 }

function formatAmount() {
    return "$" + totalWithTip().toFixed( 2 );
}

 var amount = prompt("Hi! what was the total of your bill?");
 console.log("Your total amount is: " + formatAmount());
```

All, we're doing is simply adding a `formatAmount` function and calling it in our `console.log` statement. 


#### This

Think of a function as a piece of paper with instructions, a procedure of sorts. One of those instructions might say "touch your nose". But who is this "you" it speaks of? Obviously, the person executing the instructions. Similarly, the keyword 'this' refers to the object that's executing the function

```javascript
var teacher = {
    name: 'Shane',
    sayName: function() {
        console.log(this.name);
    }
}
teacher.sayName(); // "Shane"
```
Different objects can execute the same function and produce different results because *this* is different.

```javascript
var teacher2 = {
    name: 'Zack',
    sayName: teacher.sayName
}
teacher2.sayName(); // "Zack
```

- - - -

## Scope

Scope is the set of variables a piece of code has access to. Functions create scope, and nothing else does. This has many, many implications and is a critical concept in JavaScript:

Parameters and variables declared inside a function are LOCAL to that function's scope

```javascript
function getGreeting(name) {
    var greeting = "hello ";
    return greeting + name;
}
getGreeting('Shane'); // 'Hello Shane'
console.log(greeting) //undefined
```

Blocks DO NOT have their own scope

```javascript
for(var i = 0; i < 10; i++) {
    var x = i;
}

console.log(i,x); //9,9
```

Scope lets you create private variables in a JS program, but be careful, variables defined without the 'var' keyword are global.

```javascript
function greet(name) {
    greeting = "hello ";
    return greeting + name
}
greet('Shane');
greeting //'hello'!
```

- - - -

## JS in the browser

- - - -

## The DOM
