class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :games_invented
      t.boolean :independent

      t.timestamps
    end
  end
end
