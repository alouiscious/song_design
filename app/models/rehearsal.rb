class Rehearsal < ApplicationRecord
	has_many :user_rehearsals
	has_many :users, through: :user_rehearsals
	has_many :songnotes
	has_many :songs, -> {distinct}, through: :songnotes
	belongs_to :organizer, class_name: 'User', optional: true
	
	# accepts_nested_attributes_for :user_rehearsals, :reject_if => proc { |attrs| attrs[:user_id].blank? } 
	accepts_nested_attributes_for :songs, :reject_if => proc { |attrs| attrs[:title].blank? }
	accepts_nested_attributes_for :songnotes, :reject_if => proc { |attrs| attrs[:title].blank? }
	accepts_nested_attributes_for :users, :reject_if => proc { |attrs| attrs[:name].blank? }
	accepts_nested_attributes_for :organizer, :reject_if => proc { |attrs| attrs[:name].blank? }

  def user_rehearsal_ids=(ids)
    ids.each do |id|
      user_rehearsal = User_Rehearsal.find(id)
      self.user_rehearsals << user_rehearsal
    end
  end

  def user_rehearsal_ids
    self.try(:user_rehearsal).try(:ids)
	end
	
	def songnote_ids=(ids)
    ids.each do |id|
      songnote = Songnote.find(id)
      self.songnotes << songnote
    end
  end

  def songnote_ids
    self.try(:songnote).try(:ids)
  end
end
