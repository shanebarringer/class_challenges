## Objective
So, you've probably found yourself asking these types of questions: 

- What exactly is SQL? 
- How do Databases work? 
- What are Rails Models doing behind the scene?
- What in the world is going on with my terminal's output???

Today's objective is to answer those questions and help you get a grip on how your Rails Models work with your database. 

- - - -

## Relational vs Non-Relational

A relational database is a series of **Tables** with **Columns** and **Rows**... Yes... Kind of like Excel or CSV. 
<br>

Let's take a look at a Relational-Databasey version of a Todo App:
<center>

|Name  | Priority  |
|:-:|:-:|
| Pay Electric Bill  |  1  |
| Pick up Vegan Cheese | 3   |
| Send out Party Invitations  | 2  |

</center>

In this situation, the **Tasks** table contains 2 columns:  Name and Priority. <br>
In OOP terms, these columns would be considered the attributes of an object. And **each individual row** would be considered an object of the Todo class. 

So, when you create a new object by running the command `Todo.new("call sister", 2) ` 
You'll create the following in the database:

<center>

|Name  | Priority  |
|:-:|:-:|
| Pay Electric Bill  |  1  |
| Pick up Vegan Cheese | 3   |
| Send out Party Invitations  | 2  |
| call sister  |  2  |

</center>

Now a Non-Relational version:

```json
{
	"task":
	{
		"task" 	   : "Pay Electric Bill",
		"priority" : "1"
	}
}
```
<br>
Explaining non-relational databases is outside of the scope of this particular lesson. 

What you do need to know is that both styles of data storage (relational and non-relational) have strengths and weaknesses. <br> Rails primarily uses Relational Databases, and mastering SQL (along with Relational Database concepts) is essential to becoming a good Rails Developer. <br> Once you've mastered the Relational Database, understanding Non-Relational Databases will be a breeze. 

<br>
- - - -

## Start with SQL

So what is SQL? 

SQL is an ancronym. Yes, another acronymn...<br>

![](./images/acronyms.jpg)

that stands for:

**S - Structured**<br>**Q - Query**<br>**L - Language**<br>

Great! so...

![](./images/what.gif)

