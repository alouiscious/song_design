class CreateSongnotes < ActiveRecord::Migration[6.0]
  def change
    create_table :songnotes do |t|
      t.string :title
      t.text :content
      t.string :category
      t.belongs_to :song, counter_cache: true
      t.belongs_to :rehearsal, counter_cache: true
      t.belongs_to :user


      t.timestamps null: false
    end
  end
end
