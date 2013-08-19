class AddIndexToTitles < ActiveRecord::Migration
  def change
		add_index :titles, [:song_id, :name], :unique => true
  end
end
