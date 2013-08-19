class CreateTitles < ActiveRecord::Migration
  def change
    create_table :titles do |t|
      t.integer :song_id, :null => false
      t.string :name, :null => false
      t.boolean :primary
      t.timestamps
    end
    add_index :titles, [:song_id, :primary], :unique => true
  end
end
