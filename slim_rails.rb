puts "Configuring application for Slim rails"

gem "slim-rails"
gem 'compass-rails'

mv "app/assets/stylesheets/application.css app/assets/stylesheets/application.sass"
run "echo @import \"base\" >> app/assets/stylesheets/application.sass"