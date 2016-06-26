class Album < ActiveRecord::Base
  has_attached_file :image

  validates_presence_of :name
  has_many :soundtracks, as: :soundtrackable

  belongs_to :albumable, polymorphic: true, counter_cache: true
end
