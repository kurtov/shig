class CreateTableTwitts < ActiveRecord::Migration
  def change
    create_table :twitts do |t|
      t.string     :id_str
      t.datetime   :ddate
      t.string     :text
      t.string     :from_user
      t.belongs_to :game
      t.belongs_to :person
      t.integer    :result
      
      t.timestamps
    end

    add_index :twitts, :id_str, :unique => true
    add_index :twitts, :game_id
  end
end
