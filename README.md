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