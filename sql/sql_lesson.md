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



- - - -
## Create an app

Alright! time for us to implement some things.

okay, let's start by creating a new app

```bash
$ rails new todo
```

We will then scaffold a resource titled tasks

```bash
$ rails generate scaffold tasks name:string priority:integer
```

Before doing anything else, go take a look at the migration file:

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
 
```bash
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

**rails console challenge:**

- In Rails Console...
	- Instantiate a new Task object
	- Assign a value to name and priority (using hash syntax) 
	- save it to the database

*hint: [You may find the Rails Guides helpful](http://guides.rubyonrails.org/v3.2.13/getting_started.html) for solving this problem.*

Take a moment and review the SQL output in the terminal. 

```bash
(0.2ms)  begin transaction
SQL (1.1ms)  INSERT INTO "tasks" ("name", "priority", "created_at", "updated_at") VALUES (?, ?, ?, ?)  
[["name", "Pick up coffee"], ["priority", 1], ["created_at", "2015-11-04 05:19:09.834387"], ["updated_at", "2015-11-04 05:19:09.834387"]]
(0.7ms)  commit transaction

=> true
```
<br>

Add 4 or 5 more items through the rails console. 
<br>

#### New or Create
A shorthand way to add items is by calling `Task.create` (this rolls new and save into one command)


table print gem
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

- - - - 
## Answers


**rails console answer:**

```bash
irb(main):001:0> x = Task.new(name: "Pick up coffee", priority: 1)
=> #<Task id: nil, name: "Pick up coffee", priority: 1, created_at: nil, updated_at: nil>
irb(main):002:0> x.save
```



