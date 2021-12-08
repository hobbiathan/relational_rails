class AddCountryToWarrooms < ActiveRecord::Migration[5.2]
  def change
    add_reference :warrooms, :country, foreign_key: true
  end
end
