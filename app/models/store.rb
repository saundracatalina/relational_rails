class Store < ApplicationRecord
  belongs_to :distribution_center

  def self.list_by_most_recent
    order(created_at: :desc)
  end

  def self.stores_by_dc(params)
    Store.where(distribution_center_id: params[:id])
  end

  def self.true_first
     order(open: :desc)
  end
end

