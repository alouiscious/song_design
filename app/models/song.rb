class Song < ApplicationRecord
	has_many :songnotes
	has_many :rehearsals, through: :songnotes
  belongs_to :user, optional: true, foreign_key: :user_id
  
  validates :title, :key, presence: true
  validates :title, uniqueness: true

  accepts_nested_attributes_for :songnotes, :reject_if => proc { |attrs| attrs[:content].blank? }
  accepts_nested_attributes_for :rehearsals, :reject_if => proc { |attrs| attrs[:location].blank? }
  # accepts_nested_attributes_for :users, :reject_if => proc { |attrs| attrs[:name].blank? }




  def musician_name=(name)
    musician = User.find_by(name: name)
    self.musician = musician
  end

  def musician_name
    self.try(:user).try(:name)  
  end

  # def songnotes_attributes=(content)
  #   content.each do |id|
  #     songnote = Songnote.find(id)
  #     self.songnotes << songnote
  #   end
  # end
  
  # def songnotes_attributes
  #   self.songnotes_attributes.try(:content)
  # end  
end
