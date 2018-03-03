require 'rails_helper'
describe Company do
  describe 'associations' do
    it 'has a name' do
      expect(Company.first.name).to eq('Mud')
    end

    describe 'associations' do
      it 'has many employees' do
        expect(Company.first.employees).to include( @seth, @james, @brendan )
      end
    end

    
  end

end
