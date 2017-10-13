require "capybara"
require "capybara/cucumber"
require "selenium-webdriver"
require "site_prism"
require "active_support"
require "rspec"

Selenium::WebDriver.for :chrome, driver_path: '/usr/bin/chromedriver'
Selenium::WebDriver.for :firefox, driver_path: '/usr/bin/geckodriver'

# The below active support entry ensures that all files in the 'lib' foolder are autoloaded as part of a program run
# information on ActiveSupport can be found here in regards to rails applications (although it provides a useful guide)
# here is the link to the rubydoc information on the ActiveSupport::Dependencies - http://www.rubydoc.info/docs/rails/2.3.8/ActiveSupport/Dependencies


Capybara.configure do |config|
  config.run_server = false             # To ensure a Rack server does not start
  config.ignore_hidden_elements = false # To ensure that all hidden elements on a page are recorded/available
  config.default_max_wait_time= 10      # Wait time for asynchronus processes to finsh
  config.default_driver = :chrome       # Default browser - input :chrome to use chrome browser as stated in the driver registration below
  config.match = :prefer_exact          # This setting is to ensure Capybara has specific matching rather than fuzzy logic
end

ActiveSupport::Dependencies.autoload_paths << File.expand_path(File.join(Dir.pwd, 'lib'))

if ENV['chrome']
  Capybara.default_driver = :chrome
  Capybara.register_driver :chrome do |app| # Registration of chrome driver
    options = {
      :js_errors => false,
      :timeout => 360,
      :debug => false,
      :inspector => false,
    }
    Capybara::Selenium::Driver.new(app, :browser => :chrome, :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.chrome('chromeOptions' => 
        {
          'args' => ["--disable-extensions", "--start-maximized"]
        }))
  end

elsif ENV['firefox']
  Capybara.default_driver = :firefox
  Capybara.register_driver :firefox do |app| # Registration of firefox driver
    options = {
      :js_errors => true,
      :timeout => 360,
      :debug => false,
      :inspector => false,
    }
    Capybara::Selenium::Driver.new(app, :browser => :firefox)
  end

else
  throw "You did not specify an environment, try using 'chrome=true cucumber' or 'firefox=true cucumber'"
end