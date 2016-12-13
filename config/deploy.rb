# config valid only for Capistrano 3.4.1
lock '3.4.1'


set :application, 'stock_rocker'
set :repo_url, 'git@github.com:reesy121/stock-rocker.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/home/deploy/stock_rocker/'

set :deploy_via, :remote_cache

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, %w{config/database.yml config/secrets.yml}

# Default value for linked_dirs is []
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 6

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  desc "reload the database with seed data"
  task :seed do
    run "cd #{current_path}; bundle exec rake db:seed RAILS_ENV=#{fetch(:stage)}"
  end

  after :publishing, :restart
  before  'deploy:assets:precompile', 'deploy:migrate'

 # after :restart, :clear_cache do
  #  on roles(:web), in: :groups, limit: 3, wait: 10 do
   #   # Here we can do anything such as:
   #   within release_path do
   #      execute :rake, 'cache:clear'
   #    end
   # end
  #end

  desc "Check that we can access everything"
  task :check_write_permissions do
  on roles(:all) do |host|
    if test("[ -w #{fetch(:deploy_to)} ]")
      info "#{fetch(:deploy_to)} is writable on #{host}"
    else
      error "#{fetch(:deploy_to)} is not writable on #{host}"
    end
  end
end

end
