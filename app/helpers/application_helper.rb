module ApplicationHelper

	# the gravatar_for method in the show.html.erb
	def gravatar_for(user, options = { size: 80})
		# Gravatar urls are based on md5 hashes of the users email address.
		# In Ruby the md5 algorithm is implemented using the hex digest method
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase) # with this we can construct the url
		size = options[:size]
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
		image_tag(gravatar_url, alt: user.username, class: "img-circle")
	end
end
