class CreateUserRehearsals < ActiveRecord::Migration[6.0]
  def change
    create_table :user_rehearsals do |t|
      t.references :user, null: false, foreign_key: true
      t.references :rehearsal, null: false, foreign_key: true

      t.timestamps 
    end
  end
end
