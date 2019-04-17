require 'selenium-webdriver'
require 'selenium'
require 'rspec'
require 'cucumber'
require 'capybara'
require 'capybara/cucumber'
require 'site_prism'
require 'pry'
require 'selenium-chrome'
require_relative 'page_objects'
require 'selenium-webdriver', '~> 3.141'


World(PageObjects)

BROWSER = ENV['BROWSER']
ENV_TYPE = ENV['ENV_TYPE']

DATA = YAML.load_file(File.dirname(__FILE__) + "/data/#{ENV_TYPE}.yml")

Capybara.register_driver :selenium do |app|

	if BROWSER.eql?('chrome')
		
		Capybara::Selenium::Driver.new(
			app, 
			:browser => :chrome,
			:desired_capabilities => Selenium::WebDriver::Remote::Capabilities.chrome(
				'chromeOptions' => {
					'args' => [
					"start-maximized",
					"--no-sandbox",
                	"--disable-web-security",
                	"--disable-extensions",
                	"--allow-running-insecure-content"],
                	useAutomationExtension: false,
				}
			)
		)

	elsif BROWSER.eql?('firefox')
		
		Capybara::Selenium::Driver.new(
			app, 
			:browser => :firefox,
			:marionette => true
		)
	elsif BROWSER.eql?('ie')
		
		Capybara::Selenium::Driver.new(
			app, 
			:browser => :internet_explorer	
		)
	end	
end 

Capybara.configure do |config|
	#Capybara.default_driver = :Selenium
	config.default_driver = :Selenium
	config.app_host = DATA['URL']	
	#Capybara.default_max_wait_time = 35
	config.default_max_wait_time = 35
end 

ENV['ENV'] = 'gisweb' unless ENV.key?'ENV'
	MASSA = YAML.load_file('./fixtures/default_data.yml')[ENV['ENV']]