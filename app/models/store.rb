class Store < ApplicationRecord
  belongs_to :distribution_center

  def self.list_by_most_recent
    order(created_at: :desc)
  end

  def self.store_count
    require 'pry'; binding.pry
  end
end