According to [this site](http://searchsqlserver.techtarget.com/definition/SQL): 
> SQL (Structured Query Language) is a standard interactive and programming language for getting information from and updating a database... **Queries take the form of a command language** that lets you select, insert, update, find out the location of data, and so forth.

Basically... You submit queries, through the SQL language, to a structured (relational) database. Those queries can **insert** (create), **select** (read), **update**, or **delete** items. 

You can directly map these actions to the standard Rails operations
![](./images/crud_grid.jpg)

*note: SQL can do significantly more than basic CRUD actions, but that is outside of the scope of this lesson. We are mainly focusing on the standard SQL actions for web applications.*


- - - -

## SQL in Rails

(challenges in this stage will be completeed by the instructor, unless you are working through the lesson independently)

**Challenge 1**

1. Create a new rails app titled db_explore
2. Navigate to the new app
2. use scaffolding to generate a **User Resource**, with the following:
	3. name (string)
	4. age (integer)
	5. city (string)
6. Create the table in the database
7. Once complete, Navitage to `localhost:3000/users` and add 5 users



**Challenge 1 Answers:**


```shell
$ rails new db_explore
$ cd db_explore
```

```shell
$ rails g scaffold User name:string age:integer city:string
```

```shell
$ rake db:migrate
```

### DB Console

You can actually jump into the database directly by running `$ rails dbconsole`

You'll be dropped into the database and should see a prompt that looks something like this: `sqlite>`


Start by running the `.help` command. This will give you an idea of what you can accomplish in the dbconsole. 


### SELECT

`SELECT` is by far the most complicated part of SQL, so we'll start there. 

You can pull all of the data from a specific table by running the following command: 

```SQL
sqlite> SELECT * FROM users;
```

Which will return:

```shell
1|Shane|31|Charlotte|2015-11-30 04:48:49.839777|2015-11-30 04:50:12.119858
2|Zack|26|Mooresville|2015-11-30 04:49:32.560862|2015-11-30 04:49:32.560862
3|Jon Paul|30|Los Angeles |2015-11-30 04:49:56.959506|2015-11-30 04:49:56.959506
4|Nick|28|Kansas City|2015-11-30 04:51:17.870682|2015-11-30 04:51:17.870682
5|Emily|33|Charlotte|2015-11-30 04:54:17.030918|2015-11-30 04:54:17.030918
```

Let's break down what's happening in that statement:

1. to select/read we use the `SELECT` clause
2. we use the `*` to reference ALL columns
3. We use the `FROM` clause to point our statement to the `users` table


#### A Few Things...

It's great to get all the data, but sometimes you just want a few items. 

**Challenge 2** 

- Return only the name and age of all users
- Displaying the following results:
	
	```shell
	Shane|31
	Zack|26
	Jon Paul|30
	Nick|28
	Emily|33
	```

**Challenge 2 Answer:**

```SQL
sqlite> SELECT name, age FROM users;
```

#### Limitations

If you have hundreds (or thousands) of rows in your table, you may want to get more specific and provide some limitations. In that case, you can use the following:

```SQL
sqlite> select * from users limit 2;
```

```shell
1|Shane|31|Charlotte|2015-11-30 04:48:49.839777|2015-11-30 04:50:12.119858
2|Zack|26|Mooresville|2015-11-30 04:49:32.560862|2015-11-30 04:49:32.560862
```

This returns the first 2 records for us. Now, I'm sure you're thinking 'what if I want something different?' Well just like offsetting in bootstrap, you can offset in your SQL statement. 

try running: 

```SQL
sqlite> SELECT * FROM users LIMIT 3,2;
```
This will produce: 

```shell
4|Nick|28|Kansas City|2015-11-30 04:51:17.870682|2015-11-30 04:51:17.870682
5|Emily|33|Charlotte|2015-11-30 04:54:17.030918|2015-11-30 04:54:17.030918
```

#### WHERE things get Specific

What if you'd like to be more specific? Like... looking for a specific object? 

```SQL
sqlite> SELECT * FROM users WHERE name = "Jon Paul";
```
Using the `WHERE` clause will return:

```shell
3|Jon Paul|30|Los Angeles |2015-11-30 04:49:56.959506|2015-11-30 04:49:56.959506
```

You can dial in your search even further by adding multiple items to the `WHERE` clause by using the `AND` keyword.

```SQL
sqlite> SELECT * FROM users WHERE name = "Nick" AND age = 28;
```
will return:

```shell
4|Nick|28|Kansas City|2015-11-30 04:51:17.870682|2015-11-30 04:51:17.870682
```

*note: `OR` is also an option...*

Additionally, you can use comparison operators. Go ahead and try it.

```SQL
SELECT * FROM users WHERE age > 30;
```
returns:

```shell
1|Shane|31|Charlotte|2015-11-30 04:48:49.839777|2015-11-30 04:50:12.119858
5|Emily|33|Charlotte|2015-11-30 04:54:17.030918|2015-11-30 04:54:17.030918
```

#### The Wildcard

Sometimes, you want to find something in the database, but you're unsure of the exact phrase. Thankfully, SQL supplies us with the `%` (wildcard) operator. 

```SQL
sqlite> SELECT * FROM users WHERE name LIKE '%Z%';
```

returns:

```shell
2|Zack|26|Mooresville|2015-11-30 04:49:32.560862|2015-11-30 04:49:32.560862
```

### UPDATE

We've covered the basic `SELECT` actions, so let's move into the next stage.

**Challenge 3**

1. `UPDATE` Nick's (or anyone's) city to Los Angeles
	2. start by `SELECT`ing Nick and finding the object ID
	3. `UPDATE` the object
4. Use `SELECT` to insure that the object has been updated 

*hint: you'll need to use the `UPDATE` and `SET` commands. If you get stuck, use  [this](http://www.tutorialspoint.com/sql/sql-update-query.htm) as a reference.*


**Challenge 3 Answer**

