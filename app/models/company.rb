class Company < ApplicationRecord
  validates :name, presence: true
  validates :games_invented, length: { maximum: 30}
  validates :games_invented, numericality: { only_integer: true}
  has_many :boardgames, dependent: :destroy

  def self.most_recent
    order(created_at: :desc)
  end

  def boardgame_count
    boardgames.count
  end
end
