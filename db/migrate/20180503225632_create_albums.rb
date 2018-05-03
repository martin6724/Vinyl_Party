class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :title
      t.string :image
      t.string :url

      t.timestamps
    end
  end
end
