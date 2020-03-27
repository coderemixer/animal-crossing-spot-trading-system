require 'bundler'
Bundler.require
require 'logger'

Dir[File.dirname(__FILE__) + '/routes/*.rb'].each { |file| require file }
require './app/errors/runtime_error'
Dir[File.dirname(__FILE__) + '/errors/*.rb'].each { |file| require file }
Dir[File.dirname(__FILE__) + '/initializers/*.rb'].each { |file| require file }
Dir[File.dirname(__FILE__) + '/services/*.rb'].each { |file| require file }
Dir[File.dirname(__FILE__) + '/models/*.rb'].each { |file| require file }
Dir[File.dirname(__FILE__) + '/workers/*.rb'].each { |file| require file }
