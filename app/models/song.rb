class Song < ApplicationRecord
  has_many :song_notes
  belongs_to :rehearsal
  belongs_to :musician
end
