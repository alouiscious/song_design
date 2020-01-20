class Musician < ApplicationRecord
  has_many :songs
  has_many :rehearsals through: :songs
  has_many :song_notes through: :songs
  belongs_to :user
end
