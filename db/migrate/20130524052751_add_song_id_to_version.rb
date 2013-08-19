class AddSongIdToVersion < ActiveRecord::Migration
  def change
    add_column :versions, :song_id, :integer, :null => false
  end
end
