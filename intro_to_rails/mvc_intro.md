# The MVC Architecture 

## MVC

**Rails** is designed to use an *architectural pattern* known as MVC.  
Which stands for:

- **Model** - the backbone of your application, handling all communcation with the database.
- **View** - responsible handling user interaction (ie: html and css)
- **Controller** - sits between the Model and View, handling the flow of your application

You can think of MVC as a logical foundation for your entire application.

Rails is a beloved choice of many developers because of the practical conventions that have been setup for us. Eliminating complex configurations and helping us to build our applications efficiently. 

Let's dig a little deeper to discuss what's happening

### Digging Deeper:

#### Model

- In the model we define classes that correspond with database columns and tables.  
- We can validate a field's presence by making it required, and set specific requirements
- We can create associations to other models 
- The Model is the gateway to the database, determining what gets in and what comes out.  

*Note: <br>convention is critical in Rails, so keep in mind that the model class is capitalized and singular (Project) and the corresponding table is lowercase and plural (projects).*

 

##### View

- The presentation is handled by views. 
- It's the surface layer that is encountered by users.  
- Views are essentialy page templates.  
- `ruby` and `html` are combined to make the view dynamic.  

For example: <br> If you were to build a site that has pages for user profiles, the basic layout would likely be the same for all users. Each individual profile would be populated with data specific to the currently visible user, but the layout would be handled by the view (page template) for all profiles. 

 

#### Controller

- Controllers handle interaction between the model and the view.  
- Requests from the user are passed through the controller
	- The controller determines the appropriate model and dispatches a request
	- Once recieved, the controller then determines the appropriate view to be rendered for the user.  

#### Bringing it all together

Let's say that we want to display only the last 10 comments by a user... 

- In our *controller*, we would create an instance variable named `@last10`. 
- When the user loads the page...
- A request is then sent to the *model*, which communicates with the database
- The database returns the last 10 comments to the *model*
- the *model* packages that data and gives it to the *controller* in the form of the `@last10` instance variale. 
- The *controller* then sends that packaged data to the *view*, which displays on the page for the user.


**To give you a visual of what's taking place:**

![](images/mvc.png)  

- - - -

