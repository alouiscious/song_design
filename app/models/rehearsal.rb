class Rehearsal < ApplicationRecord
	has_many :user_rehearsals
	has_many :users, through: :user_rehearsals
	has_many :songnotes
	has_many :songs, -> {distinct}, through: :songnotes
	belongs_to :organizer, class_name: 'User', optional: true, foreign_key: :organizer_id
	
	accepts_nested_attributes_for :user_rehearsals, :reject_if => proc { |attrs| attrs[:user_id].blank? } 
	accepts_nested_attributes_for :songnotes, :reject_if => proc { |attrs| attrs[:title].blank? }

  def self.future
    where("date >=?", Time.zone.today.beginning_of_day)
  end

  def self.past
    where("date <?", Time.zone.today.beginning_of_day)
  end

  def self.by_user(organizer_id)
    where(organizer: organizer_id)
  end
end
