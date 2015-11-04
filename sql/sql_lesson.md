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
## Create an app

Alright! time for us to implement some things.

okay, let's start by creating a new app

```bash
$ rails new todo
```

We will then scaffold a resource titled items

```bash
$ rails generate scaffold tasks name:string priority:integer
```

Let's go take a look at the migration file:

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

## Rails Console

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

