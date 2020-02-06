class RenameSongnotes < ActiveRecord::Migration[6.0]
  def change
    rename_table :song_notes, :songnotes
    
  end
end