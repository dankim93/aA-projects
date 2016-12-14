class AddIndexTracks < ActiveRecord::Migration
  def change
    add_index :tracks, :album_id, unique: true
  end
end
