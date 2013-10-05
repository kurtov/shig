class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.datetime :ddateb
      t.datetime :ddatee
 
      t.timestamps
    end
  end
end
