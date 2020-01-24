class Song < ApplicationRecord
	has_many :songnotes
	has_many :rehearsals, through: :songnotes
  belongs_to :user
  
  # validates :title, :key, presence: true
  # validates :title, uniqueness: true

end
