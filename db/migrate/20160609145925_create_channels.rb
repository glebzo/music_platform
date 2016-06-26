class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :name
      t.text :description
      t.integer :soundtracks_count, default: 0
      t.integer :albums_count, default: 0

      t.timestamps null: false
    end
  end
end
