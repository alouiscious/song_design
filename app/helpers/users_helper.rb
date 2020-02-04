
module UsersHelper
  def display_user(song)
    song.user.nil? ? link_to("Add User", edit_song_path(song)) : link_to(song.user_name, user_path(song.user))
  end

  def user_select(song, path)
    if song.user && path == "nested"
      hidden_field_tag "song[user_id]", song.user_id
    else
      select_tag "song[user_id]", options_from_collection_for_select(User.all, :id, :name)
    end
  end

  def display_name(song, path)
    if song.user && path == "nested"
      song.user.name
    end
  end
end
