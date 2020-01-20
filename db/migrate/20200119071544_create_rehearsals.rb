class CreateRehearsals < ActiveRecord::Migration[6.0]
  def change
    create_table :rehearsals do |t|
      t.string :location
      t.string :city
      t.string :purpose
      t.datetime :date
      t.datetime :time


      t.timestamps null: false
    end
  end
end
