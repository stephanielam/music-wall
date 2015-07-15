class User < ActiveRecord::Base
  validates :username, uniqueness: true
  # def vote
  #   track.votes+=1
  #   track.save
  # end
end