class CreateSongList < ActiveRecord::Migration
  
  def change
    create_table :tracks do |t|
      t.string :title
      t.string :artist
      t.string :url
      t.integer :users_id
      t.timestamps
    end
  end

end
