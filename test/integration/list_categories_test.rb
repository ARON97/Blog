require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest

	def setup
		@category = Category.create(name: "Books")
		@category2 = Category.create(name: "Programming")
	end

	test "should show categories listing" do
		# get to the categories listing page
		get categories_path
		assert_template 'categories/index'
		# test all categories are listed and link to the categories page
		assert_select "a[href=?]", category_path(@category), text: @category.name
		assert_select "a[href=?]", category_path(@category2), text: @category2.name
	end

end
