class AddIndexAlbums < ActiveRecord::Migration
  def change
    add_index :albums, :band_id, unique: true
  end
end
