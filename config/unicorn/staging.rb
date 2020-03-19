root = "/home/ec2-user/rordeployment/current"

pid           "#{root}/tmp/pids/unicorn.pid"
stderr_path   "#{root}/log/unicorn_error.log"
stdout_path   "#{root}/log/unicorn.log"

listen "/tmp/unicorn.socket", :backlog => 2048

preload_app true
working_directory root
worker_processes 4
timeout 30