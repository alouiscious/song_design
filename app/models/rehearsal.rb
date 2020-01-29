class Rehearsal < ApplicationRecord
	has_many :user_rehearsals
	has_many :users, through: :user_rehearsals
	has_many :songnotes
	has_many :songs, -> {distinct}, through: :songnotes
	belongs_to :organizer, class_name: 'User'


	  # filtering for multiple song instances from the database
		def self.by_song(song_id)
			where(song: song_id)
		end
	
		# Filtering for recent or old
		def self.from_today
			where("created_at >=?", Time.zone.today.beginning_of_day)
		end
	
		def self.old_news
			where("created_at <?", Time.zone.today.beginning_of_day)
		end

end
