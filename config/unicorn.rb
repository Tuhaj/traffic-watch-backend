# Minimal sample configuration file for Unicorn (not Rack) when used
# with daemonization (unicorn -D) started in your working directory.
#
# See http://unicorn.bogomips.org/Unicorn/Configurator.html for complete
# documentation.
# See also http://unicorn.bogomips.org/examples/unicorn.conf.rb for
# a more verbose configuration using more features.

# listen 3000 # by default Unicorn listens on port 8080 I comment it out so gets request from NginX
worker_processes 2# this should be >= nr_cpus
pid "/home/piotr/traffic-watch-backend/shared/tmp/pids/unicorn.pid"
stderr_path "/home/piotr/traffic-watch-backend/shared/log/unicorn.log"
stdout_path "/home/piotr/traffic-watch-backend/shared/log/unicorn.log"

# Help ensure your application will always spawn in the symlinked
# "current" directory that Capistrano sets up.
working_directory '/home/piotr/traffic-watch-backend/current'
#not tested yet
listen "/home/piotr/traffic-watch-backend/shared/tmp/sockets/unicorn.sock", :backlog => 64

#unicorn workers pids in ~/app/shared/tmp/pids/ directory
after_fork do |server, worker|
  defined?(ActiveRecord::Base) && ActiveRecord::Base.establish_connection
  child_pid = server.config[:pid].sub('.pid', ".#{worker.nr}.pid")
  system("echo #{Process.pid} > #{child_pid}")
end
