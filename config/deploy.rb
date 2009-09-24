require "eycap/recipes"

set :application, "pulse"
set :repository,  "git@github.com:thewoolleyman/pulse.git"
set :use_sudo, false
set :scm, :git
set :user, 'ci'
set :git_enable_submodules, 1

role :web, "ci.rubyonrails.org"                          # Your HTTP server, Apache/etc
role :app, "ci.rubyonrails.org"                          # This may be the same as your `Web` server
role :db,  "ci.rubyonrails.org", :primary => true # This is where Rails migrations will run
role :db,  "ci.rubyonrails.org"

after "deploy:symlink", "deploy:geminstaller"
after "deploy:update_code", "deploy:symlink_configs"

namespace :deploy do
  task :default do
    deploy.long
  end

  task :geminstaller, :roles => :app do
    run "sudo geminstaller -c #{current_release}/config/geminstaller.yml"
  end

  # Hacks to use Passenger and not Mongrel
  task :start do  end
  task :stop do  end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end