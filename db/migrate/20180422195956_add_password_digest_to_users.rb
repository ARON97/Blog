class AddPasswordDigestToUsers < ActiveRecord::Migration[5.1]
  def change
  	# Adding the column and the data type to the users table
  	add_column :users, :password_digest, :string
  end
end
