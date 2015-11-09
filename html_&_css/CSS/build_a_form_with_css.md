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
## Structure

When building any type of document with HTML/CSS. You always want craft the structure first and style afterwards. 

We'll start by building out the body of our document and creating the form.

**Challenge 3**

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



### The Form
- - - -

**Challenge 4** Create a signup Form


```html
<form class="sign-up" action="index.html" method="post">

   <input type="text" name="username" placeholder="Username" />
   <input type="text" name="email" placeholder="E-mail" />
   <input type="password" name="password" placeholder="Password" />
   <input type="password" name="password2" placeholder="Retype password" />
   
</form>

<button class="sign-up-button" type="submit" form="sign-up" value="submit" /> Sign Me Up
```


### Normalize A.K.A. - Browser Reset
