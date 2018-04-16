class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
    	# fields in the users table
    	t.string :username
    	t.string :email
    	t.timestamps # created and updated column
    end
  end
end
