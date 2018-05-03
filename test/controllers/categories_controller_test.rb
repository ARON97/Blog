require 'test_helper' # this will be done in all tests

class CategoriesControllerTest < ActionDispatch::IntegrationTest

	def setup
		# creating a category
		@category = Category.create(name: "sports")
	end
	# ensure that the different routes are present and accessible for different actions
	test "should get categories index" do
		# get is an http request
		get categories_path
		assert_response :success
	end

	test "should get new" do
		get new_category_path
		assert_response :success
	end

	test "should get show" do
		# in rails 4: get(:show, {'id' => @category.id})
		get new_category_path(@category) 
		assert_response :success
	end

end