$LOAD_PATH.unshift(File.expand_path('.'))
require 'app'
require 'capybara/rspec'
require 'shoulda-matchers'

Capybara.app = Sinatra::Application

