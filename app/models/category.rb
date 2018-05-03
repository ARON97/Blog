class Category < ApplicationRecord

	# Name validation(presents) and the length
	validates :name, presence: true, length: { minimum: 3, maximum: 25 }
	# Name uniqueness
	validates_uniqueness_of :name
end