class CreateSoundtracks < ActiveRecord::Migration
  def change
    create_table :soundtracks do |t|
      t.string :name

      t.references :soundtrackable, polymorphic: true, index: true

      t.belongs_to :channel, index: true

      t.timestamps null: false
    end
  end
end
