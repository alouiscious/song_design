# App Dev Process

This README would normally document whatever steps are necessary to get the
application up and running.

	# adds songnotes attributes= has to belong to a song and has a song id.

# we have an organizer_id foreign-key/column which makes an assumption about the sequel query and the items it will get from the query.
# this organizer is a user "SELECT * FROM Users WHERE Users.id = ? LIMIT 1", self.organizer_id 
# when we call organizer we get the user association with the organizer of the rehearsal. it is the user who is organizer. 
# a class is like a table, and instance is like row. looking for info in the row and use method to specify the search

# when a rehearsal is created or viewed / create songotes to belong to a user or a song	

# user enters the name of a song and then find or creates the song by title
#  a text_field with a datalist shows the song name but accepts a title for a new song - need a new method in songnotes model to take in the song name



# You may also want to do distinct:


Things you may want to cover:
  make sure you have a scope method
  user submittal
  nested resources
  attribute on the join model

* Ruby version
    Ruby 2.6.0  

* System dependencies
  gems:
    faker
    omniauth
    for devise
      bcrypt ~> 3.0
      orm_adapter ~> 0.1
      railties >= 4.1.0
      responders >= 0
      warden ~> 1.2.3

     
* Configuration
  rails new app used for Song Design app
  rails g resource utilized for MVC and migration files creation.
  model modifications include has_many, many_to_many, strftime formating, validations, optionals, partials, view helpers, and scope.

* Database creation
  besides the rails generator user to create the intital migration table, a seeds file and faker gem was utilized to create smple database content


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)
  Counter caches set for songs, users, songnotes.
  rt.

  Rails authentication useing the Devise gem.
  Configuration :
    Add config for action mailer in the config/development
  Database: devise generator creates a migration for the app's users (your auth account's) table.
  M-V-C:
  Models: Devise generator creates its model. use it to choose the authentication features of choice.
  Views: Devise generator create its folder of views. These can be customized and stylesheet
  Controllers: Devise used the gem to define its controllers. As a Rails engine, Devise runs as an app inside the app. It use the model layer to hook into the mother app.

  Routes: Use a helper that devise gives us to mount the routes within config/routes.rd (devise_for :users)

there are two destroy user session commands in the routes.rb and the applicationmhtml.erb layout. i commented out the routes command. does the routes.rb one control a destroy command for github auth, and the application.html control the destroy command for devise???
* Deployment instructions

* ...



using nested form

Dependencies (Gems/packages)
Configuration (environment variables/other stuff in config folder)
Database
Models
in parent model, add accepts_nested_attributes_for :child or define the attributes= method in the parent model:
def children_attributes=(attributes)
  something_custom
end
If you don’t do either of these things, then your fields for will not generate the right markup. You won’t see children_attributes[0][name] you’ll see something like children
Views
add fields_for :children to the parent model form view. Inside of the fields for, add fields for each of the attributes needed to create a valid child
Controllers
make sure that you whitelist the fields_for in strong params using
params.require(:parent).permit(children_attributes: [:first_field_name, :second_field_name, :third_field_name])



TODO LIST
fix songnote creation
fix linking a song to a song note 
fix linking a note to a rehearsal
fix note category and song in-use options

show attached songnotes in song view
decide how rehearsal show view works
  shows songs assign to a rehearsal
  show notes link to each song
  shows options to create a song note
  links to rehearsal edit view
  links back to ALL rehearsals
  shows organizer / links to organizer edits

rehearsal edit view shows
  link to edit organizer
  rehearsal edit fields
  add song to RH via links to song titles
  song title links to song and songnotes
  delete songs linked to rehearsal
  add a songnote to any song
  FIX - remove song note detail
  reformat rehearsal organizer details

  musisican show page
  show if musician is active/rehearsing
  show list of assigned rehearsals
  assigned rehearsals link to that rehearsals show page

