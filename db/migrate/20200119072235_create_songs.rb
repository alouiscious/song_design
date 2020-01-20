class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :genre
      t.string :key
      t.string :in_style_of
      t.boolean :status
      t.belongs_to :rehearsal, counter_cache: true
      t.belongs_to :musician, counter_cache: true

      t.timestamps null: false
    end
  end
end
