gem 'compass-rails'

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
@import "colours"
@import "typography"
@import "html"
@import "responsiveness"
CODE

file "app/assets/stylesheets/blocks.sass", <<-CODE
// Your BEM files go in ./blocks and should be loaded here:
@import "blocks/*"
CODE

inside("app/assets/stylesheets/blocks") do
  BASE_CSS_FILES.each { |filename| run "touch .gitkeep"}
end

inside("app/assets/stylesheets/base") do
  BASE_CSS_FILES.each { |filename| run "touch _#{filename}.sass"}
end