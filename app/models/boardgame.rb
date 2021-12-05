class Boardgame < ApplicationRecord
  validates :name, presence: true
  validates :rank, presence: true
  belongs_to :company

  def self.games_sold_out
    where(out_of_print: true)
  end

  def self.alphabetical
    order(:name)
  end
end
