class AddArtistToAlbum < ActiveRecord::Migration[5.2]
  def change
    add_column :albums, :artist, :string
  end
end
