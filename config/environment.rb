# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Gamball::Application.initialize!

TEAM_NAME = YAML.load_file("#{Rails.root}/config/team_name.yml")