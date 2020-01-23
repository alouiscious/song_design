class SongNote < ApplicationRecord
	belongs_to :song
	belongs_to :rehearsal
  belongs_to :user
end
