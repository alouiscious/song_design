class AddOrganizerIdToRehearsals < ActiveRecord::Migration[6.0]
  def change
    add_column :rehearsals, :organizer_id, :bigint
  end
end
