class RenamePersonsToPeople < ActiveRecord::Migration
  def change
    rename_table :persons, :people
    rename_table :game_persons, :game_people
  end
end
