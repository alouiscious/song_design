class Rehearsal < ApplicationRecord
  has_many :songs
  has_many :musicians through: :songs
  has_many :songnotes through: :songs
end
