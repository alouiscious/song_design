class Song < ApplicationRecord
	has_many :songnotes
	has_many :rehearsals, through: :songnotes
  belongs_to :user
  
  validates :title, :key, presence: true
  validates :title, uniqueness: true

  def musician_name
    self.try(:user).try(:name)  
  end

  def musician_name=(name)
    musician = User.find_by(name: name)
    self.musician = musician
  end

end
