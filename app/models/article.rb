class Article < ApplicationRecord

	# Validation for data integrity and length validation
	validates :title, presence: true, length: { minimum: 3, maximum: 50 } # Validation for the title
	validates :description, presence: true, length: { minimum: 10, maximum: 300 } # Validation for the title

end