class ArticleCategory < ApplicationRecord
	# Build the association
	belongs_to :article
	belongs_to :category
end