```SQL
sqlite> SELECT * FROM users WHERE name = "Nick";
4|Nick|28|Kansas City|2015-11-30 04:51:17.870682|2015-11-30 04:51:17.870682

sqlite> UPDATE users SET city = "Los Angeles" WHERE id = 4;

sqlite> SELECT * FROM users WHERE name = "Nick";
4|Nick|28|Los Angeles|2015-11-30 04:51:17.870682|2015-11-30 04:51:17.870682
```

Updating objects is pretty straight forward. Next we'll look at creating new objects. 


#### INSERT

We can use SQL to `INSERT` new objects into our database as well. Obviously, this represents the `create` operation in Rails. 

This is done by using the following syntax:

```SQL
sqlite> INSERT INTO users (name, age, city) VALUES ("Andrew", 27, "Charlotte");
```

*note: this will produce an error at the moment*

Looking closely you'll see that we are using the following keywords:

- `INSERT`
- `INTO`
- `VALUES`

While obviously, this makes sense in context. Pleaes take a moment to review each part of the statement closely. 

Thankfully, rails prevents us from adding data directly to the DB unless it's time stamped. 

Go ahead and add in created_at and updated_at values. 

```SQL
INSERT INTO users (name, age, city, created_at, updated_at) VALUES ("Andrew", 27, "Charlotte", 11/29/15, 11/29/15);
```
Selecting Andrew should return the following:

```SQL
SELECT * FROM users WHERE id = 6;
6|Andrew|27|Charlotte|0|0
```

#### DELETE

Last but not least, lets take a look at how to `DELETE` an object.

**Challenge 4**

1. `DELETE` the user with an id of 3
2. 	`SELECT` all the users, to ensure the object was successfully deleted.


**Challenge 4 Answer:**

```SQL
sqlite> DELETE FROM users WHERE id = 3;

sqlite> SELECT * FROM users;
1|Shane|31|Charlotte|2015-11-30 04:48:49.839777|2015-11-30 04:50:12.119858
2|Zack|26|Mooresville|2015-11-30 04:49:32.560862|2015-11-30 04:49:32.560862
4|Nick|28|Los Angeles|2015-11-30 04:51:17.870682|2015-11-30 04:51:17.870682
5|Emily|33|Charlotte|2015-11-30 04:54:17.030918|2015-11-30 04:54:17.030918
6|Andrew|27|Charlotte|0|0
```

You'll notice that the ID 3 is gone. Deleting an object at the database level will permanantly remove the ID as well. 

<br>

And, thats it! You've succesfully learned SQL crud actions and how they relate to rails. 

Now we can jump into Active Record, but first, you'll need to get out of the dbconsole. 

simply run `.exit` to get out. 

- - - -


## Create an app

Alright! time for us to implement some things.

okay, let's start by creating a new app. By now you should know the drill, but just in case... let's do another challenge

**Challenge 5**

1. Create a new Rails app named todo
2. Scaffold a Task Resource
3. When building the Resource make sure to include:
	4. name (string)
	5. priority (integer)
6. STOP!
7. Navigate to the migration file in your text editor
8. STOP!


<br>

**Challenge 5 Answer:**  

```shell
$ rails new todo
```

```shell
$ rails generate scaffold tasks name:string priority:integer
```


<br>

#### Migration Files

Once the challenge is complete, you should have the following migration file:

```ruby
class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :priority

      t.timestamps null: false
    end
  end
end
```
Let's break this down, line-by-line 

```ruby
# CreateTasks is inheriting from ActiveRecord
class CreateTasks < ActiveRecord::Migration

# A change method is being created
  def change
  
  # create table is a method that exists within rails 
  
  	# create a tasks table
    create_table :tasks do |t|
        
     # t represents an iteration 
     
     # create a string column with the title of name  
      t.string :name
      
      #createa an integer column with the name of priority
      t.integer :priority

		# create timestamps and don't allow them to be null (a lifesaver)
      t.timestamps null: false
      
    end
  end
end
```
- - - - 
## Create the Table

Now you'll want to run the migration and actually CREATE the table by running `$ rake db:migrate` <br> 

Which will result in the following terminal output:
 
