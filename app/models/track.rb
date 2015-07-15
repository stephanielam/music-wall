class Track < ActiveRecord::Base
  # validates :title, presence_of: true
  # validates :artist, presence_of: true
  # # validates :url, /^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/
  # validates :year, numericality: {only_integer: true}
  
  before_validation :set_user 
  before_create :set_votes

  def set_user
    self.user_id = 'Anonymous' if !(user_id?)
  end

  def set_votes
    self.votes = 0
  end

end