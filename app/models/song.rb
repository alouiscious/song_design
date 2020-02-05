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

  def songnotes_attributes=(content)
    content.each do |id|
      note = Songnote.find(id)
      self.songnotes << note
    end
  end
  
  def songnotes_attributes
    self.songnotes_attributes.try(:content)
  end  
end
