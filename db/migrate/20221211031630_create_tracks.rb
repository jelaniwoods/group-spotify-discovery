class CreateTracks < ActiveRecord::Migration[7.0]
  def change
    create_table :tracks do |t|
      t.string :name
      t.string :image
      t.string :album_name
      t.string :url

      t.timestamps
    end
  end
end
