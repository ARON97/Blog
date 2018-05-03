require 'test_helper' # this will be done in all tests

class CategoriesControllerTest < ActionDispatch::IntegrationTest

	def setup
		# creating a category
		@category = Category.create(name: "sports")
		# simulate an admin that is logged in. Create an admin user for the test
		@user = User.create(username: "John", email: "john@example.com", password: "password", admin: true)
	end
	# ensure that the different routes are present and accessible for different actions
	test "should get categories index" do
		# get is an http request
		get categories_path
		assert_response :success
	end

	test "should get new" do
		# simulate login. Login in the admin from the test
		sign_in_as(@user, "password")
		get new_category_path
		assert_response :success
	end

	test "should get show" do
		# in rails 4: get(:show, {'id' => @category.id})
		get new_category_path(@category) 
		assert_response :success
	end

	# Admin User Requirement and Test
	test "should redirect create when admin not logged in" do
		# if an admin user is not logged in
		assert_no_difference 'Category.count' do
			post categories_path, params:{category:{name:"sports"}}
		end
		# redirect
		assert_redirected_to categories_path
	end

end