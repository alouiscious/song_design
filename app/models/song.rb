class Song < ApplicationRecord
	has_many :songnotes
	has_many :rehearsals, through: :songnotes
  belongs_to :user
  
  validates :title, :key, presence: true
  validates :title, uniqueness: true

  accepts_nested_attributes_for :user, :reject_if => proc { |attrs| attrs[:name].blank? }
  accepts_nested_attributes_for :songnotes, :reject_if => proc { |attrs| attrs[:content].blank? }

  def songnote_ids=(ids)
    ids.each do |id|
      songnote = Songnote.find(id)
      self.songnotes << songnote
    end
  end

  def songnote_ids
    self.try(:songnote).try(:ids)

  end


  def musician_name=(name)
    musician = User.find_by(name: name)
    self.musician = musician
  end

  def musician_name
    self.try(:user).try(:name)  
  end

  def songnotes_attributes=(content)
    content.each do |id|
      songnote = Songnote.find(id)
      self.songnotes << songnote
    end
  end
  
  def songnotes_attributes
    self.songnotes_attributes.try(:content)
  end  
end
