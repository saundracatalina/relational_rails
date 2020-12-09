class DistributionCenter < ApplicationRecord
  has_many :stores

  def self.list_by_most_recent
    order(created_at: :desc)
  end
end