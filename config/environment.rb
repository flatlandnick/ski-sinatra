@environment = ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, @environment)

@dbconfig = YAML.load(File.read('config/database.yml'))

ActiveRecord::Base.establish_connection(@dbconfig[@environment])

require './app/controllers/application_controller'
require_all 'app'
