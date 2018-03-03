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
        expect(@seth.employee_shifts.first).to eq(@employee_shift1)
      end

      it 'has many shifts' do
        byebug
        expect(@seth.shifts.first).to eq(@barAM)
      end
    end


  end

end
