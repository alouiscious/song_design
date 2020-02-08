class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :genre
      t.string :key
      t.string :in_style_of
      t.string :status
      t.belongs_to :rehearsal, counter_cache: true
      t.belongs_to :user, counter_cache: true

      t.timestamps null: false
    end
  end
end
