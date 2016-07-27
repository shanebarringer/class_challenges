#CSS Challenge - Create a Nice Looking SignUp Form
- - - -

**Challenge 1 Answer:** 

```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>
    
  </body>
</html>
```

**Challenge 2 Answer:** 

```html
<link rel="stylesheet" href="css/main.css" media="screen" title="no title" charset="utf-8">
```
- - - -

## Structure

**Challenge 3 Answer:**

```html
<body>
  <div id="login-box">
    <div class="left">
      <h1>Create Account</h1>
      
   </div>
  </div>
</body>
```
- - - -

### The Form
- - - -

**Challenge 4 Answer:** 

```html
 <div class="left">
  	<h1>Create Account</h1>
  	
  	<form class="sign-up" action="index.html" method="post">
	  
	  <input type="text" name="username" placeholder="Username" />
	  <input type="text" name="email" placeholder="E-mail" />
	  <input type="password" name="password" placeholder="Password" />
	  <input type="password" name="password2" placeholder="Retype password" />
	
	  <button class="sign-up-button" type="submit"/> Sign Me Up </button>
	
	</form>
	
</div>
```

- - - - 

### The other buttons
- - - -

**Challenge 5 Answer:**

```html
<div class="right">

  <span class="loginwith">Sign in with <br> social network</span>

  <button class="social-signin facebook">Log in with facebook</button>
  <button class="social-signin twitter">Log in with Twitter</button>
  <button class="social-signin google">Log in with Google+</button>

</div>
```     	 
*Adding in OR*:

```html
<div class="or">OR</div>
```
- - - -
## HTML

Here's what your code should look like as of challenge 5:

```html
<!DOCTYPE html>
<html>

<head>

  <meta charset="utf-8">
  <link rel="stylesheet" href="css/main.css" media="screen" title="no title" charset="utf-8">

  <title>Sign Up!</title>

</head>

<body>

  <div id="login-box">
    <div class="left">
      <h1>Create Account</h1>

      <form class="sign-up" action="index.html" method="post">
        <input type="text" name="username" placeholder="Username" />
        <input type="text" name="email" placeholder="E-mail" />
        <input type="password" name="password" placeholder="Password" />
        <input type="password" name="password2" placeholder="Retype password" />

        <button class="sign-up-button" type="submit" />Sign Me Up</button>
      </form>
    </div>

    <div class="right">
      <span class="loginwith">Sign in with
        <br />social network</span>

      <button class="social-signin facebook">Log in with facebook</button>
      <button class="social-signin twitter">Log in with Twitter</button>
      <button class="social-signin google">Log in with Google+</button>
    </div>

    <div class="or">OR</div>

  </div>

</body>

</html>
```
- - - - 

# On to Style...
- - - - 


### Normalize A.K.A. - Browser Reset
- - - - 

**Challenge 6 Answer:**

```html
<link rel="stylesheet" href="css/normalize.css" media="screen" title="no title" charset="utf-8">
```

(In the `<head>` make sure to link this above your `main.css` file. Otherwise it will overwrite all of your custom styles)

- - - - 

## Setting up the Body

Start by using the `*` selector to apply `border-box` to the all of the elements.

```css
* {
  box-sizing: border-box;
}
```

**Challenge 7 Answer:**

```css
body {
  background: #DDD;
  color: #222;
  font-family: 'Noto Sans', sans-serif;
  font-weight: 300;
}
```

- - - -

### Positioning   

**Challenge 8 (part 1) Answer:**

```css
#login-box {
  position: relative;
  margin: 5% auto;
}
```

**Challenge 8 (part 2) Answer:**

```css
#login-box {
  position: relative;
  margin: 5% auto;
  width: 600px;
  height: 400px;
  background: #FFF;
  border-radius: 2px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.4);
}
```

## Position the div's

**Challenge 9 Answer:**

```css
.left {
  padding: 40px;
  width: 300px;
  height: 400px;
  position: absolute;
  top: 0;
  left: 0;
}
```

**Challenge 10 Answer:**

```css
.left,
.right {
  padding: 40px;
  width: 300px;
  height: 400px;
  position: absolute;
  top: 0
}

.left {
  left: 0;
}

.right {
  right: 0;
```	


Let's go ahead and throw in our background picture while we're here.<br> In your `.right` declaration (under the `right: 0;` declaration) paste the following code:

```css
.right {
  right: 0;
  background: url('https://goo.gl/YbktSj');
  background-size: cover;
  background-position: center;
  border-radius: 0 2px 2px 0;
}
```

- - - -

## Style the .left

Let's go ahead and knock out the styling on our left `<div>`

We'll start with the `<h1>`

**Type** the following code in your stylesheet:

```css
h1 {
  margin: 0 0 20px 0;
  font-weight: 300;
  font-size: 2em;
}
```

**Challenge 11 Answer:**

```css
.sign-up input {
  border: none;
  border-bottom: 1px solid #AAA;
  display: block;
  margin-bottom: 20px;
  padding: 4px;
  width: 220px;
  height: 32px;
  font-weight: 400;
}
```


**Challenge 12 Answer:**

```css
.sign-up-button {
  margin: 5px auto;
  width: 220px;
  height: 32px;
  border: none;
  border-radius: 2px;
  background: #16a085;
  color: #FFF;
  font-weight: 400;
  text-transform: uppercase;
}
```
**Challenge 13 Answer:**

```css
.sign-up-button:hover {
  opacity: 0.8;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.4);
  transition: 0.1s ease;
}

.sign-up-button:active {
  opacity: 1;
  box-shadow: 0 1px 2px rgba(0, 0, 0, 0.4);
}
```  


**Challenge 14 Answer:**

```css
border-bottom: 2px solid #16a085;
color: #16a085;
transition: 0.2s ease;
``` 

