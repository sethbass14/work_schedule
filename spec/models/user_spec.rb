require 'rails_helper'
describe User do
  describe 'User attributes' do
    it 'has a name' do
      expect(@james.name).to eq('James')
    end

    describe 'associations' do
      it 'belongs to a company' do
        expect(@seth.company).to eq(@mud)
      end

      it 'has many employee shifts' do
        expect(@seth.employee_shifts).to eq([@employee_shift1, @employee_shift5])
      end

      it 'has many shifts' do
        # byebug
        expect(@seth.shifts.first).to eq(@barAM)
      end

      it 'has many workdays' do
        expect(@seth.workdays).to eq([@workday1, @workday2])
      end

      it 'has many positions' do
        expect(@seth.positions).to eq([@bartender, @waiter])
      end


    end


  end

end
