# This file is copied to spec/ when you run 'rails generate rspec:install'
# require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'database_cleaner'

# Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    # Choose a test framework:
    with.test_framework :rspec
    # with.test_framework :minitest
    # with.test_framework :minitest_4
    # with.test_framework :test_unit

    # Choose one or more libraries:
    with.library :active_record
    with.library :active_model
    with.library :action_controller
    # Or, choose the following (which implies all of the above):
    with.library :rails
  end
end

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

    @mud = Company.create(name: "Mud")

    @james = User.create(name: 'James', company: @mud, admin: true)
    @seth = User.create(name: 'Seth', company: @mud)
    @brendan = User.create(name: 'Brendan', company: @mud)
    @bronson = User.create(name: "Bronson", company: @mud)
    @curl = User.create(name: "Curl", company: @mud)


    @bartender = Position.create(name: 'Bartender')
    @waiter = Position.create(name: 'Waiter')

    @seth.positions << [@bartender, @waiter]
    @brendan.positions << @waiter
    @bronson.positions << @bartender
    @curl.positions << @waiter

    @week1_sched = Schedule.create(start_date: DateTime.now, name: 'Week 1 Schedule', admin: @james)


    @barAM = Shift.create(start_time: "06:45", end_time: "16:00", position: @bartender, name: "Bar AM")
    @barPM = Shift.create(start_time: "16:00", end_time: "23:55", position: @bartender, name: "Bar PM")

    @waiterAM = Shift.create(start_time: "06:45", end_time: "16:00", position: @waiter, name: "Wait AM")
    @waiterPM = Shift.create(start_time: "16:00", end_time: "23:55", position: @waiter, name: "Wait AM")

    @workday1 = @week1_sched.workdays.first
    @workday2 = @week1_sched.workdays[1]

    @employee_shift1 = EmployeeShift.create(employee: @seth, shift: @barAM, workday: @workday1)
    @employee_shift3 = EmployeeShift.create(employee: @bronson, shift: @barPM, workday: @workday1)
    @employee_shift2 = EmployeeShift.create(employee: @brendan, shift: @waiterAM, workday: @workday1)
    @employee_shift4 = EmployeeShift.create(employee: @curl, shift: @waiterPM, workday: @workday1)
    @employee_shift5 = EmployeeShift.create(employee: @seth, shift: @barAM, workday: @workday2)
  end
end
