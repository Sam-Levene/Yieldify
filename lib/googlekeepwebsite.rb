class Googlekeepwebsite

	# This class is our website superstructure
	# It allows us to define our pages as individual page classes
	# And instanciate them when we need to

	def google_keep_homepage
		Pages::Googlekeephomepage.new
	end

	def google_log_in
		Pages::Googlelogin.new
	end

	def google_keep_interior
		Pages::Googlekeepinterior.new
	end

end