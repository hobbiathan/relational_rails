class Country < ApplicationRecord
  has_many :warrooms

  def self.desc_order
    order(created_at: :desc)
  end

  def child_count
    Warroom.where(country_id: self.id).count
  end
end
