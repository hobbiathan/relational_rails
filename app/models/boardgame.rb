class Boardgame < ApplicationRecord
  validates :name, presence: true
  validates :rank, presence: true
  belongs_to :company
end
