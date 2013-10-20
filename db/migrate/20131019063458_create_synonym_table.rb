class CreateSynonymTable < ActiveRecord::Migration
  def change
    create_table :synonyms do |t|
      t.belongs_to :person
      t.string     :name
      
      t.timestamps
    end
  end
end
