module SongnotesHelper
  # def song_id_field(songnote)
  #   if songnote.rehearsal.nil?
  #     select_tag "songnote[song_id]", options_from_collection_for_select(Song.all, :id, :title)
  #   else
  #     hidden_field_tag "songnote[song_id]", songnote.song_id
  #   end
  # end
  
  # def rehearsal_id_field(songnote)
  #   if songnote.rehearsal.nil?
  #     select_tag "songnote[rehearsal_id]", options_from_collection_for_select(Rehearsal.all, :id, :date)
  #   else
  #     hidden_field_tag "songnote[rehearsal_id]", songnote.rehearsal_id
  #   end
  # end
end

