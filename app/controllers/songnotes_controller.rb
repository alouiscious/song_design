class SongNotesController < ApplicationController
  
  before_action :authenticate_user!
  
  # def index
  #   @songnotes = Song_Notes.all
  # end

  # def show
  #   songnote = Song_Note.find(songnote_params)
  # end

  # def new
  #   songnote = Song_Note.new
  # end

  # def create
  #   songnote = Song_Note.new(songnote_params)
  #   songnote.save

  # end

  # def edit
  #   songnote = Song_Note.find([:id])

  # end

  # def update
  #   songnote = Song_Note.update(songnote_params)

  # end

  # def delete

  # end

  # def song_params
  #   require.params(:songnote).permit(:title, :content, :type, :song_id)
  # end  
end
