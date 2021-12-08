class Warroom < ApplicationRecord
  belongs_to :country
  validates :warroom_name, presence: true

  def self.has_wmds
    where("contains_wmd = true")
  end

  def self.importance_filter(num)
    where("strategic_importance >= #{num}")
  end
end
