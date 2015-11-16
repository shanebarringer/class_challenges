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

```

There are up to 7 types that can be returned by the typeof operator. You can find the rest in [Kyle Simpson's writeup on Values and Types](https://github.com/getify/You-Dont-Know-JS/blob/master/up%20&%20going/ch2.md#values--types). Go read that before continuing this lesson. 

- - - -

