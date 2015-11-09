CSS Challenge - Create a Nice Looking SignUp Form

**Challenge 1** - Create the HTML Document

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

**Challenge 2** - Link to your stylesheet

```html
<link rel="stylesheet" href="css/main.css" media="screen" title="no title" charset="utf-8">
```
- - - -

## Structure

When building any type of document with HTML/CSS. You always want craft the structure first and style afterwards. 

We'll start by building out the body of our document and creating the form.

**Challenge 3** - Set the Body up

- Inside the `<body>` create a container `<div>` with the id of login-box
- Within that container create another `<div>` with a class of left
- Inside of that div create a top-level header that says 'Create Account' 

<br>


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

**Challenge 4** - Create a sign-up Form

1. Create a `<form>` element which contains:
	2. A class attribute titled 'sign-up' 
	3. An action pointing to 'index.html' <br> The *action* attibute defines the location (an URL) where the form's collected data should be sent.
	4. A method attribute of 'post'<br> The *method* attribute defines which HTTP method to send the data with (it can be "get" or "post").
2. Nest 4 `<input>` elements within the form
	2. A username input
	3. An Email input
	4. two password inputs (one for the actual password, and one to confirm)
3. Nest a button with:
	4. A class of 'sign-up-button'
	5. A type of 'submit'
4. Close out your left div  	 	

<br>


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

**Challenge 5** - Buttons

1. Create a `<div>` with a class attribute of 'right'
2. Nest a `<span>` with the class attribute of 'loginwith'
	1. Inside the span put the text 'Sign in with Social Network'
3. Create 3 `<button>`'s with:
	1. Class attributes of "social-signin"
4. Select the top `<button>`and
	1. Give it a class attribute of 'facebook'
	2. Include the text 'Log in with facebook'
5. Do the same thing for Twitter and Google+
6. close out the 'right' `<div>`

<br>

```html
<div class="right">
  <span class="loginwith">Sign in with
    <br />social network</span>

  <button class="social-signin facebook">Log in with facebook</button>
  <button class="social-signin twitter">Log in with Twitter</button>
  <button class="social-signin google">Log in with Google+</button>
</div>
```     	 
- - - - 
### Or
- - - -

Create a `<div>` with the clas attribute of "or" and the text 'OR'

```html
<div class="or">OR</div>
```
- - - -
## HTML

Whew! You've complete the structure of the html document. Now all that's left is to add some style

Here's what your code should look like so far:

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

Okay, so first things first. We *need* to get rid of this awful default browser styling

**Challenge 6** - Let's [Normalize!](https://necolas.github.io/normalize.css/) 

1. Go to the site above and download the file
	2. Create a new stylesheet and paste in the contents of normalize.css
	3. link the stylesheet to your index.html page

<br>

```html
<link rel="stylesheet" href="css/normalize.css" media="screen" title="no title" charset="utf-8">
```

(In the `<head>` make sure to link this above your main.css file. Otherwise it will overwrite all of your custom styles)

- - - - 



 