```shell
== 20151103215638 CreateTasks: migrating ======================================
-- create_table(:tasks)
   -> 0.0012s
== 20151103215638 CreateTasks: migrated (0.0013s) =============================
```

*Make sure to check the SCHEMA to see your new table*

- - - -

## Rails Console (meet your new best friend)

Rails console is your friend. It's like a mashup of irb and db_console, but better than both! <br>
Essentially, rails console loads your entire application into a REPL so you have access to your entire application from the command line. <br>
I know what you're thinking, and yes... you're right. It saves you *tons* of time. 

So how do you get into rails console? <br>
It's like almost every other rails command. Simply type `$ rails console` and you'll be dropped into a prompt that looks kinda like this: 
<br>
`irb(main):001:0>`

First we'll need to CREATE a few tasks, similar to how we INSERTED data using SQL. 

**Challenge 6:**

1. Open the Rails Console...
2. Instantiate a new Task object
3. Assign a value to name and priority (using hash syntax) 
4. save it to the database<br>*hint: [You may find the Rails Guides helpful](http://guides.rubyonrails.org/v3.2.13/getting_started.html) for solving this problem.* <br>
5. Take a moment and review the SQL output in the terminal. *(note: it should look like the example below)* <br>
6. Add 4 or 5 more items through the rails console.   

```shell
(0.2ms)  begin transaction
SQL (1.1ms)  INSERT INTO "tasks" ("name", "priority", "created_at", "updated_at") VALUES (?, ?, ?, ?)  
[["name", "Pick up coffee"], ["priority", 1], ["created_at", "2015-11-04 05:19:09.834387"], ["updated_at", "2015-11-04 05:19:09.834387"]]
(0.7ms)  commit transaction

=> true
```



<br>


**Challenge 6 Answer:**

```shell
irb(main):001:0> x = Task.new(name: "Pick up coffee", priority: 1)
=> #<Task id: nil, name: "Pick up coffee", priority: 1, created_at: nil, updated_at: nil>
irb(main):002:0> x.save
```


#### New or Create
btw - a shorthand way to add items is by calling `Task.create` (this rolls new and save into one command)


- - - - 

## Seed some Data

Let's talk about seeds.<br>
If you navigate to `db/seeds.rb` in your text editor you'll see that you will add data directly to the database. 

Try creating a method that generates a random string. 

```ruby 
def random_string(x)
('a'..'z').to_a.shuffle[0..x-1].join
end
```
After that create a loop that 

- runs 10 times 
- utilizes the random_string method and applies that as the value for name
- selects a random number from 1 - 3 and applies that as the value for priority

```ruby
10.times do
 	Task.create(name: random_string(8), priority: (1..3).to_a.sample)
end
```

Here's what your seed file should look like:

```ruby
def random_string(x)
	('a'..'z').to_a.shuffle[0..x-1].join
end

10.times do
  Task.create(name: random_string(8), priority: (1..3).to_a.sample)
end
```

Now run `rake db:seed`

This will add 10 new random items to the database. 

#### ffaker

Thankfully, there is an easier way to add 'test data' to your application. My favorite solution is an app by the name of [ffaker](https://github.com/ffaker/ffaker). 

**Challenge 7** 

1. User the [the ffaker ruby gems info page](https://rubygems.org/gems/ffaker/versions/2.1.0) to add ffaker to your project
2. While we're at it... Add [Table Print](https://github.com/arches/table_print) to your project
3. Finally, for better logging, add the [shog gem](https://github.com/phallguy/shog)
4. Make sure to `bundle install`!


**Challenge 7 Answer:**

**ffaker**

```ruby
#in your gemfile
gem 'ffaker', '~> 2.1'
```

**Table Print**

```ruby
# in your gemfile
gem 'table_print'
```

**shog**

```ruby
# in your gemfile
gem 'shog'
```

**Install**

```shell
$ bundle install
```

Now you can generate dummy data. Navigate to your the rails console and run the following command:

```shell
irb(main):001:0> Task.new(name: FFaker::HipsterIpsum.words, priority: (1..3).to_a.sample)
```

Now, see if you can create a loop. Or better yet, add this to your seed file.


- - - - 





