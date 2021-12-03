class Company < ApplicationRecord
  validates :name, presence: true
  has_many :boardgames

  def self.most_recent
    order(created_at: :desc)
  end

  def boardgame_count
    boardgames.count
  end
end
