class RenameAgeGroupToGamesListed < ActiveRecord::Migration[5.2]
  def change
    rename_column :companies, :age_group, :games_listed
  end

end
