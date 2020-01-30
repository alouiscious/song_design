def display_rehearsal(user_rehearsal)
  user_rehearsal.rehearsal.nil? ? link_to("Add Rehearsal", edit_user_rehearsal_path(user_rehearsal)) : link_to(user_rehearsal.rehearsal_location, rehearsal_path(user_rehearsal.rehearsal))
end