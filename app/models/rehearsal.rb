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
	
		def self.future
			where("created_at >=?", Time.zone.today.beginning_of_day)
		end
	
		def self.past
			where("created_at <?", Time.zone.today.beginning_of_day)
		end
	
		def self.by_user(organizer_id)
			where(user: organizer_id)
		end
	
		def self.by_location(location)
			where(location: location)
		end

		# def self.display_name(organizer_id)
		# 	where(user: organizer_id)
		# end
			
end
