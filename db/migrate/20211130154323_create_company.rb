class CreateCompany < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.boolean :active
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :age_group
    end
  end
end
