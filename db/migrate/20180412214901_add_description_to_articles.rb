# used to update the table
class AddDescriptionToArticles < ActiveRecord::Migration[5.1]
  def change
  	# updating the table
  	add_column :articles, :description, :text
  	# add timestamp
  	add_column :articles, :created_at, :datetime
  	add_column :articles, :updated_at, :datetime
  end
end
