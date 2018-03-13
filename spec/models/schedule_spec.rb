require 'rails_helper'
describe Schedule do
  before(:each) do
    @test_schedule1 = Schedule.new(start_date: DateTime.now + 100, admin: @james)
    @test_schedule2 = Schedule.new(start_date: DateTime.now - 30, admin: @james)
    @test_schedule3 = Schedule.new(start_date: DateTime.now + 1, name: "test schedule 3", admin: @james)
  end

  describe 'instance methods' do
    it 'has an end date' do
      expect(@week1_sched.end_date).to eq(@week1_sched.start_date + 6)
    end
  end

  describe 'validations' do
    it 'has a unique start_date' do
      expect(Schedule.new(start_date: DateTime.now, admin: @james)).to_not be_valid
    end
    it 'start date is current day or in the future' do
      expect(@test_schedule1).to be_valid
      expect(@test_schedule2).to_not be_valid
    end

    it 'cannot overlap dates with existing schedules' do
      expect(@test_schedule3).to_not be_valid
    end

  end

  describe 'associations' do
    it {should have_many(:workdays).dependent(true)}
  end


end
