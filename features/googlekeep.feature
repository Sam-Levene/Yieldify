Feature: Testing the functionality of Google Keep.

	As a user,
	I want to be able to access and utilise the Google Keep services,
	So that I can keep a record of my thoughts.


	# The first test we want is to validate that we can access the Google Keep website.
	# This is crucial as, if this test doesn't work, then no subsequent tests will work.

	@Scenario_01 @Passing
	Scenario: I want to access the webpage
		Given I can access the Google Keep website
		Then I can see the Google Keep homepage

	# The second test is to actually access the internal working of the Google Keep system.
	# We will need a valid Google account in order to access it. 
	# This means we will need a test account of some description with Google.

	@Scenario_02 @Passing
	Scenario: I want to start up Google Keep to record my thoughts.
		Given I can access the Google Keep website
		When I click on the "Try Google Keep" link
		And I click on the Web Version link
		And I login to google with a valid account
		Then I can access the Google Keep system

	# We can also add a negative test for the above scenario, to check for invalid logins,
	# This aids in Security Testing as it can reveal how vulnerable the site is to attack.
	# We won't for this example, as we only are automating 5 of the tests.

	# Now that we are logged in, there are a number of links on the page that we can test for,
	# Including, but not limited to, Archive, Trash, Settings, Reminders, Labels, Sending Feedback
	# Help, App Downloads, Keyboard Shortcuts, Etc.

	# For the third test, we are going to test the main function of the Google Keep service, 
	# Which is to store notes for future reference.

	@Scenario_03 @Passing
	Scenario: I want to create a new note to begin storing my thoughts.
		Given I am already logged in to the Google Keep system
		When I write my notes down
		And I save my note
		Then I can see my note in the list of notes.

	# Now that we have a note, there are more tests that we can do on the note, such as moving it
	# Around with other notes on the page (If we have any), adding a reminder, setting a colour,
	# Adding a picture, Pinning the note or Archiving it for future use.

	# We can also add a negative test for the above scenario, such as failing to write a proper note,
	# or for Secuity Testing, such as checking for SQL Injection attacks, etc.

	# Our next test is to delete the Note, as this is one of the main functions of the service.
	# Please Note that, for this scenario to work, we need a note to have been created, so please
	# use this scenario only after Scenario 3 above.

	@Scenario_04 @Passing
	Scenario: I want to delete my note as it is no longer relevant.
		Given I am already logged in to the Google Keep system
		When I have a note that can be deleted
		And I delete a note
		Then I can no longer see my note in the list of notes.

	# Now that we have a deleted note, which we can check exists in the trash section, we have a few more
	# Areas we could check, such as restoring the Note or deleting it completely.

	# Our final test is to ensure we can log out of the system without seeing the internal
	# Google Keep records, so that nobody else can see the Notes apart from the user
	# Who created them.

	@Scenario_05 @Passing
	Scenario: I want to Log Out of the system
		Given I am already logged in to the Google Keep system
		When I click on the Log Out button
		Then I can no longer access the Google Keep system
