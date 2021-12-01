class CreateBoardgame < ActiveRecord::Migration[5.2]
  def change
    create_table :boardgames do |t|
      t.string :name
      t.integer :rank
      t.boolean :out_of_print
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
