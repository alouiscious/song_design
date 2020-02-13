class Song < ApplicationRecord
	has_many :songnotes
	has_many :rehearsals, through: :songnotes
  belongs_to :user, optional: true, foreign_key: :user_id
  
  validates :title, presence: true
  validates :title, uniqueness: true

  accepts_nested_attributes_for :songnotes, :reject_if => proc { |attrs| attrs[:content].blank? }

  def musician_name=(name)
    musician = User.find_by(name: name)
    self.musician = musician
  end

  def musician_name
    self.try(:user).try(:name)  
  end


end
