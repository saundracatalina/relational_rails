class DistributionCenter < ApplicationRecord
  has_many :stores

  def self.list_by_most_recent
    order(created_at: :desc)
  end

  def self.filtered_trucks(filter)
    require 'pry'; binding.pry
    where("trucks_deployed: > filter.to_i")
  end
end