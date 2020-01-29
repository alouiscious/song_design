class UserRehearsal < ApplicationRecord
  belongs_to :user
  belongs_to :rehearsal
end
