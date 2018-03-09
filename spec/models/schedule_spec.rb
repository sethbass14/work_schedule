require 'rails_helper'
describe Schedule do

  describe 'instance methods' do
    it 'has an end date' do
      expect(@week1_sched.end_date).to eq(@week1_sched.start_date + 6)
    end
  end

  describe 'validations' do
    it 'start date is current day or in the future' do
      # byebug
      expect((Schedule.new(start_date: DateTime.now, admin: @james)).valid?).to eq(true)
      expect((Schedule.new(start_date: DateTime.now - 2, admin: @james)).valid?).to eq(false)
    end
  end


end
