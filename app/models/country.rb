class Country < ApplicationRecord
  validates :country_name, presence: true

  has_many :warrooms, :dependent => :destroy

  def self.desc_order
    order(created_at: :desc)
  end

  def child_count
    Warroom.where(country_id: self.id).count
  end
end
