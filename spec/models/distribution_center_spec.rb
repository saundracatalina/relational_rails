require 'rails_helper'

describe DistributionCenter, type: :model do
  describe 'relationships' do
    it { should have_many :stores }
  end
end

  describe 'class methods' do
    describe '#list_by_most_recent' do
      it 'lists the records from most recent to oldest' do
        dc_1 = DistributionCenter.create!(name: "Oh Ship", trucks_deployed: 20)
        dc_2 = DistributionCenter.create!(name: "Oh Ship", trucks_deployed: 20)
        
        expect(DistributionCenter.list_by_most_recent.first).to eq(dc_2)
      end
    end
  end