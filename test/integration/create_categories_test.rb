require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

	# Integration test and feature Create Category
	test "get new categories form and create categories" do
		get new_category_path
		# assert the test
		assert_template 'categories/new'
		# create a category and display it. There should be a difference in category count
		assert_difference 'Category.count', 1 do
			# Rails 4, post_via_redirect categories_path, category: {name:"sports"}
			post categories_path, params:{category:{name:"sports"}}
		end
		# Where we send the user after the category is created. Sending the user to the categories listing
		assert_template 'categories/index'
		# Verification - ensure that the category name is displayed
		assert_match "sports", response.body
	end

	# Integration test for invalid category
	test "invalid category submission results in failure" do
		get new_category_path
		# assert the test
		assert_template 'categories/new'
		# create a category and display it. Assert no difference
		assert_no_difference 'Category.count' do
			# Rails 4, post_via_redirect categories_path, category: {name:"sports"}
			post categories_path, params:{category:{name: " "}} # follow_redirect!
		end
		# Where we send the user after the category is created. Sending the user to the categories listing
		assert_template 'categories/new'
		# Verification - look for the error from the errors partial
		assert_select 'h2.panel-title' # this is obtained from the shared/_errors.html.erb
		assert_select 'div.panel-body' # this is obtained from the shared/_errors.html.erb
	end

end
