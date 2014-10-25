server 'v.ps', roles: %w{web app db}
set :ssh_options, user: 'deployer', port: 6311