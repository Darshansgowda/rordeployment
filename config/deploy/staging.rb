# config/deploy/staging.rb
set :staging, :master
set :unicorn_rack_env, "staging"
set :rails_env, 'staging'
set :migration_role, 'db'
set :branch, "master"

role :app, %w{ec2-13-57-32-148.us-west-1.compute.amazonaws.com} # Server IP Address
role :web, %w{ec2-13-57-32-148.us-west-1.compute.amazonaws.com}
role :db, %w{ec2-13-57-32-148.us-west-1.compute.amazonaws.com}
 
set :ssh_options, {
keys: [File.expand_path('~/keys/jenkins-key.pem')],
forward_agent: true,
auth_methods: %w(publickey)
}
 
server 'ec2-13-57-32-148.us-west-1.compute.amazonaws.com', user: 'deploy', roles: %w{web app db}