class AddAdminToUsers < ActiveRecord::Migration[5.1]
  def change
  	# Add a column in the users called admin and a type as boolean and fill it with false
  	add_column :users, :admin, :boolean, default: false
  end
end
