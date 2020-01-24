class CreateSongNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :song_notes do |t|
      t.string :title
      t.text :content
      t.string :type
      t.belongs_to :song, counter_cache: true
      

      t.timestamps null: false
    end
  end
end
