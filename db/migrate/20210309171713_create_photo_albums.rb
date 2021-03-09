class CreatePhotoAlbums < ActiveRecord::Migration[6.1]
  def change
    create_table :photo_albums do |t|
      t.string :photo_gallery
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
