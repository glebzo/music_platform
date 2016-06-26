class Vote < ActiveRecord::Base
  belongs_to :listener
  belongs_to :soundtrack

  enum score: [:neutral, :like, :dislike]
end
