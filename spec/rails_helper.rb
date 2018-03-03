# This file is copied to spec/ when you run 'rails generate rspec:install'
# require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'

# Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|

  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  DatabaseCleaner.strategy = :truncation

  config.after(:all) do
    DatabaseCleaner.clean
  end

  config.before(:each) do
    mud = Company.create(name: "Mud")

    james = User.create(name: 'James', company: mud, admin: true)
    seth = User.create(name: 'Seth', company: mud)
    brendan = User.create(name: 'Brendan', company: mud)

    bartender = Position.create(name: 'Bartender')
    waiter = Position.create(name: 'Waiter')

    seth.positions << [bartender, waiter]
    brendan.positions << waiter

    week1_sched = Schedule.create(start_date: DateTime.now + 4, name: 'Week 1 Schedule', admin: james)
  end
end
