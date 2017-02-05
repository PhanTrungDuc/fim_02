class CreatePlaylists < ActiveRecord::Migration[5.0]
  def change
    create_table :playlists do |t|
      t.string :name
      t.text :description
      t.string :name
      t.integer :views, default: 0
      t.attachment :avatar

      t.timestamps null: false
    end
  end
end
