class CreateGamePersons < ActiveRecord::Migration
  def change
    create_table :game_persons do |t|
      t.belongs_to :game
      t.belongs_to :person
      
      t.timestamps
    end
    add_index :game_persons, :person_id
    add_index :game_persons, ["game_id", "person_id"], :unique => true
  end
end
