 class Category < ApplicationRecord

	# setup the many to many relationship connection
	has_many :article_categories
	has_many :articles, through: :article_categories
	# Name validation(presents) and the length
	validates :name, presence: true, length: { minimum: 3, maximum: 25 }
	# Name uniqueness
	validates_uniqueness_of :name
end