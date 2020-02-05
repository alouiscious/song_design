class Songnote < ApplicationRecord
	belongs_to :song
	belongs_to :rehearsal
	belongs_to :user, optional: true
	
	
	# many to many in use here. songnote is the join.
	# for use when there is no simple association method to call
	# current user by rehearsal
	
	def song_name
		self.try(:song).try(:title)
	end

	def song_name=(title)
		title = Song.find_by(title: title)
		self.title = title
	end
	
	private
	def is_title_case
		if title.split.any?{|w|w[0].upcase != w[0]}
			errors.add(:title, "Title must be in title case")
		end
	end
	
	def make_title_case
		self.title = self.title.titlecase
	end
	
		def self.by_user
			# takes in a user and return notes associted with the user
		end
	
		def self.by_rehearsal(rehearsal)
			# notes associted with a song from many rehearsal
			# rehearsal show page iterates over Songs allows access to songnotes (song.songnotes.by_rehearsal(@rehearsal))
			# the console command below would look like this - Songnote.by_rehearsal(arg)
		end
end
