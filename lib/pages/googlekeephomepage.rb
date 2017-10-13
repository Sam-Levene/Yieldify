class Pages::Googlekeephomepage < SitePrism::Page

	# This class is our starting page, it is the page we first visit on the site and is
	# Meant to serve as a sterile environment to reset the scenarios after each
	# Has been run; so that on the next run, we can go again from a safe starting point.

	set_url "https://www.google.com/keep/"
	set_url_matcher /www.google.com\/keep/

	def assertVisible
		if (page.has_content?("Save your thoughts, wherever you are") == false)
			throw "The page could not be asserted as visible"
		end
	end

	def clickLink(string)
		click_link(string)
	end

	# Ideally here, I'd like it if we were able to click a link with some actual text,
	# but as the text has a carriage return that Ruby does not like, I cannot.
	# Instead I am forced to resort to XPath, which is not ideal.
	
	def clickWebVersion
		page.find(:xpath, "/html/body/div[3]/div/div/div/div/div[2]/div/a[4]").click
	end

end