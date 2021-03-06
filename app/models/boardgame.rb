class Boardgame < ApplicationRecord
  validates :name, presence: true
  validates :rank, presence: true
  validates :rank, length: { maximum: 30}
  validates :rank, numericality: { only_integer: true}
  belongs_to :company

  def self.games_sold_out
    where(out_of_print: true)
  end

  def self.alphabetical
    order(:name)
  end

  def self.limit_by_rank(num)
    where("rank > #{num}")
  end
end
