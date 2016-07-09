class Artist < ActiveRecord::Base
  belongs_to :artistable, polymorphic: true

  # has_many :soundtracks, as :soundtrackable
end
