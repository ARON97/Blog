class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
    	# The table attribute
    	t.string :name
    	t.timestamps
    end
  end
end
