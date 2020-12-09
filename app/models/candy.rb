class Candy < ApplicationRecord
  belongs_to :candy_shop

  def self.list_by_most_recent
    order(created_at: :desc)
  end
end
