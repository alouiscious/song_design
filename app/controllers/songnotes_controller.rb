class SongNotesController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    @songnotes = SongNote.all
  end

  def show
    songnote = SongNote.find(songnote_params)
  end

  def new
    songnote = SongNote.new
  end

  def create
    songnote = SongNote.new(songnote_params)
    songnote.save

  end

  def edit
    songnote = SongNote.find([:id])

  end

  def update
    songnote = SongNote.update(songnote_params)

  end

  def delete

  end

  def songnote_params
    require.params(:songnote).permit(:title, :content, :type, :song_id)
  end  
end
