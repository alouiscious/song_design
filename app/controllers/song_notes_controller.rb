class SongNotesController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    @song_notes = Song_Notes.all
  end

  def show
    song_note = Song_Note.find(song_note_params)
  end

  def new
    song_note = Song_Note.new
  end

  def create
    song_note = Song_Note.new(song_note_params)
    song_note.save

  end

  def edit
    song_note = Song_Note.find([:id])

  end

  def update
    song_note = Song_Note.update(song_note_params)

  end

  def delete

  end

  def song_params
    require.params(:song_note).permit(:title, :content, :type, :song_id)
  end  
end
