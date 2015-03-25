
worker_processes 2
pid "/home/piotr/traffic-watch-backend/shared/tmp/pids/unicorn.pid"
stderr_path "/home/piotr/traffic-watch-backend/shared/log/unicorn.log"
stdout_path "/home/piotr/traffic-watch-backend/shared/log/unicorn.log"

working_directory '/home/piotr/traffic-watch-backend/current'

listen "/home/piotr/traffic-watch-backend/shared/tmp/sockets/unicorn.sock", :backlog => 64

preload_app       true

before_fork do |server, worker|
  # the following is highly recomended for Rails + "preload_app true"
  # as there's no need for the master process to hold a connection
  #defined?(ActiveRecord::Base) and
  #  ActiveRecord::Base.connection.disconnect!

  old_pid = "#{server.config[:pid]}.oldbin"
  if old_pid != server.pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

#unicorn workers pids in ~/app/shared/tmp/pids/ directory
after_fork do |server, worker|
  defined?(ActiveRecord::Base) && ActiveRecord::Base.establish_connection
  child_pid = server.config[:pid].sub('.pid', ".#{worker.nr}.pid")
  system("echo #{Process.pid} > #{child_pid}")
end
