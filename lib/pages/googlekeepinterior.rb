class Pages::Googlekeepinterior < SitePrism::Page

	# This page is the interior working of our Google Keep system
	# It is the main place where most of the tests will be performed
	# And the place that the main focus of the service is provided.

	def assertVisible
		if (page.has_title?("Google Keep") == false)
			throw "The page could not be asserted as visible"
		end
	end

	# I'd like it if I could use the fill_in command, but as these are div contenteditable and not fields
	# This isn't possible. I'd also like it if they had some sort of identifier that I could use, but
	# They do not. As with the comment I made on the homepage, using XPath is not ideal.

	def writeNote
		page.find(:xpath, "/html/body/div[2]/div[2]/div[2]/div[1]").click
		page.find(:xpath, "/html/body/div[2]/div[2]/div[2]/div[1]/div[2]/div[1]/div[5]").set("Hello World")
		page.find(:xpath, "/html/body/div[2]/div[2]/div[2]/div[1]/div[2]/div[1]/div[7]").set("Mr Smee Says Hello World")
	end

	# This should be a button or even a link, but instead it's a div, same as above. 
	# As such, I can't click on it as if it were a button or a link, and so I have to
	# Resort to using XPath.

	def saveNote
		page.find(:xpath, "/html/body/div[2]/div[2]/div[2]/div[1]/div[2]/div[2]/div[1]").click
	end

	def assertNoteVisible
		if (page.has_content?("Mr Smee Says Hello World") == false)
			throw "The note was not written and so could not be validated when checking"
		end
	end

	# These should be buttons or links, but instead they are divs, and hidden ones by default 
	# As such, I have had to resort to clicking on the top element (div[1]) to expand the
	# Hidden divs and make them visible to be clicked by the framework

	def deleteNote
		page.find(:xpath, "/html/body/div[2]/div[2]/div[4]/div/div[1]").click
		page.find(:xpath, "/html/body/div[7]/div/div[2]/div[2]/div[2]/div[7]").click
		page.find(:xpath, "//*[@id=\":2\"]").click
	end

	def assertNoteDeleted
		if (page.has_content?("Mr Smee Says Hello World") == true)
			throw "The note was not deleted and still exists. This needs fixing!"
		end
	end

	def logOut
		page.find(:xpath, "//*[@id=\"gb\"]/div[2]/div[3]/div/div[3]/div/a").click
		click_link("Sign out")
	end

end