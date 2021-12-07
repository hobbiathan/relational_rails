class Warroom < ApplicationRecord
  belongs_to :country

  def self.has_wmds
    where("contains_wmd = true")
  end
end
