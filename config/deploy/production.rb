# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary server in each group
# is considered to be the first unless any hosts have the primary
# property set.  Don't declare `role :all`, it's a meta role.

set :bagman, '178.62.46.43'
server :bagman, user: 'piotr', roles: %w{web app db}, :primary => true

set :rails_env, "production"
# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server definition into the
# server list. The second argument is a, or duck-types, Hash and is
# used to set extended properties on the server.

# server 'example.com', user: 'deploy', roles: %w{web app}, my_property: :my_value


# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult[net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start).
#
# Global options
# --------------

 set :ssh_options, {:forward_agent => true}
# ssh_options[:port] = 22
#
# And/or per server (overrides global)
# ------------------------------------
# server 'example.com',
  # user: 'piotr'
#   roles: %w{web app},
#   ssh_options: {
#     user: 'user_name', # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: 'please use keys'
#   }

# namespace :whenever do
#   desc 'update crontab'
#   task :update_crontab do
#     on roles(:db) do
#       execute "/bin/bash -lxc whenever --update-crontab store"
#     end
#   end
# end

# after "deploy:updated",  "whenever:update_crontab"