Once complete, you'll want to modify `focus` on the entire document. <br>

Place the following code near the top of your stylesheet

```css
*:focus {
  outline: none;
}
```

At the end of your styling you should have the following code for your left `<div>`

```css
h1 {
  margin: 0 0 20px 0;
  font-weight: 300;
  font-size: 2em;
}

.sign-up input {
  border: none;
  border-bottom: 1px solid #AAA;
  display: block;
  margin-bottom: 20px;
  padding: 4px;
  width: 220px;
  height: 32px;
  font-weight: 400;
  /*transition: 0.2s ease*/
}

.sign-up input:focus
 {
  border-bottom: 2px solid #16a085;
  color: #16a085;
  transition: 0.2s ease;
}

.sign-up-button {
  margin: 5px auto;
  width: 220px;
  height: 32px;
  border: none;
  border-radius: 2px;
  background: #16a085;
  color: #FFF;
  font-weight: 400;
  text-transform: uppercase;
}

.sign-up-button:hover {
  opacity: 0.8;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.4);
  transition: 0.1s ease;
}

.sign-up-button:active {
  opacity: 1;
  box-shadow: 0 1px 2px rgba(0, 0, 0, 0.4);
}
```

- - - - 

## Style the .right

**Challenge 15 Answer:**

```css
.loginwith {
  display: block;
  margin-bottom: 40px;
  font-size: 2em;
  color: #FFF;
  text-align: center;
}
```

**Challenge 16 Answer:**

```css
button.social-signin {
  margin-bottom: 20px;
  width: 220px;
  height: 36px;
  border: none;
  border-radius: 2px;
  color: #FFF;
}
```

You may notice some code duplication. Let's go ahead and refactor

**Challenge 17 Answer:**
When it's all said and done, you should have something similar to this:

```css
/**********************************************
  start of button styling
/**********************************************/

button {
  margin-bottom: 20px;
  width: 220px;
  height: 36px;
  border: none;
  border-radius: 2px;
  color: #FFF;
  font-weight: 400;
}

button:hover {
  opacity: 0.8;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.4);
  transition: 0.1s ease;
}

button:active {
  opacity: 1;
  box-shadow: 0 1px 2px rgba(0, 0, 0, 0.4);
}

.sign-up-button {
  margin: 5px auto;
  background: #16a085;
  text-transform: uppercase;
}

/**********************************************
  end of button styling
/**********************************************/

```

**Challenge 18 Answer:**

```css
.facebook {
  background: #32508E;
}

.twitter {
  background: #55ACEE;
}

.google {
  background: #DD4B39;
}
```
- - - - 

## OR

**Challenge 19 Answer:**

```css
.or {
  position: absolute;
  top: 180px;
  left: 280px;
  width: 40px;
  height: 40px;
}
```

**Challenge 20 Answer:**

```css
.or {
  position: absolute;
  top: 180px;
  left: 280px;
  width: 40px;
  height: 40px;
  background: #DDD;
  border-radius: 50%;
  text-align: center;
  line-height: 40px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.4);
}
```


- - - - 

**All CSS:**

```css
* {
  box-sizing: border-box;
}
@import url(https://fonts.googleapis.com/css?family=Noto+Sans|Comfortaa:400,300,700);
*:focus {
  outline: none;
}
body {
  background: #DDD;
  color: #222;
  font-family: 'Noto Sans', sans-serif;
  font-weight: 300;
}
#login-box {
  position: relative;
  margin: 5% auto;
  width: 600px;
  height: 400px;
  background: #FFF;
  border-radius: 2px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.4);
}

/**********************************************
  Left and Right div Positioning
/**********************************************/

.left, .right {
  padding: 40px;
  width: 300px;
  height: 400px;
  position: absolute;
  top: 0
}
.left {
  left: 0;
}
.right {
  right: 0;
  background: url('https://goo.gl/YbktSj');
  background-size: cover;
  background-position: center;
  border-radius: 0 2px 2px 0;
}

/**********************************************
  END div positioning
/**********************************************/


/**********************************************
  Left div styling
/**********************************************/

h1 {
  margin: 0 0 20px 0;
  font-weight: 300;
  font-size: 2em;
}
.sign-up input {
  border: none;
  border-bottom: 1px solid #AAA;
  display: block;
  margin-bottom: 20px;
  padding: 4px;
  width: 220px;
  height: 32px;
  font-weight: 400;
  /*transition: 0.2s ease*/
}
.sign-up input:focus {
  border: none;
  border-bottom: 2px solid #16a085;
  color: #16a085;
  transition: 0.2s ease;
}

/**********************************************
  end of left div styling
/**********************************************/


/**********************************************
  start of button styling
/**********************************************/

button {
  margin-bottom: 20px;
  width: 220px;
  height: 36px;
  border: none;
  border-radius: 2px;
  color: #FFF;
  font-weight: 400;
}
button:hover {
  opacity: 0.8;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.4);
  transition: 0.1s ease;
}
button:active {
  opacity: 1;
  box-shadow: 0 1px 2px rgba(0, 0, 0, 0.4);
}
.sign-up-button {
  margin: 5px auto;
  background: #16a085;
  text-transform: uppercase;
}
.facebook {
  background: #32508E;
}
.twitter {
  background: #55ACEE;
}
.google {
  background: #DD4B39;
}

/**********************************************
  end of button styling
/**********************************************/

.loginwith {
  display: block;
  margin-bottom: 40px;
  font-size: 2em;
  color: #FFF;
  text-align: center;
}
.or {
  position: absolute;
  top: 180px;
  left: 280px;
  width: 40px;
  height: 40px;
  background: #DDD;
  border-radius: 50%;
  text-align: center;
  line-height: 40px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.4);
}
```
