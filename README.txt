* Testing
  * git submodule init; git submodule update
  * Copy database.yml.example to database.yml and edit
  * Create and migrate development and test databases
  * Copy site_keys.rb.example to site_keys.rb and edit
* Deployment
  * Set up deployment with capistrano or chef
  * Add cron job for 'rake pulse:fetch_statuses RAILS_ENV=env'