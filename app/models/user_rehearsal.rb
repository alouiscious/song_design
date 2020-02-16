class UserRehearsal < ApplicationRecord
  belongs_to :user
  belongs_to :rehearsal

  def self.by_user(organizer_id)
    where(organizer: organizer_id)
  end

end
