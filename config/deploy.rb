#config/deploy.rb
# config valid for current version and patch releases of Capistrano
lock "~> 3.12.1"
set :default_environment, { 
  'PATH' => "/home/ec2-user/.rvm/gems/ruby-2.5.0/bin:/home/ec2-user/.rvm/gems/ruby-2.5.0@global/bin:/home/ec2-user/.rvm/rubies/ruby-2.5.0/bin:/home/ec2-user/.rvm/bin:/home/ec2-user/.nvm/versions/node/v6.11.5/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/opt/aws/bin:/home/ec2-user/.local/bin:/home/ec2-user/bin:$PATH",
  'RUBY_VERSION' => 'ruby 2.4.1',
  'GEM_HOME' => '/home/ec2-user/.rvm/gems/ruby-2.5.0',
  'GEM_PATH' => '/home/ec2-user/.rvm/gems/ruby-2.5.0' 
}

set :application, "rordeployment"
set :repo_url, "git@github.com:Darshansgowda/rordeployment.git"
set :branch, "master"

set :deploy_to, '/home/ec2-user/rordeployment'
set :log_level, :debug
 
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/assets}
 
namespace :deploy do
 desc 'Restart application'
 task :restart do
 invoke 'unicorn:restart'
 end
end
after 'deploy:publishing', 'deploy:restart'