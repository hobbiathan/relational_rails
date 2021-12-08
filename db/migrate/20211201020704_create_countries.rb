class CreateCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :countries do |t|
      t.integer :military_power_rank
      t.string :country_name
      t.boolean :nuclear_power
      t.timestamps
    end
  end
end
