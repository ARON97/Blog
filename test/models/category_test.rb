require 'test_helper' # this will be done in all tests

class CategoryTest < ActiveSupport::TestCase
	# testing category model. To test if we can create a category

	# Runs before every test. First runs this action and then continues to testing the app
	def setup
		# this does not happen in the database but in the test database
		@category = Category.new(name: "Sport") # we want to have a category of sport
	end

	# the test
	test "category should be valid" do
		# check if category instance variable @category is valid
		assert @category.valid?
	end

	# Enforcing presence name
	test "name should be present" do
		@category.name = " "
		# test that the above code should not be valid. Use assert_not
		assert_not @category.valid?
	end

	# name should be unique
	test "name should be unique" do
		# first saving the category
		@category.save
		# initiate a new category
		category2 = Category.new(name: "Technology")
		# category2 should not be valid. We should not create another category sports
		assert_not category2.valid?
	end

	# length validation
	test "name should not be too long" do
		@category.name = "a" * 26 # the maximum a name can be is 26 characters
		assert_not @category.valid?
	end

	# length validation
	test "name should not be too short" do
		@category.name = "aa" # minimum character should be 3
		assert_not @category.valid?
	end
end