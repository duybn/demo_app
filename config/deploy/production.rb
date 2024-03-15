server "13.251.114.239", user: "deploy", roles: %w(web app db), primary: true

set :stage, :production
set :rails_env, :production
set :deploy_to, "/home/deploy/deploy/apps/"
set :branch, "main"
