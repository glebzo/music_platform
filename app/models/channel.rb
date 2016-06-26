class Channel < ActiveRecord::Base
  has_many :soundtracks, as: :soundtrackable
  has_many :albums, as: :albumable
  has_many :artists, as: :artistable

  def soundtracks_count
    self.soundtracks.size
  end

  def albums_count
    self.albums.size
  end
end
