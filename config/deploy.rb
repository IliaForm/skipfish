#require "rvm/capistrano"
set :using_rvm, true
set :rvm_ruby_string, '1.9.2'
set :application, "fish"
set :repository,  "gitorious@git.scalaxy.ru:web/skipfish.git"
#set :domain, "ilia@188.127.229.202"

set :scm, :git
set :deploy_to, "/home/skipfish/fish"
default_run_options[:pty] = true
#set :use_sudo, false
set :user, "skipfish"
set :scm_passphrase, "scalaxyforever"
ssh_options[:forward_agent] = true
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, '188.127.229.202'                          # Your HTTP server, Apache/etc
role :app, '188.127.229.202'                        # This may be the same as your `Web` server
role :db,  '188.127.229.202', :primary => true # This is where Rails migrations will run

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

 #If you are using Passenger mod_rails uncomment this:
 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end
 require "bundler/capistrano"