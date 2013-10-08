$LOAD_PATH.unshift(File.expand_path('.'))
require 'app'
require 'capybara/rspec'

Capybara.app = Sinatra::Application

