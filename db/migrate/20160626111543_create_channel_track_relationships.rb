class CreateChannelTrackRelationships < ActiveRecord::Migration
  def change
    create_table :channel_track_relationships do |t|
      t.belongs_to :soundtrack, index: true
      t.belongs_to :channel, index: true

      t.timestamps null: false
    end
  end
end
