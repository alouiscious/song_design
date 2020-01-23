class Song < ApplicationRecord
	has_many :songnotes
	has_many :rehearsals, through: :songnotes
  belong_to :user
  
  validates :title, :key, presence: true
  # validates :title, uniquiness: true

end
