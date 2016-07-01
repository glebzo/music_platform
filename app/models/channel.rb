class Channel < ActiveRecord::Base
  has_attached_file :image, styles: { tiny: '60x60', medium: "256x256>", thumb: "150x150>" }, default_url: 'channels/defaults/img150.jpg'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_presence_of :name
  validates_presence_of :image

  has_many :soundtracks, as: :soundtrackable
  has_many :albums, as: :albumable
  has_many :artists, as: :artistable

  validates_presence_of :name

  def soundtracks_count
    self.soundtracks.size
  end

  def albums_count
    self.albums.size
  end
end
