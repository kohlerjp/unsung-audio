class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :artist_id
      t.string :name
      t.integer :bumps,default:0
      t.string :location
      t.timestamps
    end
  end
end
