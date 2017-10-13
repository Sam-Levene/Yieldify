# This is our step definitions file, which turns our Given, When, Then requests 
# In our feature file into actionable steps using Ruby.

# For each "Given", we need a new instance of the website as the scenarios are designed 
# To work independently of one another as well as collectively.

Given("I can access the Google Keep website") do
	@google_keep_site_reference = Googlekeepwebsite.new
	@google_keep_site_reference.google_keep_homepage.load
end

Then("I can see the Google Keep homepage") do
	@google_keep_site_reference.google_keep_homepage.assertVisible
end

When("I click on the {string} link") do |string|
	@google_keep_site_reference.google_keep_homepage.clickLink(string)
end

When("I click on the Web Version link") do
	@google_keep_site_reference.google_keep_homepage.clickWebVersion
end

When("I login to google with a valid account") do
	@google_keep_site_reference.google_log_in.assertVisible
	@google_keep_site_reference.google_log_in.accessValid
end

Then("I can access the Google Keep system") do
	@google_keep_site_reference.google_keep_interior.assertVisible
end

# In the below Given, we need to set up the environment to the correct state, which means repeating the work we did before.
# To allow the site to assert properly, I have added a sleep function, which tells the automation to wait for a few
# Seconds before processing the next line of code.

Given("I am already logged in to the Google Keep system") do
	@google_keep_site_reference = Googlekeepwebsite.new
	@google_keep_site_reference.google_keep_homepage.load
	@google_keep_site_reference.google_keep_homepage.clickLink("Try Google Keep")
	@google_keep_site_reference.google_keep_homepage.clickWebVersion
	@google_keep_site_reference.google_log_in.assertVisible
	@google_keep_site_reference.google_log_in.accessValid
	sleep(5)
	@google_keep_site_reference.google_keep_interior.assertVisible
end

When("I write my notes down") do
	@google_keep_site_reference.google_keep_interior.writeNote
end

When("I save my note") do
	@google_keep_site_reference.google_keep_interior.saveNote
end

Then("I can see my note in the list of notes.") do
	@google_keep_site_reference.google_keep_interior.assertNoteVisible
end

# Thanks to the fact that we have a Given that sets up the environment, we don't need to do it again, just re-reference
# The old one above for the next steps below. This increases modularity and allows for re-usable code.

When("I have a note that can be deleted") do
	@google_keep_site_reference.google_keep_interior.assertNoteVisible
end

When("I delete a note") do
	@google_keep_site_reference.google_keep_interior.deleteNote
end

Then("I can no longer see my note in the list of notes.") do
	sleep(5)
	@google_keep_site_reference.google_keep_interior.assertNoteDeleted
end

# This is our last test, where we need to log out. Thankfully, most of this is fairly straightforward.

When("I click on the Log Out button") do
	@google_keep_site_reference.google_keep_interior.logOut
end

Then("I can no longer access the Google Keep system") do
	@google_keep_site_reference.google_log_in.assertVisible
end