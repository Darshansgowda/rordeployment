#config/deploy.rb
# config valid for current version and patch releases of Capistrano
lock "~> 3.12.1"
set :default_environment, { 
  'PATH' => "/u01/apps/qwinix/ruby-project",
  'RUBY_VERSION' => 'ruby 2.5.0',
  'GEM_HOME' => '/home/deploy/.rvm/gems/ruby-2.5.0',
  'GEM_PATH' => '/home/deploy/.rvm/gems/ruby-2.5.0' 
}

set :application, "rordeployment"
set :repo_url, "git@github.com:Darshansgowda/rordeployment.git"
set :branch, "master"

set :deploy_to, '/u01/apps/qwinix/ruby-project'
set :log_level, :debug
 
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/assets}
 
namespace :deploy do
 desc 'Restart application'
 task :restart do
 invoke 'unicorn:restart'
 end
end
after 'deploy:publishing', 'deploy:restart'