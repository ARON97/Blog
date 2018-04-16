class User < ApplicationRecord
	has_many :articles # the user can add many articles
	before_save { self.email = email.downcase } # before the user gets saved it will take the email and turn it to lowercase and then save
	# username validations
	validates :username, presence: true, 
				uniqueness: { case_sensitive: false}, 
				length: { minimum: 3, maximum: 25 }
	# presence ensures that username is present. The only one it is going to ensure
	# uniqueness: { case_sensitive: false} - make sure the username is unique and
	# case sensitive constraint/uniqueness

	# email validations
	VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i  # regular expression for email
	validates :email, presence: true, length: { maximum: 105 },
			uniqueness: { case_sensitive: false},
			format: { with: VALID_EMAIL_REGEX }
	# format checks the validity of the email format
end