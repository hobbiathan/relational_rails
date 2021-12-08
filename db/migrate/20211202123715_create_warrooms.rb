class CreateWarrooms < ActiveRecord::Migration[5.2]
  def change
    create_table :warrooms do |t|
      t.integer :strategic_importance
      t.string :warroom_name
      t.boolean :deadman_switch
      t.boolean :contains_wmd

      t.timestamps
    end
  end
end
