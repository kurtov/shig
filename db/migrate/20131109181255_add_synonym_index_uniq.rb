class AddSynonymIndexUniq < ActiveRecord::Migration
  def change
    add_index :synonyms, [:person_id, :name], :unique => true
  end
end
