gem 'rspec-rails', group: :test


environment do
  text = <<-TEXT
  config.generators do |g|
    g.controller_specs = false
    g.view_specs       = false
  end
  TEXT
end

