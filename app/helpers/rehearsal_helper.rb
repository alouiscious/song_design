# module RehearsalHelper
# CREATE A FORM HELPER FORTHE DATALIST IN REHEARSALS FOR THE SONG TITLE
# look commons and set the differences as arguments
#  helpers/absrtactions are best justified when you have at least three of one things

  # def display_song(song)
  #   user_rehearsal.rehearsal.nil? ? link_to("Add Rehearsal", edit_user_rehearsal_path(user_rehearsal)) : link_to(user_rehearsal.rehearsal_location, rehearsal_path(user_rehearsal.rehearsal))
  #   song.title
  # end

  # def display_rehearsal(song)
  #   song.rehearsal.nil? ? link_to("Add Rehearsal", edit_song_path(song)) : link_to(song.rehearsal_title, rehearsal_path(song.rehearsal))
  # end

  # # Display dropdown of rehearsals, with title if editing through nested
  # def rehearsal_select(song, path)
  #   if song.rehearsal && path == "nested"
  #     hidden_field_tag "song[rehearsal_id]", song.rehearsal_id
  #   else
  #     select_tag "song[rehearsal_id]", options_from_collection_for_select(Rehearsal.all, :id, :title)
  #   end
  # end

  # # Display title if editing through nested
  # def display_title(song, path)
  #   if song.rehearsal && path == "nested"
  #     song.rehearsal.title
  #   end
  # end
# end


