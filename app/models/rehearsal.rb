class Rehearsal < ApplicationRecord
	has_many :user_rehearsals
	has_many :users, through: :user_rehearsals
	has_many :songnotes
	has_many :songs, -> {distinct}, through: :songnotes
	belongs_to :organizer, class_name: 'User'

# we have an organizer id foreign-key/column which makes an assumption about the sequel query and the items will get from the query.
# this organizer is a user "SELECT * FROM Users WHERE Users.id = ? LIMIT 1", self.organizer_id 
# when we call organizer we get the user association with the organizer of the rehearsal. it is the user who organizer. 
# a class is like a table, and instance is like row. looking for info in the row and use method to specify the search

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
	
		def self.by_user(organizer)
			where(organizer_id: organizer.id)
		end
	
		def self.by_location(location)
			where(location: location)
		end

		# def self.display_name(user_id)
		# 	where(user: user_id)
		# binding.pry
		# end
			
end
