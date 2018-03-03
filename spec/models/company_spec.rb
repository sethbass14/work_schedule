require 'rails_helper'
describe Company do
  describe 'associations' do
    it 'has a name' do
      expect(Company.first.name).to eq('Mud')
    end
  end

end
