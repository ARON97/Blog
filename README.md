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