class CreateArtistProfiles < ActiveRecord::Migration
  def change
    create_table :artist_profiles do |t|
      t.string :genre
      t.string :location
      t.string :website
      t.integer :artist_id
      t.timestamps
    end
  end
end
