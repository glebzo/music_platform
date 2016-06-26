class Artist < ActiveRecord::Base
  has_many :soundtracks, as :soundtrackable

  belongs_to :artistable, polymorphic: true
end
