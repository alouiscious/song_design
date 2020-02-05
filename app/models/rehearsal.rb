class Rehearsal < ApplicationRecord
	has_many :user_rehearsals
	has_many :users, through: :user_rehearsals
	has_many :songnotes
	has_many :songs, -> {distinct}, through: :songnotes
	belongs_to :organizer, class_name: 'User'
	accepts_nested_attributes_for :songnotes 
	# adds songnotes attributes= has to belong to a song and has a song id.

# we have an organizer_id foreign-key/column which makes an assumption about the sequel query and the items will get from the query.
# this organizer is a user "SELECT * FROM Users WHERE Users.id = ? LIMIT 1", self.organizer_id 
# when we call organizer we get the user association with the organizer of the rehearsal. it is the user who organizer. 
# a class is like a table, and instance is like row. looking for info in the row and use method to specify the search

# when a rehearsal is created or viewed / create songotes to belong to a user or a song	  
# user types in the name of a song and then find or creates the song by title
#  a text_field with a datalist show the song name but accepts a title for a new song - need a new method in songnotes model to take in the song name

# <%= form_for @person do |f| %>
#   <%= f.label :first_name, "First Name" %>:
#   <%= f.text_field :first_name, list: 'first-name' %>
#   <datalist id="first-name">
#     <% Person.all.each do |person| %>
#       <option value="<%= person.first_name %>"></option>
#     <% end %>
#   </datalist>
#   <%= f.submit %>
# <% end %>

# You may also want to do distinct:

# <% Person.select(:first_name).distinct.each do |person| %>

end
