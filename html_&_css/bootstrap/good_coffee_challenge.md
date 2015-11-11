#Bootstrap 

Okay, so last class we worked with vanilla CSS, and you saw that positioning and styling your elements can become difficult and tedious very quickly. 

Thankfully, other developers have experienced the same pains, and decided to craft solutions that address the issues we've been facing. Those solutions come in the form of front-end frameworks like [Bootstrap](http://getbootstrap.com/) and [Zurb Foundations](http://foundation.zurb.com/)

- - - -

## Today's Objective

- Get familiar with bootstrap
	- How to install it in your project
	- The grid system
	- bootstrap compenents and classes
	- the docs
- Build a website quick and easy

- - - -
## Let's get started

As I've said before, the best way to learn is to build. So let's get started. 

Imagine that you've been approached by a local coffee shop to build their website. Together you've come up with a nice design and the shop has supplied you with all the necessary information(ie: copy, images and color scheme).

_Here is what you're aiming for:_
![good coffee mockup](../images/good_coffee_initial_layout.png)

Oh, btw... the deadline is today. No time like the present to knock this out right?

**Challenge 1:** - Create the html page

Let's start with what we know. 

1. Create your html document
	2. At the top of the `<body>` wrap an `<h1>` in a `<div>` and insert the content 'Good Coffee Co.'
	3. Create another `<div>` and with `class` titled: 'mission'
		5. Create an `<h3>` and insert: 
		
			> 'Here at Good Coffee Co we are passionate about serving the best coffee you'll ever taste. Our staff are self-described coffee-nerds with impeccable technique. Stop by today and experience the Good Coffee difference.
	6. Create a new `<div>` with a `class` named: 'features'
		7. Create 3 separate paragraphs 
		8. Inside those paragraphs place the following text:
			
			>The freshest locally sourced coffee. Organic and Fair Trade certified. 
			
			>A perfect environment to meet with a friend or be alone and get work done. 
			
			>Quality hand-crafted espresso shots pulled with the greatest of care.
			
*Your page should look like this:*
![gc1](../images/good_coffee_1.png) 

**Challenge 1 Answer:**

```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Good Coffee</title>
  </head>
  <body>

    <div >
      <h1> Good Coffee Co.</h1>
    </div>

    <div class="mission">
      <h3> Here at Good Coffee Co we are passionate about serving the best coffee you'll ever taste. 
      <br> Our staff are self-described coffee-nerds with impeccable technique.
      <br> Stop by today and experience the Good Coffee difference. 
      </h3>
    </div>


    <div class="features">
      <p> The freshest locally sourced coffee. Organic and Fair Trade certified</p>

      <p> A perfect environment to meet with a friend or be alone and get work done.</p>

      <p> Quality hand-crafted espresso shots pulled with the greatest of care.</p>
    </div>

  </body>
</html>

```

