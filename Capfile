#Capfile
# Load DSL and set up stages
require "capistrano/setup"
# Include default deployment tasks
require "capistrano/deploy"

require "capistrano/rails"
require "capistrano/rails/assets"
require "capistrano/rails/migrations"
require 'capistrano/rvm'
require "capistrano/bundler"
require "capistrano3/unicorn"

set :rvm_ruby_string, '2.5.0' 
set :linked_files, %w{config/secrets.yml config/database.yml}
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }