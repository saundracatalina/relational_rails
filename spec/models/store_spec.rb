require 'rails_helper'

describe Store, type: :model do
  describe 'relationships' do
    it { should belong_to :distribution_center }
  end

  describe 'class methods' do
    describe '::list_by_most_recent' do
      it 'lists the records from most recent to oldest' do
        dc_1 = DistributionCenter.create!(name: "Oh Ship", trucks_deployed: 20)
        dc_2 = DistributionCenter.create!(name: "Oh Ship", trucks_deployed: 20)

        store_1 = Store.create!(name: "Stuff 4 Sale", shipments_received: 150, distribution_center_id: "#{dc_1.id}", open: true)
        store_2 = Store.create!(name: "Stuff, Stuff, Stuff", shipments_received: 10, distribution_center_id: "#{dc_2.id}", open: true)

        expect(Store.list_by_most_recent.first).to eq(store_2)
      end
    end

    describe '::stores_by_dc' do
      it 'returns an integer representing the ammount of store records' do
        dc_1 = DistributionCenter.create!(name: "Oh Ship", trucks_deployed: 20)
        dc_2 = DistributionCenter.create!(name: "Oh Ship", trucks_deployed: 20)

        store_1 = Store.create!(name: "Stuff 4 Sale", shipments_received: 150, distribution_center_id: "#{dc_2.id}", open: true)
        store_2 = Store.create!(name: "Stuff, Stuff, Stuff", shipments_received: 10, distribution_center_id: "#{dc_1.id}", open: true)

        params = {
          :id => "#{dc_1.id}"
        }

        
        expect(Store.stores_by_dc(params)).to eq([store_2])
      end
    end

    describe '::true_first' do
      it 'Orders the Stores records with true values first' do
        dc_1 = DistributionCenter.create!(name: "Oh Ship", trucks_deployed: 20)
        dc_2 = DistributionCenter.create!(name: "Oh Ship", trucks_deployed: 20)

        store_1 = Store.create!(name: "Stuff 4 Sale", shipments_received: 150, distribution_center_id: "#{dc_2.id}", open: false)
        store_2 = Store.create!(name: "Stuff, Stuff, Stuff", shipments_received: 10, distribution_center_id: "#{dc_1.id}", open: true)

        expect(Store.true_first.first).to eq(store_2)
      end
    end
  end
end