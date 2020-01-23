class Rehearsal < ApplicationRecord
	has_many :user_rehearsals
	has_many :users, through: :user_rehearsals
	has_many :songnotes
	has_many :songs, -> {distinct}, through: :songnotes
	belongs_to :organizer, class_name: 'User'
end
