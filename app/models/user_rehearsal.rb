class UserRehearsal < ApplicationRecord
  belongs_to :user
  belongs_to :rehearsal

  def self.future
    where("created_at >=?", Time.zone.today.beginning_of_day)
  end

  def self.past
    where("created_at <?", Time.zone.today.beginning_of_day)
  end

  def self.by_user(user_id)
    where(user: user_id)
  end

end
