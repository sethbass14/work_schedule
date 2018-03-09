require 'rails_helper'
describe Schedule do

  describe 'instance methods' do
    it 'has an end date' do
      expect(@week1_sched.end_date).to eq(@week1_sched.start_date + 6)
    end
  end

  describe 'validations' do
    it 'start date is current day or in the future' do
      expect((Schedule.new(start_date: DateTime.now)).valid?).to eq(true)
    end
  end


end
