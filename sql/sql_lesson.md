## Relational vs Non-Relational

A relational database is a series of **Tables** with **Columns** and **Rows**... Yes... Kind of like Excel or CSV. 
<br>

Let's take a look at a Relational-Databasey version of a Todo App:

|Name  | Priority  |
|:-:|:-:|
| Pay Electric Bill  |  1  |
| Pick up Vegan Cheese | 3   |
| Send out Party Invitations  | 2  |

In this situation, the **Tasks** table contains 2 columns:  Name and Priority. <br>
In OOP terms, these columns would be considered the attributes of an object. And **each individual row** would be considered an object of the Todo class. 

So, when you create a new object by running the command `Todo.new("call sister", 2) ` 
You'll create the following in the database:

|Name  | Priority  |
|:-:|:-:|
| Pay Electric Bill  |  1  |
| Pick up Vegan Cheese | 3   |
| Send out Party Invitations  | 2  |
| call sister  |  2  |



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

Explaining non-relational databases is outside of the scope of this particular lesson. 

What you do need to know is that both databases have strengths and weaknesses. Rails primarily uses Relational Databases, and mastering SQL (and Relational Database concepts) is essential to becoming a good Rails Developer. Once you've mastered the Relational Database, understanding Non-Relational Databases will be a breeze. 

<br>

- - - -
## Create an app


In this situation 

okay, let's start by creating a new app

```shell
$ rails new todo
```

We will then scaffold a resource titled items

```shell
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


