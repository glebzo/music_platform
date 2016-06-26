class AddSoundtrackAttachment < ActiveRecord::Migration
  def up
    add_attachment :soundtracks, :soundtrack
  end

  def down
    add_attachment :soundtracks, :soundtrack
  end
end
