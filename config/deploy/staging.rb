# config/deploy/staging.rb

server "13.57.32.148", user: "deploy", roles: %w{app db web}
 server "13.57.32.148", user: "deploy", roles: %w{app web} 
 server "13.57.32.148", user: "deploy", roles: %w{db}

set :branch, "master"
set :stage, "staging"
role :app, %w{deploy@13.57.32.148}
role :web, %w{deploy@13.57.32.148}
role :db, %w{deploy@13.57.32.148 }