require 'rails_helper'
describe Workday do
  describe 'Workday day associations' do
    it { should belong_to(:schedule) }
  end
end
