# Rails Walkthrough 


## Create the App

Now that you've familiarized yourself with MVC, let's build our first app!

**Challenge 1:** Create the application

- Go to [the Rails Guide](http://guides.rubyonrails.org/getting_started.html#creating-the-blog-application) (your new best friend) and figure out how to create a new application
- name the application pizza_shop
- once complete `cd` into the app and (btw, you may need to re-run `bundle install`)
- fire up your server (use rails guides if you're unclear on starting the rails server) and make sure you're seeing this:

![](./images/rails_intro.png)

- commit that up to github with the a message of "uploads initial files"

<br>

**Challenge 1 Answer:**

```shell 
$ rails new pizza_shop
$ cd pizza_shop
$ bundle install
$ rails server

$ git init
$ git add .
$ git commit -m "uploads initial files"

```


- - - -

## Walk through the file structure

Let's detour for a moment and take a walk through your the file-tree.

### The App Directory

The `app` directory is where you’ll spend most of your time.


#####`assets`

- The `assets` directory contains your “front-end” development files:
	- images 
	- Javascript
	- stylesheets

The files within this directory use the Rails asset pipeline... which is a topic for another time....


#####`controllers`

- The controllers directory contains all of the controllers for our application.
- Application controller - is given by default.
	- this contains the core controller of the application.<br> 

*note: notice it is structured as a class. Usually, all of our other controllers are going INHERIT from the application controller.*

- Methods in the controller are also known as `actions`.
- The `ActionController` is the core of web requests and determines whether to `render` or `redirect`.
- `actions` by default render a template in the `app/views` directory corresponding to the name of the action 


#####`helpers`

contains view `helpers` for the application.

- As we generate different parts of our application  
	- assets
	- dates
	- forms
	- numbers 
	- model objects
	- etc. 
	 
- each particular piece of code that we generate will get its own helper. ( `_helper.rb` )
- used to generate code for our `views`.
- Rails encourages “creating custom helpers to extract complicated logic or reusable functionality.”


#####`mailers` 

Allows you to create mailer methods and views that correspond with your application. 


#####`models` 

contain all our different models and defines the table structure of our data

#####`views` 

contains the layout for our applicaiton

#####`bin` 

contains our application executables (or “command line executables”), as well as different programmatic functions that we'll use with Rails.

- Can be directly read by your computer, but not by humans. 
- The files we write need to be compiled in order to be read by computers.
- Ex: 
	- bundle 
	- rake 
	- rails 
	- gem

#####`config` 

contains different configurations for our application.

- `environments`: 
	- development (us!) 
	- production - for the user 
	- testing - for use with RSpec or MiniTest
- `routes`:
	- directs the requests in our application
	- also determines what to do with API requests
- `database.yml` 
	- contains our database configuration for each environment.<br>*Notice: sqlite3 (versus SQL, postresql…)*

#####`db`

- seeds - Use this file to create default data (ie: special admin user)
- database migrations - Ruby scripts that modify the tables in your database
- schema - shows the current state of your app’s database


#####`lib`

- Contains any reusable library code you might write
	- ie: any code that is not domain specific, that you may want to use for another project.

#####`log`

contains the server logs for our application 


#####`public` 

- contains some basic static pages
- favicon.ico - the little icon on your browser tab
- robots.txt - controls how search engines index your app

#####`test`

contains all of the specs for your test suite

#####`tmp`

stores temporary files

#####`vendor` 

- holds assets needed by 3rd party gems that you add to your app
- similar to the lib directory (but this is for using other people’s code)

##### `.gitignore`

files that will not be tracked with git

##### `gemfile`

where all the fun gems are stored

- - - -

## Generate the Resource

That pretty much completes our leisurly walk through the file-tree. Now let's get back to building.

We'll start with building a scaffold. Scaffolds are generated to help you easily and effeciently scale a `CRUD` based `model` `view` and `controller`. They are designed for ease of use and are an excellent way to learn how to build out your application. 

Unfortunately, you won't get to use scaffolding all the time (in the real world) so don't get too comfortable with it. 


**Challenge 2** - Scaffold your first resource

In your terminal...

- Use the [Rails Guides](http://guides.rubyonrails.org/generators.html#customizing-your-workflow) to figure out how to scaffold a Pizza resource with the following items:
	- name (string) 
	- crust (string) 
	- sauce (string)
	- toppings (text) 
	- cost (integer)
	- image (string)

*note: You'll need to kill your server OR open another terminal window to complete this part of the challenge*



**Challenge 2 Answer:**

```shell
$ rails g scaffold Pizza name:string crust:string sauce:string toppings:text cost:integer image:string
```


## Create the Resource

Go ahead and fire up your server again (if it's not running already) and refresh. 

Ouch! you'll probably see an error

Let's take a moment and examine the error:

**Challenge 3:**

- User the error message OR [another part of the Rails Guide](http://guides.rubyonrails.org/command_line.html#rails-generate) to fix this error and actually **create** the Pizza resource. 

*After running the command, refresh your page to see if the error is gone*


**Challenge 3 Answer:**

`$ rake db:migrate`


So, what did we do here?

in your terminal run `rake -T` and you'll see a list of rake tasks. Rake files are series of taks that are written in plain ruby that will execute a series of commands. Basically, they are fancy scripts. 

We need to run the migration rake task so that our tables are actually created in the database. 

- - - -

## Add some Pizza

Head on over to `http://localhost:3000/pizzas` and you'll should see a button allowing you to create a new pizza. 

Let's go ahead and add in 3 pizzas. I've got some basic types that you can just copy and paste for now. (feel free to input your own price, toppings, etc.)

[Hawiian](https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQnQb1TVr1bjWQ5eOx8MuUT9XPUMJl-iI9utGik9ZAYfO-ai_uLuQ)

[Meat Lovers](http://eatnowcrylater.com/wp-content/uploads/2014/02/IMG_9484.jpg)

[Veggie Delight](https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSFA58EIE5D6R59-EIBf608ufuVC58d4dVvVGekUTrlVny4Iqdv)
    

- - - - 

## HomePage

Now, we need a good homepage (for when people land on our site).

**Challenge 4:**

- We're going to use a derivation of the bootstrap gem called starter_generators. 
	- Navigate to your `gemfile`
	- look at the layout
	- add the `"starter_generators"` gem
	- in the terminal run `bundle install` to sync your app with the new starter_generators gem.
	- once successful run `rails g starter:style united` - this will install the bootstrap theme that we'll be using. 

- Navigate to your Pizza views directory and create a `home.html.erb` file
- To save yourself some time, just copy and paste the code below into your the `home.html.erb` file. 

```html
<div class="jumbotron">

	<center>
		<h1>Welcome to Zack's Zas</h1>

		<img src="http://ecx.images-amazon.com/images/I/41phkELgWyL._SX342_.jpg">
		<br>

		<%= link_to "Check out our Pizzas!", pizzas_path, class: "btn btn-default" %>
	</center>
</div>
```

- Navigate to your Pizza `controller` and add a `home` action

<br>

Once complete, navigate to `http://localhost:3000` in your browser...

*Yeah... you'll notice an error. we need to create a route directing us home. (we'll do that in the next challenge)*


**Challenge 4 Answer:**

```ruby
def home

end
```

#### Create the Route

We want the user to land on this page, when they first come to our site. To do this, complete the following challenge.

**Challenge 5**

- Head on over to [Railsbridge](http://docs.railsbridge.org/intro-to-rails/setting_the_default_page)
- set the root route to point to the `home` action in the `pizza` controller.


*Note: Anytime you make a change to your routes file, you'll need to restart your server. Otherwise the changes won't take effect.*

Refresh and you should see some magic.


**Challenge 5 Answer:**

```ruby
root "pizzas#home"
```

- - - - 

## Finishing touches

Now, let's update the index and show pages, because these tables aren't going to work. 

**Challenge 6**

1. Navigate to your pizza `index` view and delete all the existing html.
2. add a header that says "All of Zack's Zas
3. create a `div` with the `class` of row
4. inside that `div`, 
	5. iterate over each pizza <br> *hint: the pizzas are stored in the `@pizzas` instance variable*
	6. You'll want to use erb syntax for this part of the challenge. which looks like: `<% your iteration goes here: %>`
	7. You'll need to end your loop with `<% end %>`
8. Inside your loop, paste the following code:
	
	```html
	<div class="col-sm-6 col-md-4">
    <div class="thumbnail">
      <img src="<%= pizza.image %>">
      <div class="caption">
        <h3><%= pizza.name %></h3>
        <h3>Cost: $<%= pizza.cost %></h3>
        <%= link_to "More Info", pizza, class: "btn btn-default" %>
      </div>
    </div>
  </div>
	``` 
9. close out the `row div`
10. add a line break and paste in the following code:
	
	```html
	<%= link_to 'New Pizza', new_pizza_path, class: "btn btn-primary" %>
	```

Save and refresh!


**Challenge 6 Answer:**

```html
<h1>All of Zack's Zas</h1>
<div class="row">
<% @pizzas.each do |pizza| %>
  <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
      <img src="<%= pizza.image %>">
      <div class="caption">
        <h3><%= pizza.name %></h3>
        <h3>Cost: $<%= pizza.cost %></h3>
        <%= link_to "More Info", pizza, class: "btn btn-default" %>
      </div>
    </div>
  </div>
  <% end %>
</div>

<br>

<%= link_to 'New Pizza', new_pizza_path, class: "btn btn-primary" %>
```


Last but not least, lets customze the individual pizza show pages. 

**Challenge 7**

1. Take a couple of minutes and review the html, and then erase all of the content
2. create a `jumbotron div` *(all code on this page will be nested in the jumbotron)*
3. create a `<center>` html tag and nest the following 2 items inside. 
	4. a header referring to the individual pizza name <br> *hint: for all of the pizza related items you'll need to use the `<%= %>` erb syntax*
	5. paste the following `<img src="<%= @pizza.image %>">`
6. Create 4 individual `<h3>` elements and add the following: 	7. Crust
	8. Sauce
	9. Toppings
	10. Cost <br>
	*hint: I'll get you stated, it should look something like this:* `<h3>Crust: <%= INSERT YOUR CODE HERE %></h3>`


Save and refresh!

**Challenge 7 Answer:**

```html
<div class="jumbotron">
  <center>
    <h1><%= @pizza.name %></h1>
    <img src="<%= @pizza.image %>">
  </center>
  <h3>Crust: <%= @pizza.crust %></h3>
  <h3>Sauce: <%= @pizza.sauce %></h3>
  <h3>Toppings: <%= @pizza.toppings %></h3>
  <h3>Cost: $<%= @pizza.cost %></h3>
</div>
```
- - - -


That's it! You've just written your first rails app. Now, go enjoy some Pizza!
