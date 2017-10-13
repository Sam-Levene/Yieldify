class Pages::Googlelogin < SitePrism::Page

	# This page logs us in using a Google test account that I have set up for the purpose of this test.
	# As we need to log in in order to use the Google Keep services, this data can be changed
	# To any e-mail account desired.

	def assertVisible
		if (page.has_title?("Sign in - Google Accounts") == false)
			throw "The page could not be asserted as visible."
		end
	end

	def accessValid
		fill_in('identifier', :with => "test36650@gmail.com")
  		find('#identifierNext').click
  		fill_in('password', :with => "tester123")
		find('#passwordNext').click
	end

end