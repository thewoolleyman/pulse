set :application, "pulse"
set :repository,  "git@github.com:thewoolleyman/pulse.git"
set :use_sudo, false
set :scm, :git
set :user, 'ci'

role :web, "ci.rubyonrails.org"                          # Your HTTP server, Apache/etc
role :app, "ci.rubyonrails.org"                          # This may be the same as your `Web` server
role :db,  "ci.rubyonrails.org", :primary => true # This is where Rails migrations will run
role :db,  "ci.rubyonrails.org"

before "deploy:restart", "geminstaller"

task :geminstaller, :roles => :app do
  run "sudo geminstaller -c #{current_release}/config/geminstaller.yml"
end