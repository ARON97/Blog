rails console - Gives direct access to the database and can be a playground such as testing database connections and methods

Article.all - Test db connection

article = Article.new - Create a new variable

article.title = "This my first article" - To add a new title

Important insert article.save after. This will generate a sql query

To create all this in one line use
article = Article.new(title: "...", description: "...")
			OR
Article.create(title: "...", description: "...") - BEST ONE

Edit from the Rails console

article = Article.find(2) - The row to edit
article.title = "This is an edited article" - edit title
article.save - to save the edited article

Delete from the Rails console

article = Article.find(2) - row to delete
article.destroy - delete the row

reload! - to refresh the console

To view errors
article.errors.any?
article.errors.full_messages

git add -A 				- Add to git
git commit -m "Create articles table, model and add validations" - to save to git with a message
git push - To add to github repository

Partial
Avoiding redundant code/code duplication (Combining the new.html.erb and edit.html.erb codes)
_form.html.erb - naming the partial file

VERY IMPORTANT
Making master branch always deployable to production

Any updates or features added going forward. I will add it to a feature branch,
So that if I mess up the branch. I can simply drop the branch or work on fixing it.
But my master branch will still be deployable to production. This is called an ADDED LAYER OF SAFETY.
All new features are built in feature branches. For example, when working in teams
and there is one application, each developer will be working on their individual
feature branch and then when a feature is completed. That feature is merged to the master branch.

To create a feature branch
git checkout -b create-users (then the name of the branch. Since we going to create users we will use create-users)
Note how master changes to branch

git branch - shows all the branches
git checkout master - to move back to the master branch
git checkout create-users - switching back to create-users branch

Add feature branch back to master branch

git status - first step commit changes
git add -A, commit changes
git commit -m "create users table and model"

Merge feature branch to master branch
git merge create-users

Since feature branch(create-users) has been merged to master branch
I no longer need my feature branch.
git branch -d create-users, deleting the feature branch, create-users

We used the small -d, because we merged the changes from the create-users back to our master branch. If we had not merge the changes, this command would not work
The we will had to use caps -D

Adding validations to User class
git checkout -b user-validations, create a feature branch
Go to rails console

To checkout validations go to guides.rubyonrails.org/active_record_validations.html
Use reload! when you updated a file in rails console

To create a new user
user = User.new(username: "jo", email: "hello")
To go back to previous command use the up arrow

Changing the username in rails console
user
user.username = "joe"
user.save, to save a username
user.valid? to check if a username is valid
reload? - to reload rails console

For email, to test out regular expressions. rebular.com

One to Many Associations
git checkout -b userarticle-association, create a new branch
Create a migration file to add the column
rails generate migration add_user_id_to_articles
Go to the migration file db/new created file. Add the columns
Run the migration file rails db:migrate

Go to user and add
has_many :articles # the user can add many articles

Go to articles and add
belongs_to :user

Not making user_id nil in articles. To enforce that we use
validates :user_id, presence: true

DEBUGGING
Go to gem file - Under group development test. There is a Gem called byebug
byebug allows you to debug on the fly
Insert debugger on the create method in Articles_controller and comment out a line. This will pause the server when the create button is clicked
Notice the byebug on the console. When article_params is typed in the details will be shown.
When N is typed in it goes to the next line and saves it
CTRL + D, goes out of the debugger. Debugging tutorial can be found on 096
 
User Authentication(Secure Password)
api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html
We going to use has_secure_password() in model(user.rb)
Gem - gem 'bcrypt', '->3.1.7' - this is the gem that we are going to use. Which is added into the Gemfile
We also going to need a column called password_digest in the users table. We using
users so it will be in the users table
The gem 'bcrypt' takes the password string that you entered and creates a one way
hash digest of that string and saves it to the database. In addition to that it also
adds a random bit of data to it, which is called a salt. So the string that you come
up with is virtually impossible to decrypt. If you not going to get the original
password back, how are you going to authenticate users later on? Answer: It gives
you a method called resource.authenticate('password') to compare passwords
bundle install --without production, this is to install the gem
rails generate migration add_password_digest_to_users, generate a migration to add the password_digest attribute to the users table
user.authenticate("notrightpassword"), to authenticate the password. It will return
the correct user when the right password is provided

PAGINATION
Install the pagination gems
Add the two to Gemfile. gem 'will_paginate', '3.1.5' and gem 'bootstrap-will_paginate', '1.0.0'
bundle install --without production
Go to the articles_controller.rb edit the index action
To display it in the views pull up the index.html.erb and modify it
Go to the users_controller.rb edit the index action
To display it in the views pull up the index.html.erb and modify it
To paginate the users articles
Go to users_controller.rb and modify the show action and then go to show.html.erb and modify it