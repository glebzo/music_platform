class Soundtrack < ActiveRecord::Base
  has_attached_file :soundtrack
  has_attached_file :soundtrack_image
  has_many :votes

  belongs_to :soundtrackable, polymorphic: true, counter_cache: true

  belongs_to :channel
  # has_many :channels, class_name: 'Soundtrack', as: :soundtrackable

end
