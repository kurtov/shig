class CreateTwittPeople < ActiveRecord::Migration
  def change
    create_table :twitt_people do |t|
      t.belongs_to :twitt
      t.belongs_to :person
      t.integer    :first
      
      t.timestamps
    end
    add_index :twitt_people, :person_id
    add_index :twitt_people, ["twitt_id", "person_id"], :unique => true
  end
end
