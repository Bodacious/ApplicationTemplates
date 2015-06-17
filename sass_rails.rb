gem 'compass-rails'
gem 'bootstrap-rails'

file "config/initializers/assets.rb", <<-CODE
# Asset pipeline configuration goes here...
Rails.application.config.assets.js_compressor = :uglifier
Rails.application.config.assets.css_compressor = :sass
CODE

puts "Setting up base CSS files"

BASE_CSS_FILES = %w[ colours typography html responsiveness ]
APPLICATION_CSS_FILES = %w[ bootstrap-sprockets bootstrap font-awesome base ]

# Remove Rail's application.css file
run "rm app/assets/stylesheets/application.css"


# Add a SASS application.sass file
file 'app/assets/stylesheets/application.sass', <<-CODE
// Vendor files
@import "bootstrap-sprockets"
@import "bootstrap"
@import "font-awesome"

// Application files
@import "base"
@import "blocks"
CODE

# Add a SASS base.sass file
file"app/assets/stylesheets/base.sass", <<-CODE
@import "base/colours"
@import "base/typography"
@import "base/html"
@import "base/responsiveness"
CODE

file "app/assets/stylesheets/blocks.sass", <<-CODE
// Your BEM files go in ./blocks and should be loaded here:

CODE

inside("app/assets/stylesheets/blocks") do
  run "touch .gitkeep" 
end

inside("app/assets/stylesheets/base") do
  BASE_CSS_FILES.each { |filename| run "touch _#{filename}.sass"}
end