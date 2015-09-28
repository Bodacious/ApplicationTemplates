puts "Configuring application for Slim rails"

gem "slim-rails"

file "config/initializers/slim.rb", <<-CODE
Slim::Embedded.options[:markdown] = { :smartypants => true }

Slim::Engine.set_options({
  pretty: Rails.env.development?,
  sort_attrs: false,
  format: :html,
  tabsize: 2
})
CODE

run "gem install html2slim" unless run("gem list html2slim")


inside("app/views/layouts") do
  run "erb2slim application.html.erb application.html.slim"
  run "rm application.html.erb"
end