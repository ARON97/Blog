class Article < ApplicationRecord
	belongs_to :user # article is the many side of the one to many relationship
	# setup the many to many relationship connection
	has_many :article_categories
	has_many :categories, through: :article_categories
	# Validation for data integrity and length validation
	validates :title, presence: true, length: { minimum: 3, maximum: 50 } # Validation for the title
	validates :description, presence: true, length: { minimum: 10, maximum: 300 } # Validation for the title
	validates :user_id, presence: true # ensures that user_id is present when creating an article

end