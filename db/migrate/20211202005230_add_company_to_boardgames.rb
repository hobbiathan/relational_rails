class AddCompanyToBoardgames < ActiveRecord::Migration[5.2]
  def change
    add_reference :boardgames, :company, foreign_key: true
  end
end
