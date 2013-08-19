class RemoveIndexFromTitles < ActiveRecord::Migration
  def change
  	remove_index :titles, :column => [:song_id, :primary]
  end
end
